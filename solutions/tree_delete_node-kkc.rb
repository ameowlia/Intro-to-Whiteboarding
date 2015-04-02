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

# Deleting a Node --------------------------------------

# If node is a leaf, remove it
# If the node has one child that is not-empty, 'move up' the subtree
# If the node has two children that are not-empty,

def delete(target_value, bst)
  if isEmpty?(bst)
    return bst
  else
    if target_value < bst.root.value #delete from left subtree
      return make_tree(bst.root.value, delete(target_value, bst.left), bst.right)
    elsif target_value > bst.root.value #delete from right subtree
      return make_tree(bst.root.value, bst.left, delete(target_value, bst.right))
    else # item to be deleted is bst.root
      if isEmpty?(bst.left)
        return bst.right
      elsif isEmpty?(bst.left)
        return bst.left
      else
        return make_tree(smallestNode(bst.right), bst.left, removeSmallestNode(bst.right))
      end
    end
  end
end

def smallestNode(bst)
  if isEmpty?(bst.left) #substittue for isEmpty?
    return bst.left
  else
    smallestNode(bst.left)
  end
end

def removeSmallestNode(bst)
  if isEmpty?(bst.left) #substittue for isEmpty?
    return bst.right
  else
    return make_tree(bst.root.value, removeSmallestNode(bst.left), bst.right)
  end
end


# bst = delete(1, bst)
# bst = delete(3, bst)
# pp bst

bst = insert(5)
bst = insert(1, bst)
bst = insert(2, bst)
bst = insert(3, bst)
bst = insert(4, bst)
bst = insert(6, bst)
bst = insert(7, bst)
bst = insert(8, bst)
bst = insert(9, bst)
bst = insert(10, bst)
pp bst
p '-' * 50
bst = delete(3, bst)
pp bst