# frozen_string_literal: true

require 'rspec'
require_relative '../expression_parser'

RSpec.describe ExpressionParser do
  context 'the expression involves explicit multiplication operator 2*x' do
    it 'returns with root *' do
      expression = ExpressionParser.parse('2*X')
      expect(expression.root).to eq('*')
    end
    it 'returns with left child 2' do
      expression = ExpressionParser.parse('2*X')
      expect(expression.left_child).to eq('2')
    end
    it 'returns with right child X' do
      expression = ExpressionParser.parse('2*X')
      expect(expression.right_child).to eq('X')
    end
  end
  context 'the expression involves implicit multiplication operator 2x' do
    it 'returns with root *' do
      expression = ExpressionParser.parse('2X')
      expect(expression.root).to eq('*')
    end
    it 'returns with left child 2' do
      expression = ExpressionParser.parse('2X')
      expect(expression.left_child).to eq('2')
    end
    it 'returns with right child X' do
      expression = ExpressionParser.parse('2X')
      expect(expression.right_child).to eq('X')
    end
  end
  context 'the expression involves explicit addition operator 2+x' do
    it 'returns with root +' do
      expression = ExpressionParser.parse('2+X')
      expect(expression.root).to eq('+')
    end
    it 'returns with left child 2' do
      expression = ExpressionParser.parse('2+X')
      expect(expression.left_child.root).to eq('2')
    end
    it 'returns with right child X' do
      expression = ExpressionParser.parse('2+X')
      expect(expression.right_child.root).to eq('X')
    end
  end
  context 'the expression is a constant' do
    it 'returns the constant as root' do
      expression = ExpressionParser.parse('2')
      expect(expression.root).to eq('2')
    end
  end
  context 'the expression involves complex operators (4x + 2y)' do
    it 'returns with root +' do
      expression = ExpressionParser.parse('4X+2Y')
      expect(expression.root).to eq('+')
    end
    it 'returns with left child 4X' do
      expression = ExpressionParser.parse('4X+2Y')
      expect(expression.left_child.root).to eq('4X')
    end
    it 'returns with right child 2Y' do
      expression = ExpressionParser.parse('4X+2Y')
      expect(expression.right_child.root).to eq('2Y')
    end
  end
  xcontext 'the expression involves multiple operators (2 + 3 + X)' do
    it 'returns with root  ( + + )' do
      expression = ExpressionParser.parse('2+3+X')
      expect(expression.root).to eq('+')
    end
    it 'returns with left child 2' do
      expression = ExpressionParser.parse('2+3+X')
      expect(expression.left_child.root).to eq('2')
    end
    it 'returns with right child 3' do
      expression = ExpressionParser.parse('2+3+X')
      expect(expression.right_child.root).to eq('3+X')
    end
  end
end

