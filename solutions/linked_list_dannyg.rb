require 'byebug'

class Node
  attr_accessor :value, :next
  def initialize(value)
    @value = value
  end
end


class LinkedList
  attr_accessor :head, :size

  def initialize
    @head = nil
    @size = 0
  end

  #walk through the list printing each node
  def print_list
    node = @head
    index = 0
    while node != nil
      print "Index: #{index} Value: #{node.value}\n"
      node = node.next
      index +=1
    end
  end


  # Walk through the list and once you reach the end add a new value. This method isnt very practical since linked lists major value comes from being able to add or remove at any index while maintaining constant space. Also an array could add to the end in constant time. This is a good first method just to fill up a list, test print, etc.
  # Time: O(n)
  # Space: O(1)
  def add_to_end(value)
    if @size == 0
      @head = Node.new(value)
      @size += 1
    else
      current = @head
      index = 0
      while index < @size
        current.next = Node.new(value) if current.next == nil
        current = current.next
        index += 1
      end
      @size += 1
    end
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
      @size += 1
      return
    end

    #special case if you are replacing the first item in the linked list (no node before)
    if index == 0
      node_to_add = Node.new(value)
      node_to_add.next = @head
      @head = node_to_add
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
      @size -=1
    end
  end


end


my_list = LinkedList.new
# my_list.add_at_index(7,3)
# my_list.print_list
# my_list.add_to_end(3)
# my_list.add_to_end(4)
# my_list.add_to_end(1)

my_list.add_at_index(4,0)
my_list.add_at_index(40,1)
my_list.add_at_index(500,2)
my_list.add_at_index(600,3)
my_list.add_at_index(700,4)
my_list.remove_at_index(5)
my_list.print_list
