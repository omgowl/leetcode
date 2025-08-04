require_relative "../list_node"

# @param {ListNode} list1
# @param {ListNode} list2
# @return {ListNode}
def add_two_numbers_memory(list1, list2)
  result = current = ListNode.new
  sum = 0

  while list1 || list2 || sum.positive?
    list1, sum = process_input_node(list1, sum)
    list2, sum = process_input_node(list2, sum)
    current.next = ListNode.new(sum % 10)
    current = current.next
    sum /= 10
  end

  result.next
end

def process_input_node(node, sum)
  [node&.next, node&.val.to_i + sum]
end
