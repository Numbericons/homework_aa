class Stack
    attr_accessor :stack
    def initialize
        @stack = []
    end

    def push(el)
        stack << (el)
    end

    def pop
        stack.pop
    end

    def peek
        stack[-1]
    end
  end

  class Queue
    attr_accessor :que
    def initialize
      @que = []
    end

    def enqueue(el)
      que << el
    end

    def dequeue
      que.shift
    end

    def peek
      que.first
    end
  end

class Map
    attr_accessor :arr_map
    def initialize
        @arr_map = []
    end

    def set(key, value)
        @arr_map << [key, value] unless @arr_map.include?([key, value])
    end

    def get(key)
        @arr_map.each { |arr| return arr[1] if arr[0] == key }
    end

    def delete(key)
        # ret_arr = []
        arr_map.select! { |row| row unless row[0] == key }
        # ret_arr
    end
    
    def show
        @arr_map
    end
end

my = Map.new
p my.set("a", 1)
p my.set("b", 2)
p my.get("a")
p my.delete("b")
p my.show