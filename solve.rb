require 'pp'
require './digit_array'

Dir.glob('./snippets/**.rb') {|f| require f}
Dir.glob('./proofs/**.rb') {|f| require f}

def all_templates
  Templates.constants.collect do |tt|
    template_set = Templates.const_get(tt)
    (template_set.methods - Module.methods).collect do |t|
      [template_set, t]
    end
  end
end

def method_compose(solution_name, proposed_solution)
  puts solution_name
  puts proposed_solution.inspect
  "def __#{solution_name}(a, b)\n" +
  proposed_solution.
    collect{|t, m| "  #{Templates.const_get(t).send(m)}" }.
    join("\n") +
  "\nend"
end

def test(solution_name, proposed_solution, tests)
  method = method_compose(solution_name, proposed_solution)

  eval(method)

  perfection = true
  tests.each_slice(2) do |args, output|
    begin
      perfection = false unless send("__#{solution_name}".to_sym, *args) == output
    rescue => e
      perfection = output == e.class
    end
  end

  puts "#{method}\n\n" if perfection

  perfection
end

start_time = Time.now
max_lines = 10

Proofs.constants.each do |c|
  Proofs.const_get(c).proofs.each do |p|
    tests = c.send(p)
    digits = [nil, all_templates].flatten
    max = (digits.length**max_lines) - 1

    solution_count = 0
    (0..max).each do |i|
      solution = DigitArray.convert(i, digits, max_lines).compact
      solution_count += 1 if test(p.to_s.sub('prove_', ''), solution, tests)
      break if solution_count >= 100
    end
  end
end

puts "#{(Time.now - start_time).round(3)}s"
