#Write the function that will sort a Stack only using the methods below. No using #sort.

def sort_it(unsorted_ary)
  sorted_ary = []
  first_element = unsorted_ary.pop
  sorted_ary.push(first_element)

  until unsorted_ary.empty? == true
    if sorted_ary.peek <= unsorted_ary.peek
      popped = unsorted_ary.pop
      sorted_ary.push(popped)
    else
      switch1 = unsorted_ary.pop
      switch2 = sorted_ary.pop
      unsorted_ary.push(switch2)
      sorted_ary.push(switch1)
    end
  end
  return sorted_ary
end

#Tests
stack = [3, 1, 4, 2]
p sort_it(stack) #=> [1, 2, 3, 4]