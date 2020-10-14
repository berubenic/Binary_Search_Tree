# frozen_string_literal: true

# Node class
class Node
  include Comparable
  attr_reader :root
  attr_accessor :left, :right, :value

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

  def <=>(other)
    value <=> other.value
  end

  def inspect
    if left.nil? && right.nil?
      "Value: #{value} - Left Node: nil - Right Node: nil"
    elsif left.nil?
      "Value:#{value} - Left Node: nil - Right Node: #{right.value}"
    elsif right.nil?
      "Value:#{value} - Left Node: #{left.value} - Right Node: nil"
    else
      "Value: #{value} - Left Node: #{left.value} - Right Node: #{right.value}"
    end
  end
end
