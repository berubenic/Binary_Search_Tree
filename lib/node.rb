# frozen_string_literal: true

class Node
  include Comparable

  attr_reader :value
  attr_accessor :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

  def <=>(other)
    node.value <=> other.value
  end
end
