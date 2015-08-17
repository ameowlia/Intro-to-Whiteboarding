# is_anagram?("hannah") => true
# is_anagram?("bye") => false

def is_anagram?(string1, string2)

  anagram = true

  if string1.length == string2.length

    for i in 0..string1.length-1
      if string1[i] == string2[-1-i]
      else
        anagram = false
      end
    end
  else
      anagram = false
  end
  p anagram
end

is_anagram?("hello", "olleh")
is_anagram?("hello", "bye")