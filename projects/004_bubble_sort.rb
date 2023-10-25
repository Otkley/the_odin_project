require 'pry-byebug'

=begin
# First solution
def bubble_sort(list)
  list.sort
end

bubble_sort([4,3,78,2,0,2])
=end

=begin
# Second solution
def bubble_sort(arr)
  n = arr.length
  swapped = true
  c = 0

  while swapped
    swapped = false
    (n - 1).times do |i|
      if arr[i] > arr[i + 1]
        c = arr[i + 1]
        arr[i + 1] = arr[i]
        arr[i] = c
        swapped = true
      end
    end
  end

  puts arr
end
=end

def bubble_sort(arr)
  n = arr.length
  swapped = true

  while swapped
    swapped = false
    (n - 1).times do |i|
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        swapped = true
      end
    end
  end

  puts arr
end

bubble_sort([4,3,78,2,0,2])