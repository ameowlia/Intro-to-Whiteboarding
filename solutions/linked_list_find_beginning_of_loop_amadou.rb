require_relative 'linked_list_implementation_amadou'

# Given a circular linked list, implement an algorithm which returns the node at the beginning of the loop (cracking the coding interview)

# Example:
# Input: A -> B -> C -> D -> E -> C [the same C as earlier]
# Output: C

# SOLUTION
# We'll use Floyd's cycle-finding algorithm: http://en.wikipedia.org/wiki/Cycle_detection#Tortoise_and_hare

# PSEUDOCODE
# 1) We create 2 nodes, fast_pointer and slow_pointer
# 2) We move fast_pointer (respectively, slow_pointer) at a rate of 2 (resp. 1) nodes until they meet.
# 3) Error check: case where there is no collision, i.e. no loop
#    we return nil if either fast_pointer or fast_pointer.next is nil
# 4) At this point, the 2 pointers have met.
# We then move slow_pointer to the beginning of the list; each of them is now at the same distance from the beginning of the loop
# In a new iteration, we move them both at the same rate of 1 (moving them at this same rate means they will meet at the beginning of the loop).
# 5) At the end of the iteration above, both nodes point to the beginning of the loop.

def find_beginnig_of_loop(head)
  return nil if !head
  fast_pointer = head
  slow_pointer = head

  while fast_pointer && fast_pointer.next_node
    fast_pointer = fast_pointer.next_node.next_node
    slow_pointer = slow_pointer.next_node
    break if slow_pointer == fast_pointer # collision occurs
  end

  # Error check: case were there is no collision
  return nil if fast_pointer == nil || fast_pointer.next_node == nil

  slow_pointer = head
  while slow_pointer != fast_pointer
    fast_pointer = fast_pointer.next_node
    slow_pointer = slow_pointer.next_node
  end

  # At this point, both fast_pointer and slow_pointer point to the beginning of the loop; just return one of them
  slow_pointer
end
