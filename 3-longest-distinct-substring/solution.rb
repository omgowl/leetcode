# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  result = 0
  idxs = {}
  ss_start = 0
  s.each_char.with_index do |c, i|
    if idxs[c] && idxs[c] >= ss_start
      result = [result, i - ss_start].max
      ss_start = idxs[c] + 1
    end
    idxs[c] = i
  end
  [result, s.size - ss_start].max
end
