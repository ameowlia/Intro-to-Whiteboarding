# Base Classes --------------------------------------

class Node
  attr_accessor :value
  def initialize(value)
    @value = value
  end
end

class Tree
  attr_accessor :root, :left, :right

  def initialize(root=nil, left=nil, right=nil)
    @root = root
    @left = left
    @right = right
  end
end

# Methods --------------------------------------

def empty_tree
  Tree.new
end

def make_tree(value, left, right)
  root = Node.new(value)
  Tree.new(root, left, right)
end

def isEmpty?(tree)
  tree.root ? false : true
end

def left(tree)
  tree.left
end

def right(tree)
  tree.right
end

def leaf(value)
  make_tree(value, empty_tree, empty_tree)
end

# Creating Binary Search Tree --------------------------------------
require 'pp'

def insert(new_value, bst = empty_tree)
  if isEmpty?(bst)
    return leaf(new_value)
  elsif new_value < bst.root.value
    return make_tree( bst.root.value, insert( new_value, bst.left), bst.right )
  elsif new_value > bst.root.value
    return make_tree( bst.root.value, bst.left, insert(new_value, bst.right) )
  else
    puts "Error."
  end
end

bst = insert(3)
bst = insert(5, bst)
bst = insert(1, bst)
bst = insert(2, bst)
bst = insert(4, bst)
# pp bst

# Is Valid Tree --------------------------------------
# Solution 1 --------------------------------------

def is_bst(bst = empty_tree)
  return isEmpty?(bst) || ( ( all_smaller(bst.left, bst.root.value) && is_bst(bst.left) ) && all_bigger(bst.right, bst.root.value) && is_bst(bst.right) )
end

def all_smaller(bst, value)
  return isEmpty?(bst) || (bst.root.value < value && all_smaller(bst.left, value) && all_smaller(bst.right, value))
end

def all_bigger(bst, value)
  return isEmpty?(bst) || (bst.root.value > value && all_bigger(bst.left, value) && all_bigger(bst.right, value))
end

# pp is_bst(bst)

# Solution 2 --------------------------------------
def is_bst?(bst = empty_tree, min, max)
  if isEmpty?(bst)
    return true
  elsif (bst.root.value > min) && (bst.root.value < max) && is_bst?(bst.left, min, bst.root.value) && is_bst?(bst.right, bst.root.value, max)
    return true
  else
    return false
  end
end

p "---------"
min = -1.0/0.0 #-Infinity
max = 1.0/0.0 #Infinity

p is_bst?(bst, min, max)
p is_bst(bst)
