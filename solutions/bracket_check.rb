# We need to come up with our own compiler.. and you're in charge of parens and brackets!
# Write a method called bracket_check(string) that takes in the code to be compiled as a String.
#
# For our code to be compiled, which could be thousands of lines of code, how do we match and brackets correctly?
# Counters don't seem like they'd work...
#
# Here is what some of our cool programming language looks like:
#
# (let* ((var1 10)
#        (var2 (+ var1 12)))
#   ;; But the definition of var1 could not refer to var2
#   )

class Stack
  def initialize
    @arr = []
  end

  def push(value)
      @arr << value
  end

  def pop
      @arr.pop
  end

  def empty?
      @arr.empty?
  end

  def peek
    @arr.last
  end
end


# O(n)
def bracket_check?(string)
  s = Stack.new

  string.each_char do |char|
    return false if s.empty? && %w|) }|.include?(char)   #handle edge case where close bracket is first

    s.push(char) if char == '(' || char == '{'

    if char == ')' || char == '}'
      current_bracket = s.pop
      return false if (char == ')' && current_bracket != '(') || (char == '}' && current_bracket != '{' )
    end
  end
  s.empty? # if stack is empty we have matched brackets
end

# Driver code ====================================

p bracket_check?('(let* ((var1 10)
        (var2 (+ var1 12)))
   ;; But the definition of var1 could not refer to var2
   )') == true

p bracket_check?('(((b)a))') == true
p bracket_check?('(({)}')    == false
p bracket_check?(')')        == false
p bracket_check?('(')        == false
p bracket_check?('((((((')   == false
p bracket_check?(')))))')    == false
p bracket_check?('')         == true
p bracket_check?('{}')       == true
p bracket_check?('({})')     == true
p bracket_check?('{()}')     == true
