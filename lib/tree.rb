# frozen_string_literal: true

require 'pry'

# Tree class
class Tree
  attr_reader :root

  def initialize(array)
    arr = array.sort.uniq
    @root = build_tree(arr)
  end

  def build_tree(arr, start = 0, last = arr.length - 1)
    return nil if start > last

    mid = (start + last) / 2
    root = Node.new(arr[mid])
    root.left = build_tree(arr, start, mid - 1)
    root.right = build_tree(arr, mid + 1, last)

    root
  end

  def find(key, root = @root)
    return nil if root.nil?

    return root if root.value == key

    if root.value < key
      find(key, root.right)
    else
      find(key, root.left)
    end
  end

  def insert(key, root = @root)
    return Node.new(key) if root.nil?

    return root if root.value == key

    if root.value < key
      root.right = insert(key, root.right)
    else
      root.left = insert(key, root.left)
    end

    root
  end

  def inorder(root = @root)
    return if root.nil?

    inorder(root.left)
    print "#{root.value} "
    inorder(root.right)
  end

  def preorder(root = @root)
    return if root.nil?

    print "#{root.value} "
    preorder(root.left)
    preorder(root.right)
  end

  def postorder(root = @root)
    return if root.nil?

    postorder(root.left)
    postorder(root.right)
    print "#{root.value} "
  end

  def height(root = @root)
    return -1 if root.nil?

    left = height(root.left)
    right = height(root.right)
    left < right ? right + 1 : left + 1
  end

  def level_order(root = @root)
    result = []
    return result if root.nil?

    queue = []
    queue << root

    until queue.empty?
      level_size = queue.length
      level = []
      level_size.times do
        node = queue.shift
        level << node.value
        queue << node.left unless node.left.nil?
        queue << node.right unless node.right.nil?
      end
      result << level
    end

    result.flatten
  end

  def rec_level_order(root = @root, result = [], level = 0)
    return result.flatten unless root

    result << [] if result.length == level

    result[level] << root.value
    rec_level_order(root.left, result, level + 1)
    rec_level_order(root.right, result, level + 1)
  end

  def min_value_node(root = @root)
    current = root

    current = current.left until current.left.nil?
    current.value
  end

  def delete_node(key, root = @root)
    return if root.nil?

    if key < root.value
      root.left = delete_node(key, root.left)
    elsif key > root.value
      root.right = delete_node(key, root.right)
    else
      return root.right if root.left.nil?
      return root.left if root.right.nil?

      root.value = min_value_node(root.right)
      root.right = delete_node(root.value, root.right)
    end
    root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
