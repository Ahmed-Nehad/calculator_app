import 'package:flutter/material.dart';

class MyAppState extends ChangeNotifier {
  var numbers = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];
  var actions = ['+', '-', '×', '÷'];
  String last = '';
  String text = '0';
  String sign = '';
  var maxNum = 7;

  void calculate() {
    double result = 0;
    double num1 = double.parse(last);
    double num2 = double.parse(text);
    String operator = sign;
    switch (operator) {
      case '×':
        result = num1 * num2;
        break;
      case '÷':
        result = num1 / num2;
        break;
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
    }
    last = '';
    sign = '';
    text = result == 0.0 ||
            int.parse(text.substring(text.indexOf('.') + 1, text.length)) == 0
        ? result.toStringAsFixed(0)
        : result.toString();

    text.length > 8 ? text = result.toStringAsPrecision(5) : false;

    notifyListeners();
  }

  void addText(String txt) {
    if (txt == '=' && last != '' && sign != '') {
      calculate();
      return;
    } else if (txt == 'AC' || (txt == '=' && sign != '')) {
      text = '0';
      last = '';
      sign = '';
      notifyListeners();
      return;
    } else if (txt == '!') {
      text = text[0] == '-'
          ? text.substring(1)
          : (text[0] == '-' ? '-${text.substring(1)}' : '-$text');

      notifyListeners();
      return;
    } else if (txt == '%') {
      sign = '÷';
      last = text;
      text = 100.toString();
      calculate();
      return;
    } else if (txt == '.') {
      if (!text.contains('.')) {
        text += txt;
      }
      notifyListeners();
      return;
    }

    if (numbers.contains(txt)) {
      if (last == '' && sign != '') {
        last = text;
        text = '';
      }
      text = text == '0' ? txt : text + txt;
    } else if (actions.contains(txt)) {
      if (last != '' && sign != '') {
        calculate();
      }
      sign = txt;
    }
    notifyListeners();
  }
}
