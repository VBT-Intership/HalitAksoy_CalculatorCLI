import 'package:calculator_cli/tokenizer.dart';
import 'package:calculator_cli/iterator.dart';

const plus = '+';
const minus = '-';
const multiply = '*';
const divide = '/';

class Calculator {
  String expression;

  Calculator(this.expression);

  double calculate() =>
      _calculateExpression(Iterator(Tokenizer(expression).parseTokens()));

  double _calculateExpression(Iterator<String> iterator) {
    var result = double.parse(iterator.current);
    var currentOperator = iterator.next;

    while (currentOperator != null) {
      switch (currentOperator) {
        case plus:
          result += _calculateExpression(iterator..next);
          break;
        case minus:
          result -= _calculateExpression(iterator..next);
          break;
        case multiply:
          result *= double.parse(iterator.next);
          break;
        case divide:
          result /= double.parse(iterator.next);
          break;
      }
      currentOperator = iterator.next;
    }

    return result;
  }
}
