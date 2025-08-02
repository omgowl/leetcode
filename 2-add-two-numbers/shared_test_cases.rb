require_relative "list_node"

def test_cases # rubocop:disable Metrics
  [
    { args: [to_list([2, 4, 3]), to_list([5, 6, 4])], solution: [7, 0, 8] },
    { args: [to_list([0]), to_list([0])], solution: [0] },
    {
      args: [to_list([9, 9, 9, 9, 9, 9, 9]), to_list([9, 9, 9, 9])],
      solution: [8, 9, 9, 9, 0, 0, 0, 1]
    },
    { args: [to_list([2, 9]), to_list([8])], solution: [0, 0, 1] },
    { args: [to_list([2]), to_list([3])], solution: [5] },
    { args: [to_list([5, 5]), to_list([5, 5])], solution: [0, 1, 1] }
  ]
end

def test_method_name
  :add_two_numbers
end

def to_list(arr)
  current = nil
  arr.reverse.each do |x|
    current = ListNode.new(x, current)
  end
  current
end
