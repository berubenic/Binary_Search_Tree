# frozen_string_literal: true

require_relative 'lib/node'
require_relative 'lib/tree'

tree = Tree.new([29, 19, 12, 9, 15, 24, 22, 27, 54, 39, 34, 41, 67, 62, 92])

tree.pretty_print

puts tree.balanced?

puts tree.preorder
puts tree.postorder
puts tree.inorder

# unbalance tree

tree.insert(101)
tree.insert(102)
tree.insert(103)
tree.insert(104)
tree.insert(105)
tree.insert(106)

tree.pretty_print

puts tree.balanced?

# rebalance tree
tree.rebalance
tree.pretty_print

puts tree.balanced?

puts tree.preorder
puts tree.postorder
puts tree.inorder
