class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end
end

class LinkedList
  def initialize
    @length = 0
    @active_link = Link.new
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @active_link = @active_link.prev until @active_link.prev.nil?
    @active_link
  end

  def last
    @active_link = @active_link.next until @active_link.next.nil?
    @active_link
  end

  def empty?
    @length == 0
  end

  def get(key)
    @active_link.first
    raise "That key is not in the link list" unless include?(key, val)
    until @active_link.key == key
      @active_link = @active_link.next
    end
    return @active_link
  end

  def include?(key)
    @active_link.first
    until @active_link == last
      return true if active_link.key == key
    end
    false
  end

  def insert(key, val)
    new_link = Link.new(key, val)
    if @active_link.key.nil?
      @active_link = new_link
    else
      @active_link.next = new_link
      new_link.prev = @active_link
      @active_link = new_link
    end
    @length += 1
  end

  def remove(key)
    to_remove = get(key)
    @length -= 1
    prev_link = to_remove.prev
    next_link = to_remove.next
    prev_link.next = next_link
    next_link.prev = prev_link
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
