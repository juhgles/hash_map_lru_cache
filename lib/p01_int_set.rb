class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
    @max = max
  end

  def insert(num)
    validate!(num)
    @store.shift
    @store << num
  end

  def remove(num)
    validate!(num)
    @store.delete(num)
  end

  def include?(num)
    validate!(num)
    @store.include?(num)
  end

  private

  def is_valid?(num)
    num.between?(0,@max)
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % num_buckets] << num
  end

  def remove(num)
    @store[num % num_buckets].delete(num)
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if num > (num_buckets - 1)
      resize!(num)
    end
    @store[num] << num
    @count += 1
  end

  def remove(num)
    @store[num].delete(num) if include?(num)
  end

  def include?(num)
    @store[num].include?(num)
  end

  def count
    @count
  end

  private


  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!(num)
    until num_buckets > num
      @store += Array.new(num_buckets){ Array.new }
    end
  end
end
