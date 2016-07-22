require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(item)
    hashed_item = hash_item(item)
    p "num, hashed_item: #{item}, #{hashed_item}"
    if hashed_item > (num_buckets - 1) || @count > (num_buckets - 1)
      resize!(hashed_item)
    end
    @store[hashed_item] << hashed_item
    @count += 1
  end

  def hash_item(item)
    item.hash % 20
  end

  def remove(num)
    hash_num = hash_item(num)
    @store[hash_num].delete(hash_num) if include?(num)
    @count -= 1
  end

  def include?(num)
    p "store is #{@store}"
    p "num is #{num}"
    hash_num = hash_item(num)
    p "hash num is #{hash_num}"
    if hash_num > num_buckets || num.is_a?(Symbol)
      return false
    end
    @store[hash_num].include?(hash_num)
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
