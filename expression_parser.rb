# frozen_string_literal: true

require_relative 'expression_tree'

# Parses mathematical expressions into expression trees
class ExpressionParser
  def self.parse(expression)
    # constant or variable node
    if constant?(expression) || variable?(expression)
      return ExpressionTree.new(root: expression)
    end

    # explicit addition node
    if expression.include?('+')
      return ExpressionTree.new(
        root: '+',
        left_child: ExpressionTree.new(root: left_operand(expression, '+')),
        right_child: ExpressionTree.new(root: right_operand(expression, '+'))
      )
    end

    # explicit other operations node
    operators = ['/', '*', '-', '^']
    if operators.any? { |operator| expression.include?(operator) }
      return ExpressionTree.new(root: expression[1],
                                left_child: expression[0],
                                right_child: expression[2])
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
