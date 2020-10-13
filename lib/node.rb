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
    value <=> other.value
  end

  def inspect
    "Value: #{value} - Left Node: #{left.value} - Right Node: #{right.value}"
  end
end
