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

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
