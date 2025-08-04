require_relative "../../tests/base"
require_relative "../solution"

class Acceptance < Tests::Base
  solution :main, ->(args) { two_sum(*args) }

  test_case [[2, 7, 11, 15], 9], [0, 1]
  test_case [[3, 2, 4], 6], [1, 2]
  test_case [[3, 3], 6], [0, 1]
end
