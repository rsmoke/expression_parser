require_relative 'expression_tree'

class ExpressionParser
  def self.parse(expression)
    # constant or variable node
    if constant?(expression) || variable?(expression)
      return ExpressionTree.new(root: expression,
                                left_child: nil,
                                right_child: nil)
    end
    # 4x + 2y
    # left_child: whats to the left of the +
    # right_child: whats to the right of the +

    # explicit addition node
    if expression.include?('+')

      return ExpressionTree.new(root: '+',
                                  left_child: ExpressionTree.new(
                                    root: whats_to_the_left_of_the(expression, '+'),
                                    ),
                                  right_child: ExpressionTree.new(
                                    root: whats_to_the_right_of_the(expression, '+'),
                                    ))
    end


    # explicit other operations node
    operators = ['/', '*', '-', '^']
    if operators.any? { |op| expression.include?(op) }
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

  def self.whats_to_the_left_of_the(expression, operator)
    expression.split(operator).first
  end

  def self.whats_to_the_right_of_the(expression, operator)
    expression.split(operator).last
  end

end
