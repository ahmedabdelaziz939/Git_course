import 'dart:io';

void main() {
  Calc calculator = Calc();
  bool run = true;
  while (run) {
    var num1 = int.parse(stdin.readLineSync()??"");
    var op = stdin.readLineSync();
    var num2 = int.parse(stdin.readLineSync()??"");
    if (num1 == 0) {
      print('exited');
    } else {
      switch (op) {
        case '+':
          print(calculator.Add(num1, num2));
          break;

        case '-':
          print(calculator.Sub(num1, num2));
          break;

        case '*':
          print(calculator.Mult(num1, num2));
          break;

        case '/':
          print(calculator.Divid(num1, num2));
          break;
      }
    }
  }
}

class Calc {
  int Add(num1, num2) {
    return num1 + num2;
  }

  int Sub(num1, num2) {
    return num1 - num2;
  }

  int Mult(num1, num2) {
    return num1 * num2;
  }

  double Divid(num1, num2) {
    return num1 / num2;
  }
}
