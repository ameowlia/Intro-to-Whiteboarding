def reversed_string(string)
  arr = []
  i = string.length
  j = 0
  while i > 0 do
    arr[j] = string[i-1]
    j += 1
    i -= 1
  end
  return arr.join
end

puts reversed_string("hello") == "olleh"