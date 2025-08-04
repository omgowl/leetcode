# @param {String} s
# @return {Integer}
def length_of_longest_substring(string)
  result = left = 0
  position = {}

  string.each_char.with_index do |char, right|
    if position[char] && position[char] >= left
      result = [result, right - left].max
      left = position[char] + 1
    end

    position[char] = right
  end

  [result, string.size - left].max
end
