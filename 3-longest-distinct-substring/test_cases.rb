def test_cases
  [
    { args: "abcabcbb", solution: 3 },
    { args: "bbbbb", solution: 1 },
    { args: "pwwkew", solution: 3 },
    { args: "dvdf", solution: 3 }
  ]
end

def test_method_name
  :length_of_longest_substring
end
