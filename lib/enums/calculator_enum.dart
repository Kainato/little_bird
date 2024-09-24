import 'package:flutter/material.dart';

enum CalculatorEnum {
  number,
  add,
  subtract,
  multiply,
  divide,
  equal,
  clear,
  delete,
}

extension CalculatorEnumExtension on CalculatorEnum {
  IconData get icon {
    switch (this) {
      case CalculatorEnum.number:
        return Icons.circle;
      case CalculatorEnum.add:
        return Icons.add;
      case CalculatorEnum.subtract:
        return Icons.remove;
      case CalculatorEnum.multiply:
        return Icons.close;
      case CalculatorEnum.divide:
        return Icons.check;
      case CalculatorEnum.equal:
        return Icons.equalizer;
      case CalculatorEnum.clear:
        return Icons.clear;
      case CalculatorEnum.delete:
        return Icons.delete;
      default:
        return Icons.error;
    }
  }

  String get label {
    switch (this) {
      case CalculatorEnum.number:
        return 'number';
      case CalculatorEnum.add:
        return '+';
      case CalculatorEnum.subtract:
        return '-';
      case CalculatorEnum.multiply:
        return 'x';
      case CalculatorEnum.divide:
        return '/';
      case CalculatorEnum.equal:
        return '=';
      case CalculatorEnum.clear:
        return 'C';
      case CalculatorEnum.delete:
        return 'delete';
      default:
        return 'error';
    }
  }
}

List<Map<String, dynamic>> calculatorEnumList = [
  {
    'label': '7',
    'value': 7,
    'style': CalculatorEnum.number,
  },
  {
    'label': '8',
    'value': 8,
    'style': CalculatorEnum.number,
  },
  {
    'label': '9',
    'value': 9,
    'style': CalculatorEnum.number,
  },
  {
    'label': '+',
    'value': '+',
    'style': CalculatorEnum.add,
  },
  {
    'label': '4',
    'value': 4,
    'style': CalculatorEnum.number,
  },
  {
    'label': '5',
    'value': 5,
    'style': CalculatorEnum.number,
  },
  {
    'label': '6',
    'value': 6,
    'style': CalculatorEnum.number,
  },
  {
    'label': '-',
    'value': '-',
    'style': CalculatorEnum.subtract,
  },
  {
    'label': '1',
    'value': 1,
    'style': CalculatorEnum.number,
  },
  {
    'label': '2',
    'value': 2,
    'style': CalculatorEnum.number,
  },
  {
    'label': '3',
    'value': 3,
    'style': CalculatorEnum.number,
  },
  {
    'label': 'x',
    'value': 'x',
    'style': CalculatorEnum.multiply,
  },
  {
    'label': 'C',
    'value': 'C',
    'style': CalculatorEnum.clear,
  },
  {
    'label': '0',
    'value': 0,
    'style': CalculatorEnum.number,
  },
  {
    'label': '=',
    'value': '=',
    'style': CalculatorEnum.equal,
  },
  {
    'label': '/',
    'value': '/',
    'style': CalculatorEnum.divide,
  },
];

class CalculatorClass {
  final String label;
  final dynamic value;
  final CalculatorEnum style;

  CalculatorClass({
    required this.label,
    required this.value,
    required this.style,
  });

  factory CalculatorClass.fromMap(Map<String, dynamic> map) {
    return CalculatorClass(
      label: map['label'],
      value: map['value'],
      style: map['style'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'value': value,
      'style': style,
    };
  }
}
