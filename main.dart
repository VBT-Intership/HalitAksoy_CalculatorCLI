import 'package:calculator_cli/calculator.dart';

const argumentsError = 'Please enter the your math expression!';
const sytaxError = 'Syntax Error!';
const requiredArgumentsSize = 1;

void main(List<String> arguments) {
  if (!checkArgumentsisCorrect(arguments)) {
    print(argumentsError);
    return;
  }

  try {
    print(Calculator(arguments.first).calculate());
  } catch (e) {
    print(sytaxError);
  }
}

bool checkArgumentsisCorrect(List<String> arguments) =>
    arguments.length == requiredArgumentsSize;
