require_relative 'p05_hash_map_solution.rb'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map.include?(key)
      #do something
    else
      call_proc = @prc.call(key)
      if @map.count == @max
        @map.delete(@store.first.key)
      end
      @map.set(key,call_proc)
      @store.insert(key,call_proc)
      call_proc
    end
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
  end

  def update_link!(link)
    # suggested helper method; move a link to the end of the list
  end

  def eject!
  end
end
