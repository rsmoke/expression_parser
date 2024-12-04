# frozen_string_literal: true

require_relative 'expression_tree'

# Parses mathematical expressions into expression trees
class ExpressionParser
  def self.parse(expression)
    # constant or variable node
    if constant?(expression) || variable?(expression)
      return ExpressionTree.new(root: expression)
    end

    # explicit other operations node
    ['+','/', '*', '-', '^'].each do |operator|
      if expression.include?(operator)
        return ExpressionTree.new(root: operator,
                                  left_child: left_operand_tree(expression, operator),
                                  right_child: right_operand_tree(expression, operator))
      end
    end

    # implicit multiplication node
    ExpressionTree.new(root: '*',
                       left_child: expression[0],
                       right_child: expression[1])
  end

  private
  def self.constant?(expression)
    expression.match?(/^\d+$/)
  end

  def self.variable?(expression)
    expression.match?(/^[A-Za-z]+$/)
  end

  def self.left_operand_tree(expression, operator)
    ExpressionTree.new(root: expression.split(operator).first)
  end

  def self.right_operand_tree(expression, operator)
    ExpressionTree.new(root: expression.split(operator).last)
  end

#   BODMAS
# B: Brackets
# O: Order (powers or roots)
# D: Division
# M: Multiplication
# A: Addition
# S: Subtraction
end
