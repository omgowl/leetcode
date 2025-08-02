class ListNode
  attr_accessor :val, :next

  def initialize(value = 0, next_node = nil)
    @val = value
    @next = next_node
  end

  def ==(other)
    return false if other.class != self.class

    to_s == other.to_s
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
