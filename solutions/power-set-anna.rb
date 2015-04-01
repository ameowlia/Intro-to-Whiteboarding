

def get_power_set(array)
  power_sets = []
  popped_array = []
  until array.empty?
    popped_array << array.pop
    popped_array.each do |e|
      power_sets << array.dup.push(e)
    end
  end
  return power_sets
end

p get_power_set([1,2,3])
p get_power_set([1,2,3,4])