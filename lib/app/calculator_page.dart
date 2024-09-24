import 'package:flutter/material.dart';
import 'package:little_bird/enums/calculator_enum.dart';
import 'package:little_bird/layouts/scaffold_base.dart';
import 'package:little_bird/widgets/calculator_grid.dart';

/// Página de calculadora
class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final EdgeInsetsGeometry _padding = const EdgeInsets.all(12);
  bool _isFirstNumber = true;
  int _firstNumber = 0;
  int _secondNumber = 0;
  num? _result;
  String _operator = '';

  @override
  Widget build(BuildContext context) {
    return ScaffoldBase(
      hasDrawer: true,
      icon: Icons.calculate,
      title: 'Calculadora',
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: _padding,
            constraints: const BoxConstraints(minHeight: 100),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                _result == null
                    ? _operator == ''
                        ? '$_firstNumber'
                        : '$_firstNumber $_operator $_secondNumber'
                    : '$_result',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
          const Divider(),
          Flexible(
            child: GridView.builder(
              padding: _padding,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ),
              itemCount: calculatorEnumList.length,
              itemBuilder: (context, index) {
                CalculatorClass item =
                    CalculatorClass.fromMap(calculatorEnumList[index]);
                return CalculatorGrid(
                  label: item.label,
                  style: item.style,
                  onPressed: () {
                    setState(
                      () {
                        switch (item.style) {
                          case CalculatorEnum.number:
                            if (_isFirstNumber) {
                              _secondNumber = 0;
                              _operator = '';
                              if (_firstNumber == 0) {
                                _firstNumber = item.value.toInt();
                              } else {
                                _firstNumber =
                                    (_firstNumber * 10 + item.value).toInt();
                              }
                            } else {
                              if (_secondNumber == 0) {
                                _secondNumber = item.value.toInt();
                              } else {
                                _secondNumber =
                                    (_secondNumber * 10 + item.value).toInt();
                              }
                            }
                            break;
                          case CalculatorEnum.clear:
                            _firstNumber = 0;
                            _secondNumber = 0;
                            _operator = '';
                            _isFirstNumber = true;
                            break;
                          case CalculatorEnum.equal:
                            _isFirstNumber = false;
                            switch (_operator) {
                              case '+':
                                _result = _firstNumber + _secondNumber;
                                break;
                              case '-':
                                _result = _firstNumber - _secondNumber;
                                break;
                              case 'x':
                                _result = _firstNumber * _secondNumber;
                                break;
                              case '/':
                                _result = _firstNumber / _secondNumber;
                                break;
                              default:
                                break;
                            }
                            break;
                          case CalculatorEnum.multiply:
                            _isFirstNumber = false;
                            _operator = CalculatorEnum.multiply.label;
                            _result = _firstNumber * _secondNumber;
                            break;
                          case CalculatorEnum.divide:
                            _isFirstNumber = false;
                            _operator = CalculatorEnum.divide.label;
                            break;
                          case CalculatorEnum.add:
                            _isFirstNumber = false;
                            _operator = CalculatorEnum.add.label;
                            break;
                          case CalculatorEnum.subtract:
                            _isFirstNumber = false;
                            _operator = CalculatorEnum.subtract.label;
                            break;
                          default:
                        }
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
