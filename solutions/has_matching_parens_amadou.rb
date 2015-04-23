# a) Write the method #has_matching_parentheses that takes a string as an argument and returns true if the string has valid parenthesis.
# Example: string = "(I(really)love (al(g)or)ithms)" => true
# string = ")hi(" => false

# b) What if there were different types of parentheses, like [], (), and {}?
# Examing = "[(])" => false

# FIRST, let's IMPLEMENT a STACK; We will need it in the 2nd part:
class Stack
  attr_accessor :store, :size
  def initialize
    @store = []
    @size = 0
  end

  def peek
    raise "Stack Underflow - The stack is empty" if self.is_empty?
    @store.last
  end

  def pop
    raise "Stack Underflow - The stack is empty" if self.is_empty?
    @size -= 1
    @store.pop
  end

  def push(element)
    @size += 1
    @store.push(element)
  end

  def size
    @size
  end

  def is_empty?
    @size == 0
  end
end

# a) Solution:
# PSEUDOCODE:
# We start with a variable counter that we set to 0. We then loop through each character in the string:
# 1) If we see a '(', we increment counter by 1. If we encounter a ')', we decrement it by 1.
# 2) During each iteration, if counter < 0, that means there are too many ')' and we return false.
# 3) When we are done looping through the characters, if counter > 0, then there are too many '(' and we return false
# 4) Otherwise we return true

def has_matching_parentheses(string)
    counter = 0
    chars = string.split("")
    chars.each do |char|
      if char == "("
        counter += 1
      elsif char == ")"
        counter -= 1
      end
      return false if counter < 0 # Too many '('
    end
    return false if counter > 0
    true
  end

# b) Solution
# PSEUDOCODE
# 1) Create a stack, 2 arrays (for the opening and closing symbols, i.e ('(', '[', '{') and (')', ']', '}')),
# and a hash where each opening symbol has as value the corresponding closing symbol.
# 2) We go through all the characters of the input string one at a time focusing only on the opening and closing symbols.
# i) If the character is an opening symbol, we push it to the stack
# ii) If the character is a closing symbol, we first check to see if the stack is empty, in which case we return false.
#   If the stack is not empty, we pop it. If the character is not the closing symbol of the popped symbol, we return false.
#   3) We repeat i) and ii) until the end of the string.
# 4) If at the end of the string we don't hit a mismatch, we return true

def has_matching_parentheses2(string)
  stack = Stack.new
  opening_symbols = ['(', '[', '{']
  closing_symbols = [')', ']', '}']
  hash_symbols = {'(' => ')', '[' => ']', '{' => '}'}
  string.split("").each do |character|
    if opening_symbols.include?(character)
      stack.push(character)
    end

    if closing_symbols.include?(character)
      return false if (stack.is_empty? || (hash_symbols[stack.pop] != character))
    end
  end
  true
end

string1 = "(I(really)love (al(g)or)ithms)"
string2 = ")hi("
string3 = "[a(b)c]{d}{e[f(g)(h)](i)}"
string4 = "[what? I (don't] understand) this :)"

p has_matching_parentheses(string1) == true
p has_matching_parentheses(string2) == false

p has_matching_parentheses2(string1) == true
p has_matching_parentheses2(string2) == false
p has_matching_parentheses2(string3) == true
p has_matching_parentheses2(string4) == false