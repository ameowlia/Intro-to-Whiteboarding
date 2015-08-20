def comp_sums array
  i = 1
  left_sum = array.first
  total = array.reduce :+

  while i < array.length
    total_sans_i = total - array[i]
    if total_sans_i % 2 == 0
      return i if left_sum == total_sans_i / 2
    end
    left_sum += array[i]
    i += 1
  end
  nil
end

puts comp_sums([0,0,1,1,0,1]) == 3
puts comp_sums([0,3,0,1,1,0,1]) == 2
puts comp_sums([5,0,5,9,2,2,1,9,14]) == 6
puts comp_sums([1,2,3,4,5]) == nil
puts comp_sums([]) == nil
puts comp_sums([1]) == nil
