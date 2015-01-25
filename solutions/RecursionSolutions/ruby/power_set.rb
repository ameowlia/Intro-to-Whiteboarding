# Recursive Power Set Solution

def powerSet(set)
  return [set] if set.empty?
  p = set.pop
  subset = powerSet(set)  
  subset | subset.map { |x| x | [p] }
end

p powerSet(['a', 'b', 'c', 'd'])
