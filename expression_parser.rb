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
                                  left_child: ExpressionTree.new(root: left_operand(expression, operator)),
                                  right_child: ExpressionTree.new(root: right_operand(expression, operator)))
      end
    end

    # implicit multiplication node
    ExpressionTree.new(root: '*',
                       left_child: expression[0],
                       right_child: expression[1])
  end

  def self.constant?(expression)
    expression.match?(/^\d+$/)
  end

  def self.variable?(expression)
    expression.match?(/^[A-Za-z]+$/)
  end

  def self.left_operand(expression, operator)
    expression.split(operator).first
  end

  def self.right_operand(expression, operator)
    expression.split(operator).last
  end
end
