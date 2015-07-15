Node = Struct.new(:value, :next) #creates a Node class with attr_accessors value & next

LinkedList = Struct.new(:head) do
  def each
    node = self.head #start with the head
    while node != nil #until we get to the end of the list
      yield node #process the bloc that gets passed in to .each
      node = node.next #go to the next node 
    end   
  end

  def search_value(term)
    each {|node| return node if node.value == term}
  end

  # to make modifications at an index, you really want the node before it.
  def search_index(replace_index)
    current_index = 0
    each do |node| 
      return node if current_index == (replace_index-1)
      current_index += 1
    end
  end

  def search_last
    each {|node| return node if node.next == nil}
  end

  def replace_head(node)
    self.head = node
  end

  def add_tail(value)
    search_last.next = Node.new(value, nil)
  end

  def add_at_index(node, index)
    search_index(index).next = Node.new(node, search_index(index+1))
  end

  def remove_at_index(index)
    search_index(index).next = search_index(index+2)
  end
end

node4 = Node.new('Four', nil)
node3 = Node.new('Three', node4)
node2 = Node.new('Two', node3)
node1 = Node.new('One', node2)


list = LinkedList.new(node1)
puts list
puts "Linked List"
list.each {|node| puts node.value}

puts "Linked List New Head"
list.replace_head(node2)
list.each {|node| puts node.value}

puts "Linked List New Tail"
list.add_tail('five')
list.each {|node| puts node.value}

puts "Linked List Add At Index"
list.add_at_index('beepboop', 2)
list.each {|node| puts node.value}

puts "Linked List Remove At Index"
list.remove_at_index(2)
list.each {|node| puts node.value}

