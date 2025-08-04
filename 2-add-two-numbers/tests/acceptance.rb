require_relative "../../tests/base"
require_relative "../list_node"
require_relative "../memory/solution"
require_relative "../speed/solution"

class Acceptance < Tests::Base
  def self.list(*nodes)
    current = nil
    nodes.reverse.each do |x|
      current = ListNode.new(x, current)
    end
    current
  end

  solution :memory, ->(args) { add_two_numbers_memory(*args) }
  solution :speed, ->(args) { add_two_numbers_speed(*args) }

  test_case [list(2, 4, 3), list(5, 6, 4)], list(7, 0, 8)
  test_case [list(0), list(0)], list(0)
  test_case [list(9, 9, 9, 9, 9, 9, 9), list(9, 9, 9, 9)], list(8, 9, 9, 9, 0, 0, 0, 1)
  test_case [list(2, 9), list(8)], list(0, 0, 1)
  test_case [list(2), list(3)], list(5)
  test_case [list(5, 5), list(5, 5)], list(0, 1, 1)
end
