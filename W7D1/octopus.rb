FISH_ARR = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish
    longest = ""
    FISH_ARR.each do |word|
        FISH_ARR.each do |word_in|
            longest = word if word.length > word_in.length && word.length > longest.length
        end
    end
    longest
end

# p sluggish
class Array
  #this should look familiar
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    midpoint = count / 2
    sorted_left = self.take(midpoint).merge_sort(&prc)
    sorted_right = self.drop(midpoint).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end

# class Array
#   # Write a new `Array#merge_sort` method; it should not modify the
#   # array it is called on, but create a new sorted array.
#   def merge_sort(&prc)
#     return self if self.length <= 1
#     mid = self.length / 2
#     left = self[0...mid].merge_sort(&prc)
#     right = self[mid..-1].merge_sort(&prc)
#     Array.merge(left,right,&prc)
#   end

#   private
#   def self.merge(left, right, &prc)
#     merged = []
#     prc ||= Proc.new { |el1, el2| el1 <=> el2 }
#     until left.empty? || right.empty?
#       if prc.call(left.first, right.first) == -1
#         merged << left.shift
#       else
#         merged << right.shift
#       end
#     end
#     merged + left + right
#   end

# end

def dominant
    # arr = FISH_ARR.dup
    # ret = arr.merge_sort
    # ret
    prc = Proc.new { |x, y| y.length <=> x.length }
    FISH_ARR.merge_sort(&prc)[0]
end

def nlogn_biggest_fish(fishes)
  # sort the array longest to shortest
  prc = Proc.new { |x, y| y.length <=> x.length }
  #return the first element
  fishes.merge_sort(&prc)[0]
end

p "next 2 are dominant"
p dominant
p nlogn_biggest_fish(FISH_ARR)

def clever_octo
    longest = ""
    FISH_ARR.each { |word| longest = word if longest.length < word.length }
    longest
end
p "next 1 is clever"
p clever_octo