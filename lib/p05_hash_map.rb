require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    hashed_key = hash_key(key)
    return false if get(key).nil?
    true
  end

  def set(key, val)
    hashed_key = hash_key(key)
    @store[hashed_key].insert(key,val)
  end

  def count
    @count = 0
    @store.each do |bucket|
      @count += bucket.length
    end
    @count
  end

  def hash_key(key)
    hashed_key = key.hash % num_buckets
  end

  def get(key)
    hashed_key = hash_key(key)
    p "hashed key: #{hashed_key}"
    bucket = @store[hashed_key]
    bucket.get(key)
  end

  def delete(key)
    hashed_key = hash_key(key)
    @store[hashed_key].remove(key)
  end

  def each
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    until count < num_buckets
      @store += Array.new(num_buckets) { LinkedList.new }
    end
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
