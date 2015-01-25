def power_set set
  results = [[]] 
  for input_index in 0...set.size do
    currentResults = results.size; 
    inner_index = 0;
    while inner_index < currentResults
      results << (results[inner_index] + [set[input_index]])
      inner_index += 1
    end
  end 
  p results
end

power_set(['a', 'b', 'c'])
