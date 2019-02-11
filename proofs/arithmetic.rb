module Proofs
  module Arithmetic
    def self.proofs
      methods - Module.methods - [:proofs]
    end

    def self.prove_addition
      [
        [0, 0], 0,
        [1, 1], 2,
        [1, -1], 0,
        [5, 123], 128,
        [1.1, 2.3], 3.4
      ]
    end

    def self.prove_subtraction
      [
        [0, 0], 0,
        [1, 1], 0,
        [1, -1], 2,
        [5, 123], -118,
        [1.1, 2.3], -1.1999999999999997
      ]
    end

    def self.prove_multiplication
      [
        [0, 0], 0,
        [1, 1], 1,
        [1, -1], -1,
        [5, 123], 615,
        [1.1, 2.3], 2.53
      ]
    end

    def self.prove_division
      [
        [0, 0], ZeroDivisionError,
        [1, 1], 1,
        [1, -1], -1,
        [5, 123], 0,
        [1.1, 2.3], 0.47826086956521746
      ]
    end
  end
end
