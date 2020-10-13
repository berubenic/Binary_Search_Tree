# frozen_string_literal: true

require_relative 'lib/node'
require_relative 'lib/tree'

tree_1 = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

tree_1.pretty_print

p tree_1.root

tree_2 = Tree.new([1, 2, 3, 4, 5, 6, 7, 8, 9])

tree_2.pretty_print
