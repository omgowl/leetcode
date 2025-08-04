class ListNode
  attr_accessor :val, :next

  def initialize(value = 0, next_node = nil)
    @val = value
    @next = next_node
  end

  def ==(other)
    return to_s == other.join if other.is_a?(Array)
    return to_s == other.to_s if other.is_a?(ListNode)

    false
  end

  protected

  def to_s
    s = ""
    current = self

    while current
      s += current.val.to_s
      current = current.next
    end

    s
  end
end
