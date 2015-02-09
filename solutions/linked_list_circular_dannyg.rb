require 'byebug'
#byebug works just like debugger, supports ruby >= 2.0

class Node
  attr_accessor :value, :next
  def initialize(value)
    @value = value
  end
end


class LinkedList
  attr_accessor :head, :size, :tail

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  #walk through the list printing each node
  def print_list
    node = @head
    index = 0
    while index < @size
      print "Index: #{index} Value: #{node.value}\n"
      node = node.next
      index +=1
    end

  end

  # Having a circular link list, specifically having a tail variable, makes adding to the end a constant time operation!
  # Time: O(1)
  # Space: O(1)
  def add_to_end(value)
    if @size == 0
      @head = Node.new(value)
      @tail = @head
      @head.next = @tail
    else
      @tail.next = Node.new(value)
      @tail = @tail.next
      @tail.next = @head
    end
    @size += 1
  end

  #Time: O(n)
  #Space: O(1)
  def add_at_index(value, index)
    if index < 0 or index > @size+1
      p "Index #{index} is invalid. The linkedlist is #{@size} nodes long. Please enter index between 0 and #{@size +1}"
      return
    end
    if @size == 0
      @head = Node.new(value)
      @tail = @head
      @head.next = @tail
      @size +=1
      return
    end

    #special case if you are replacing the first item in the linked list (no node before)
    if index == 0
      node_to_add = Node.new(value)
      node_to_add.next = @head
      @head = node_to_add
      # this may be unnecesary, need to test
      @tail.next = @head
      @size +=1
    elsif index == size
      #adding at end, tail is affected
      @tail.next = Node.new(value)
      @tail = @tail.next
      @tail.next = @head
      @size +=1
    else
      walking_counter = 0
      node_just_before = @head
      while walking_counter < (index-1)
        node_just_before = node_just_before.next
        walking_counter += 1
      end
      node_just_after = node_just_before.next
      node_just_before.next = Node.new(value)
      node_just_before.next.next = node_just_after
      @size +=1
    end
  end

  # Remove at index thought process.. To remove a node at a particular index I simply need to make the node before it point to the node after it. There will be no way to access it anymore and garbage collection should delete it. You can only look forward and never backwards in a linked list. With this in mind if I walk all the way to the node I want to remove I can't look back to modify the node before it like I need to. I will walk to the node just before the one I want to delete and make its 'next' pointer hop over the node I wish to delete and point at its next.
  def remove_at_index(index)
    #error handling
    if @size == 0
      p "Link list is empty, nothing to remove."
      return
    end
    if index < 0 or index > @size-1
      p "Index #{index} is invalid for removal. The linkedlist is #{@size} nodes long. Please enter index between 0 and #{@size-1}"
      return
    end

    #special case for removing first index, nothing behind it to worry about just switch head
    if index == 0
      @head = @head.next
      @size -= 1

    else
      walking_counter = 0
      node_just_before = @head
      while walking_counter < (index-1)
        node_just_before = node_just_before.next
        walking_counter += 1
      end
      node_to_remove = node_just_before.next
      node_just_before.next = node_to_remove.next
      if index == (size-1)
        # just removed tail need to update
        @tail = node_just_before
      end
      @size -=1
    end
  end

  # recursive print reverse solution, pass in self.head as an argument to avoid resetting it in the function on recursive calls.
  # Time: O(n) - we have to touch each node at least once
  # Space: O(n) - stack is growing as we go deeper. Each call is one more variable, n levels deep
  def print_reverse_order(node = self.head)
    if node == @tail
      return
    end
    print_reverse_order(node.next)
    p node.value
  end

  # Reverse the linked list in place. We need 3 pointers: one for the current node, one for the previous node, and one for the next node (since we mess up current.next when we flip it around).
  # Time: O(n) we have to walk thru the whole list once
  # Space: O(1) constant because we've only made 3 new variables that get updated each time we move forward along the list
  # It really helps to draw out a 3 node linked list and walk thru each step of this method with it for visual aid, keeping track of each variables value as you go
  def reverse_list
    if @size ==0
      p "List is empty, nothing to reverse"
      return
    end
    new_tail = @head
    current_node = @head
    previous_node = nil
    index =0
    while index < @size
      next_node = current_node.next
      current_node.next = previous_node
      previous_node = current_node
      current_node = next_node
      index +=1
    end
    @head = previous_node
    @tail = new_tail
    @tail.next = @head
  end



end


my_list = LinkedList.new
# my_list.add_at_index(7,3)
# my_list.print_list
my_list.add_at_index(3,0)
my_list.add_at_index(7,1)
my_list.add_at_index(9,2)
my_list.add_at_index(11,2)
my_list.add_at_index(13,2)

my_list.remove_at_index(2)
my_list.print_list
p my_list.tail.value
my_list.reverse_list
# my_list.reverse_list
my_list.print_list

# my_list.print_list
