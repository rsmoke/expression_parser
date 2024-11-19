require_relative 'expression_tree'

class ExpressionParser
  def self.parse(expression)
    if constant?(expression)
      return ExpressionTree.new(root: expression,
                                left_child: nil,
                                right_child: nil)
    end
    operators = ['*', '/', '+', '-', '^']
    if operators.any? { |op| expression.include?(op) }
      return ExpressionTree.new(root: expression[1],
                                left_child: expression[0],
                                right_child: expression[2])
    end
    ExpressionTree.new(root: '*',
                       left_child: expression[0],
                       right_child: expression[1])
  end

  def self.constant?(expression)
    expression.match?(/^\d+$/)
  end
end