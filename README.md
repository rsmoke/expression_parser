# Expression Parser

A Ruby library for parsing mathematical expressions into abstract syntax trees (AST). This library handles both explicit and implicit multiplication, addition, and supports constants and variables.
From chapter two of Jason Swett's Professional Rails Testing book.

## Features

- Parses simple mathematical expressions into tree structures
- Supports operators: `+`, `*`, `/`, `-`, `^`
- Handles both explicit (2*x) and implicit (2x) multiplication
- Recognizes constants and variables
- Built with Ruby

## Installation

Clone the repository:

```sh
git clone https://github.com/yourusername/expression-parser.git
```

## Usage

```ruby
require_relative 'expression_parser'

# Parse simple expressions
expression = ExpressionParser.parse('2*X')
puts expression.root        # => "*"
puts expression.left_child  # => "2"
puts expression.right_child # => "X"

# Parse complex expressions
complex = ExpressionParser.parse('2+3*X')
puts complex.root          # => "+"
```

## Class Structure

### ExpressionTree

The `ExpressionTree` class represents nodes in the abstract syntax tree:

```ruby:expression_tree.rb
startLine: 1
endLine: 11
```

### ExpressionParser

The main parser class that converts string expressions into tree structures:

```ruby:expression_parser.rb
startLine: 3
endLine: 33
```

## Testing

The project uses RSpec for testing. Run the tests with:

```bash
rspec expression_parser_spec.rb
```

Test cases cover:
- Explicit multiplication (2*x)
- Implicit multiplication (2x)
- Addition operations (2+x)
- Constants
- Complex expressions with multiple operators

Example test cases can be found in:

```ruby:expression_parser_spec.rb
startLine: 4
endLine: 68
```

## Limitations

- Currently supports basic arithmetic operations
- Parentheses handling is not yet implemented
- Limited to single-character variables and integer constants

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE file](LICENSE.md) for details.

## Author

Rick Smoke - rsmokeUM
