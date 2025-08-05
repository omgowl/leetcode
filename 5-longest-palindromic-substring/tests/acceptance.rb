require_relative "../../tests/base"
require_relative "../solution"

class Acceptance < Tests::Base
  solution :main, ->(args) { longest_palindrome(*args) }

  test_case "babad", "bab"
  test_case "cbbd", "bb"
  test_case "baab", "baab"
  test_case "abs", "a"
  test_case "xaabacxcabaaxcabaax", "xaabacxcabaax"
end
