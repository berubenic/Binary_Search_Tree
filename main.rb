# frozen_string_literal: true

require_relative 'lib/node'
require_relative 'lib/tree'

tree1 = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

tree1.pretty_print

p tree1.find(7)

tree1.insert(0)

tree1.insert(5000)

tree1.pretty_print

tree1.inorder
puts "\n"
tree1.preorder
puts "\n"
tree1.postorder
puts "\n"
p tree1.min_value_node

tree1.delete_node(8)

tree1.pretty_print

p tree1.level_order

p tree1.rec_level_order

p tree1.height
