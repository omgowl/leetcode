# @param {ListNode} list1
# @param {ListNode} list2
# @return {Integer[]}
def add_two_numbers(list1, list2)
  result = []
  sum = 0

  while list1 || list2 || sum.positive?
    list1, sum = process_input_node(list1, sum)
    list2, sum = process_input_node(list2, sum)
    result << (sum % 10)
    sum /= 10
  end

  result
end

def process_input_node(node, sum)
  [node&.next, node&.val.to_i + sum]
end
