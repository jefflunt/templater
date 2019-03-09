module Templates
  module Arithmetic
    def self.addition(lhs='a', rhs='b')
      "(#{lhs}) + (#{rhs})"
    end

    def self.subtraction(lhs='a', rhs='b')
      "(#{lhs}) - (#{rhs})"
    end

    def self.multiplication(lhs='a', rhs='b')
      "(#{lhs}) * (#{rhs})"
    end

    def self.division(lhs='a', rhs='b')
      "(#{lhs}) / (#{rhs})"
    end
  end
end
