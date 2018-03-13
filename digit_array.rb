module DigitArray
  def self.convert(n, digits, places)
    base = digits.length
    result = [digits[0]] * places
    remaining = n

    (-places..-1).each do |i|
      place_value = base**(i.abs-1)
      digit = remaining / place_value
      result[i] = digits[digit]
      remaining -= digit*place_value
    end

    result
  end
end
