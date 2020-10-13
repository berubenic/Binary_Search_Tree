# frozen_string_literal: true

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

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
