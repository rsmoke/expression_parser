require_relative 'expression_tree'

class ExpressionParser
  def self.parse(expression)
    if constant?(expression) || variable?(expression)
      return ExpressionTree.new(root: expression,
                                left_child: nil,
                                right_child: nil)
    end
    if expression.include?('+')
      return ExpressionTree.new(root: '+',
                                left_child: ExpressionParser.parse(expression.split('+')[0]),
                                right_child: ExpressionParser.parse(expression.split('+')[1]))
    end
    operators = ['/', '*', '-', '^']
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

  def self.variable?(expression)
    expression.match?(/^[A-Za-z]+$/)
  end
end
