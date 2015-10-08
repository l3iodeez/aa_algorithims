class Array
  def dumb_min
    each do |num1|      # time complexity O(n^2)
      return num1 if all? { |num2| num1 <= num2 }
    end
  end

  def my_min            #time complexity O(n)
    result = first

    each do |num1|
      result = num1 if num1 < result
    end

    result
  end

  def dumb_sub_sum
    subs = []
    (0...count).each do |index1|      #O(n^2) here
      (index1...count).each do |index2|
        subs << self[index1..index2]
      end
    end
    max = subs.first.inject{ |sum, num| sum + num}
    subs.each do |sub_array|        #O(n^2) here
      sub_sum = sub_array.inject { |sum, num| sum + num }
      max = sub_sum if sub_sum > max
    end
    max
  end           #total time complexity O(2n^2)


  def sub_sum
    test_sum = 0
    max = self.first


    self.each do |num|
      test_sum += num
      test_sum = 0 if test_sum < 0
      max = test_sum if test_sum > max
    end

    max
  end


end


[5, -7, 3, 4].sub_sum
[5, -6, 3, 4].sub_sum
[2, 3, -6, 3, 4].sub_sum
[2, 3, -3, 3, 4].sub_sum
max_sum
current_max_sum


list.dumb_sub_sum
