class LinkedList

  def [](position)
    current_node = @head
    counter = 0
    until counter == position
      current_node = current_node.next
      counter += 1
    end
    current_node
  end

  def insert(node = Node.new, position)
    node.next = self[position]
    if position == 0
      self.head = node
    else
      self[position - 1].next = node
    end
  end

  def remove(position)
    removed = self[position]
    if position == 0
      @head = @head.next if @head != nil
    else
      self[position - 1].next = self[position + 1]
    end
    removed
  end

end