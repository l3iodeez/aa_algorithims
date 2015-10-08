def bad_two_sum?(array, sum)            # O(n^2)
  result = []
  array.each_with_index do |first, idx1|
    (idx1 + 1...array.count).each do |idx2|
      result << first + array[idx2]
    end
  end

  result.include?(sum)
end



def okay_two_sum?(array, sum)
  array.sort!
  result = nil
  (0...array.count).each do |idx1|
    sample = array[idx1]
    array2 = array.dup
    array2.delete_at(idx1)
    result = bsearch(array2, sum - sample)
    return !result.nil? if result
  end

  false
end


def bsearch(sorted_array, target)  #O(log(n))
  return nil if sorted_array.count == 0

  middle_idx = sorted_array.count / 2
  left = sorted_array.take(middle_idx)
  right = sorted_array.drop(middle_idx + 1)

  case target <=> sorted_array[middle_idx]
  when 0
    return middle_idx
  when -1
    return bsearch(left, target)
  when 1
    right_case = bsearch(right, target)
    return middle_idx + right_case unless right_case.nil?
    nil
  end

end
# bsearch(a, 4)
#
# arr = [0, 1, 5, 7]
# bad_two_sum?(arr, 6) # => should be true
# bad_two_sum?(arr, 10) # => should be false

def pair_sum?(array, target)
  frequencies = Hash.new(0)
  array.each { |el| frequencies[el] += 1 }
  array.each do |num|
    missing = target - num
    if missing == num
      return true if frequencies[missing] > 1
    else
      return true if frequencies[missing] > 0
    end
  end
  false

end
