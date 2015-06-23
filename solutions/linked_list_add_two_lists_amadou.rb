require_relative 'linked_list_implementation_amadou'

# You have two numbers represented by a linked list, where each node contains a single digit.
# The digits are stored in reversed order, such that the 1’s digit is at the head of the list.
# Write a function, add_two_lists, that adds the two numbers and returns the sum as a linked list.
# Example:
# Input: (3 => 1 => 5), (5 => 9 => 2) # represent 513, 295
# Output: 8 => 0 => 8 # represent 808

def add_two_lists(head1, head2)
  add_two_lists_helper(head1, head2, 0)
end

def add_two_lists_helper(head1, head2, carry)
  return nil if !head1 && !head2

  sum = carry

  sum += head1.value if head1
  sum += head2.value if head2

  value = sum % 10
  carry = sum / 10

  result_head = Node.new(value)

  next_head1 = (head1 == nil ? nil : head1.next_node)
  next_head2 = (head2 == nil ? nil : head2.next_node)

  remaining_nodes = add_two_lists_helper(next_head1, next_head2, carry)

  result_head.next_node = remaining_nodes

  result_head
end


# TEST DRIVE
f = Node.new(2, nil)
e = Node.new(9, f)
d = Node.new(5, e)

c = Node.new(5, nil)
b = Node.new(1, c)
a = Node.new(3, b)

list1 = LinkedList.new(a) # 3 -> 1 -> 5 (represents number 513)
list2 = LinkedList.new(d) # 5 -> 9 -> 2 (represents number 295)

print "list1 is: "
list1.each {|node| print node.value, " => "}

print "nil\nlist2 is: "
list2.each {|node| print node.value, " => "}

list_sum = add_two_lists(a, d) # 8 -> 0 -> 8 (represents 808 i.e 513 + 295)
print "nil\nlist1 + list 2 gives: "
LinkedList.new(list_sum).each {|n| print n.value, " => "}
puts "nil"
