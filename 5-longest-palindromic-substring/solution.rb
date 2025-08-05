# @param {String} s
# @return {String}
def longest_palindrome(string)
  result = nil
  min_length = 0

  string.size.times do |idx|
    result, min_length = expand_from_center(idx - 1, idx + 1, string, result, min_length) # odd
    result, min_length = expand_from_center(idx, idx + 1, string, result, min_length) # even
  end

  result || string[0]
end

def expand_from_center(left, right, string, result, min_length)
  while left >= 0 && right < string.size && string[left] == string[right]
    if right - left + 1 > min_length
      result = string[left..right]
      min_length = result.size
    end

    right += 1
    left -= 1
  end
  [result, min_length]
end
