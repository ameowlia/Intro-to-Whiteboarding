
# Question 2

class LinkedList

  def zip(other_list)
    output_list = LinkedList.new(left.remove(0))
    left = self
    right = other_list
    output_list.head.next = right.remove(0)
    take_from_left = true
    until left.head == nil && right.head == nil
      if take_from_left
        output_list.add_node_to_end(left.remove(0))
      else
        output_list.add_node_to_end(right.remove(0))
      end
      take_from_left = !take_from_left
    end
    output_list
  end

end
