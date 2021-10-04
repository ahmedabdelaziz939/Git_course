import 'dart:io';

void main(List<String> arguments) {
  Calc();
}

class Calc {
  Calc() {
    bool run = true;
    while (run) {
      var num1 = int.parse(stdin.readLineSync() ?? "");
      var op = stdin.readLineSync();
      var num2 = int.parse(stdin.readLineSync() ?? "");
      if (num1 == 0) {
        print('exited');
        break;
      }
      switch (op) {
        case '+':
          print('$num1 + $num2 = ${num1 + num2}');
          run = false;
          break;

        case '-':
          print('$num1 - $num2 = ${num1 - num2}');
          break;

        case '*':
          print('$num1 * $num2 = ${num1 * num2}');
          break;

        case '/':
          print('$num1 / $num2 = ${num1 / num2}');
          break;

        case '%':
          print('$num1 % $num2 = ${num1 % num2}');
          break;

        default:
          // If the operator is other than +, -, * or /, error message is shown
          print("Error! operator is not correct");
          break;
      }
    }
  }
}
