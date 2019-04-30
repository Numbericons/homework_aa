class LRUCache
    def initialize(size)
        @size = size
        @struct = []
    end

    def count
      # returns number of elements currently in cache
      @struct.count
    end

    def add(el)
        @struct.delete(el) if @struct.include?(el)
        @struct << el
            
        @struct.shift if count > @size
      # adds element to cache according to LRU principle
    end

    def show
      # shows the items in the cache, with the LRU item first
      struct
    end

    private
    # helper methods go here!
    attr_accessor :size, :struct
  end
  johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)
  p "expected '2' to output below:"
  p johnny_cache.count # => returns 2
  
  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})
  
  p "expected 'prints [[1, 2, 3, 4], :ring_of_fire, 'I walk the line', {:a=>1, :b=>2, :c=>3}]' to output below:"
  p johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]