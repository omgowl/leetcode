require_relative "../../tests/base"
require_relative "../solution"

class Acceptance < Tests::Base
  solution :main, ->(args) { length_of_longest_substring(*args) }

  test_case "abcabcbb", 3
  test_case "bbbbb", 1
  test_case "pwwkew", 3
  test_case "dvdf", 3
end
