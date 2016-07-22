class Fixnum
  # Fixnum#hash already implemented for you
  def hash
    (self * 23) % 8
  end

end

class Array
  def hash
    arr = [532]
    self.each_with_index do |el, idx|
      if el.is_a?(Array)
        arr << 654
      else
        arr << ((el * 23 + idx) % 8)
      end
    end
    arr.inject(:*)
  end
end

class String
  def hash
    arr = [43]
    self.chars.each_with_index do |let, idx|
      arr << ((let.ord * 5 + idx) + self.length % 4)
    end
    arr.inject(:*)
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    arr = [43]
    self.each do |key, val|
      arr << ((val.ord * 5 + key.to_s.ord) + self.keys.length % 4)
    end
    arr.inject(:*)
  end
end
