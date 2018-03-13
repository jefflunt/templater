require 'pp'
require './digit_array'
require './arithmetic'
require './prove_arithmetic'

def test(solution_name, proposed_solution, tests)
  method = "def __#{solution_name}(a, b)\n" + 
           proposed_solution.
             collect{|t| "  #{Arithmetic.send(t)}" }.
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
max_lines = 4

ProveArithmetic.proofs.each do |p|
  tests = ProveArithmetic.send(p)
  digits = [nil, Arithmetic.methods - Module.methods].flatten
  max = (digits.length**max_lines) - 1

  (0..max).each do |i|
    solution = DigitArray.convert(i, digits, max_lines).compact
    test(p.to_s.sub('prove_', ''), solution, tests)
  end
end

puts "#{(Time.now - start_time).round(3)}s"
