require 'pp'

class Node
  attr_accessor :value, :pointer

  def initialize(value = nil, pointer = nil)
    @value = value
    @pointer = nil
  end
end


class LinkedList
  attr_accessor :head

  def initialize(head_node = nil)
    @head = head_node
  end

  def add(new_node)
    if @head == nil
      @head = new_node
    else
      current_node = @head
      until current_node.pointer == nil
        current_node = current_node.pointer
      end
      current_node.pointer = new_node
    end
  end

  def remove
    return "Nothing to remove" if @head == nil

    last_node = @head
    until last_node.pointer == nil
      second_to_last_node = last_node
      last_node = last_node.pointer
    end
    second_to_last_node.pointer = nil
    # uncomment to see de-referenced nodes
    # pp second_to_last_node
    # pp last_node
  end

  def print_list
    current_node = @head
    index = 0
    while current_node
      print "Index #{index}, value: #{current_node.value} ==>"
      current_node = current_node.pointer
      index += 1
    end
  end

  def add_at_index(new_node, index)
    current_node = @head
    next_index = 1
    while next_index <= index
      if next_index == index
        new_node.pointer = current_node.pointer
        current_node.pointer = new_node
      end
      current_node = current_node.pointer
      next_index += 1
    end
  end

  def remove_at_index(remove_index)
    current_node = @head
    next_index = 1
    while next_index <= remove_index
      next_node = current_node.pointer
      current_node.pointer = current_node.pointer.pointer
      next_node.pointer = nil
      next_index += 1
    end
  end
end

first_node = Node.new(1)
p first_node.value == 1
p first_node.pointer == nil

our_list = LinkedList.new(first_node)
p our_list.head.value == 1

second_node = Node.new(2)
third_node = Node.new(3)
our_list.add(second_node)
our_list.add(third_node)
p our_list.print_list
puts

p "--Add At Index--" * 5
new_node = Node.new(7)
our_list.add_at_index(new_node, 2)
p our_list.print_list
puts
p "--Remove At Index--" * 5
our_list.remove_at_index(1)
p our_list.print_list
