def anagrams(string)
  result = []
  return [string] if string.length <= 2 && string == string.reverse
  return [string, string.reverse] if string.length == 2
  string.each_char.with_index do |letter, index| # O(n)

    sub_case = string.slice(0, index) + string.slice(index + 1, string.length)
    anagrams(sub_case).each do |sub_ana|    # O(n^n-1) or something really really big
      anagram1 = letter + sub_ana
      anagram2 = sub_ana + letter
      result << anagram1
      result << anagram2
    end
  end
  result.uniq.sort!
end

def first_anagram(string1, string2)    # O(n^n)
  anagrams(string1).include?(string2)
end

def second_anagram(string1, string2) # O(n^2)
  arr1 = string1.split("")
  arr2 = string2.split("")


  arr1.each_with_index do |letter1, idx1|
    arr2.each_with_index do |letter2, idx2|
      if letter1 == letter2
        arr1[idx1] = nil
        arr2[idx2] = nil
      end
    end
  end
  arr1.join("").length == 0 && arr2.join("").length == 0

end

def third_anagram(string1, string2)       # O(n)
  string1.split("").sort == string2.split("").sort
end

def fourth_anagram(string1, string2)  #O(2n) => O(n)
  count1 = Hash.new(0)
  string1.split("").each { |letter| count1[letter] += 1 }
  string2.split("").each do |letter|
    return false if count1[letter] != string2.count(letter)
  end

  true
end






fourth_anagram("gizmo", "sally")
fourth_anagram("elvis", "lives")
