# frozen_string_literal: true

require 'rspec'

class Expression
  attr_reader :root, :left_child, :right_child

  def parse(expression)
    @root = '*'
    if explicit_multiplication?(expression)
      parse_explicit_multiplication(expression)
    else
      parse_implicit_multiplication(expression)
    end
  end

  private

  def explicit_multiplication?(expression)
    expression.include?('*')
  end

  def parse_explicit_multiplication(expression)
    @left_child, @right_child = expression.split('*')
  end

  def parse_implicit_multiplication(expression)
    index = expression.index(/[a-zA-Z]/)
    @left_child = expression[0...index]
    @right_child = expression[index..]
  end
end

RSpec.describe 'expression parser' do
  context 'When the expression involves explicit multiplication operator' do
    it 'assigns the multiplication operator * to root' do
      expression = Expression.new
      expression.parse('2*x')
      root = expression.root
      expect(root).to eq('*')
    end

    it 'assigns the first operand to left child' do
      expression = Expression.new
      expression.parse('2*x')
      left_child = expression.left_child
      expect(left_child).to eq('2')
    end

    it 'assigns the second operand to right child' do
      expression = Expression.new
      expression.parse('2*x')
      right_child = expression.right_child
      expect(right_child).to eq('x')
    end
  end

  context 'When the expression involves implicit multiplication operator' do
    it 'assigns the multiplication operator * to root' do
      expression = Expression.new
      expression.parse('2x')
      root = expression.root
      expect(root).to eq('*')
    end

    it 'assigns the first operand to left child' do
      expression = Expression.new
      expression.parse('2x')
      left_child = expression.left_child
      expect(left_child).to eq('2')
    end

    it 'assigns the second operand to right child' do
      expression = Expression.new
      expression.parse('2x')
      right_child = expression.right_child
      expect(right_child).to eq('x')
    end
  end
end
