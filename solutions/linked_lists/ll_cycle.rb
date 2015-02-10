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

  def terminates?
    slow_node = @head
    fast_node = @head.pointer.pointer

    while true
      if fast_node.nil? or fast_node.pointer.nil?
        puts "LinkedList is acyclic."
        return true
      elsif fast_node == slow_node or fast_node.pointer == slow_node
        puts "LinkedList cycles."
        return false
      else
        slow_node = slow_node.pointer
        fast_node = fast_node.pointer.pointer
      end
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

puts '--Acyclic--' * 10
p our_list.terminates? == true
puts

puts '--Cyclic--' * 10
fourth_node = Node.new(4)
fourth_node.pointer = first_node
p our_list.add(fourth_node)
p our_list.terminates? == false
