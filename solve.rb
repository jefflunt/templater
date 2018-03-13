require 'pp'
require './digit_array'
require './templates/arithmetic'
require './proofs/arithmetic'

def test(solution_name, proposed_solution, tests)
  method = "def __#{solution_name}(a, b)\n" + 
           proposed_solution.
             collect{|t| "  #{Templates::Arithmetic.send(t)}" }.
             join("\n") +
           "\nend"

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

Proofs::Arithmetic.proofs.each do |p|
  tests = Proofs::Arithmetic.send(p)
  digits = [nil, Templates::Arithmetic.methods - Module.methods].flatten
  max = (digits.length**max_lines) - 1

  solution_count = 0
  (0..max).each do |i|
    solution = DigitArray.convert(i, digits, max_lines).compact
    solution_count += 1 if test(p.to_s.sub('prove_', ''), solution, tests)
    break if solution_count >= 100
  end
end

puts "#{(Time.now - start_time).round(3)}s"
