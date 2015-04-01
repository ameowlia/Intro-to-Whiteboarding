class Node
  attr_accessor :value, :next

  def initialize(value = nil, next_node = nil)
    @value = value
    @next = next_node
  end
end


class LinkedList
  attr_accessor :head

  def initialize(head = Node.new)
    @head = head
  end

  def add_node_to_end(node = Node.new)
    current_node = @head
    until current_node.next == nil
      current_node = current_node.next
    end
    current_node.next = node
  end
end