# Recursive Power Set Solution

def powerSet(set)
  return [set] if set.empty?
  p = set.pop
  subset = powerSet(set)  
  subset | subset.map { |x| x | [p] }
end

p powerSet(['a', 'b', 'c', 'd'])

#solution without the confusing |

def powerSet(array)
  return [[]] if array.empty?
  set = powerset(array[1..-1])
  set.map{|i| [array.first] + i} + set
end
p powerSet(['a', 'b', 'c', 'd'])
