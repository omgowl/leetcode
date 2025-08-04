require_relative "../../tests/base"
require_relative "../solution"

class Acceptance < Tests::Base
  solution :main, ->(args) { find_median_sorted_arrays(*args) }

  test_case [[1, 2], [3, 4, 5]], 3
  test_case [[4, 5], [1, 2, 3]], 3
  test_case [[1, 3], [2, 4]], 2.5
  test_case [[2, 4], [1, 3]], 2.5
  test_case [[1, 1, 1, 1], [2, 2, 2, 2]], 1.5
  test_case [[2, 2, 2, 2], [1, 1, 1, 1]], 1.5
end
