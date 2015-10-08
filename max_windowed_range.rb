require_relative 'my_stack.rb'
require 'byebug'

def naive_windowed_max_range(array, window)
  current_max_range = nil

  array.each_index do |idx|
    test_arr = array.slice(idx, window)
    test_range = test_arr.max - test_arr.min
    current_max_range = test_range if current_max_range == nil ||
      test_range > current_max_range
  end

  current_max_range
end

#want constant time n^0
def windowed_max_range(array, window)
  max_difference = 0
  stackqueue = StackQueue.new
  i = 0
  window.times do
    stackqueue.enqueue(array[i])
    i += 1
  end

  #  byebug

  until i == array.count
    stackqueue.dequeue
    stackqueue.enqueue(array[i])
    i += 1
    test_difference = stackqueue.max - stackqueue.min
    max_difference = test_difference if test_difference > max_difference
  end
  max_difference


end
#
# windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
#
# [1, 3, 2, 5, 4, 8], 3 == 3
# first, we look at [1, 3, 2]
# then its [3,2,5]
# then its [2,5,4]
# then its [5,4,8]
