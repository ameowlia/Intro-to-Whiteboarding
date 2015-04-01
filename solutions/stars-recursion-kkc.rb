def star(num)
  return "done" if num == 0
  puts "*" * num
  star(num-1)
end

# p star(3)
# ***
# **
# *
# "done"

def star_forward_backward(num, start = 1)
  if start < num
    puts "*" * start
    star_forward_backward(num, start + 1)
  elsif num > 0
    puts "*" * num
    star_forward_backward(num - 1, start)
  else
    return 'done'
  end
end

p star_forward_backward(5)

# *
# **
# ***
# **
# *
# "done"