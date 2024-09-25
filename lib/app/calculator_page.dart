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
  String _firstNumber = '';
  String _secondNumber = '';
  final List<Map<String, String>> _result = [];
  String _operator = '';

  @override
  Widget build(BuildContext context) {
    return ScaffoldBase(
      hasDrawer: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.history),
          onPressed: () => _history(),
        ),
      ],
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
                _display(),
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.right,
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
                  onPressed: () => _calculate(item: item),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String _display() {
    if (_firstNumber.isEmpty) {
      return '0';
    } else if (_operator.isEmpty) {
      return _firstNumber;
    } else if (_operator.isNotEmpty) {
      return '$_firstNumber $_operator $_secondNumber';
    } else {
      return _result.last.keys.first;
    }
  }

  Future _history() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Histórico'),
          content: SizedBox(
            width: double.maxFinite,
            height: 200,
            child: ListView.builder(
              itemCount: _result.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    _result[index].values.first,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  subtitle: Text(
                    _result[index].keys.first,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  leading: CircleAvatar(
                    child: Text('${index + 1}'),
                  ),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  void _calculate({required CalculatorClass item}) {
    setState(
      () {
        switch (item.style) {
          case CalculatorEnum.number:
            if (_operator.isEmpty) {
              _firstNumber += item.value.toString();
            } else {
              _secondNumber += item.value.toString();
            }
            break;
          case CalculatorEnum.add:
            _operator = '+';
            break;
          case CalculatorEnum.subtract:
            _operator = '-';
            break;
          case CalculatorEnum.multiply:
            _operator = 'x';
            break;
          case CalculatorEnum.divide:
            _operator = '/';
            break;
          case CalculatorEnum.clear:
            _firstNumber = '';
            _secondNumber = '';
            _operator = '';
            break;
          case CalculatorEnum.equal:
            if (_firstNumber.isNotEmpty &&
                _secondNumber.isNotEmpty &&
                _operator.isNotEmpty) {
              double first = double.parse(_firstNumber);
              double second = double.parse(_secondNumber);
              double result = 0;
              switch (_operator) {
                case '+':
                  result = first + second;
                  break;
                case '-':
                  result = first - second;
                  break;
                case 'x':
                  result = first * second;
                  break;
                case '/':
                  result = first / second;
                  break;
                default:
              }
              _result.add({
                result.toString(): '$_firstNumber $_operator $_secondNumber'
              });
              _firstNumber = result.toString();
              _secondNumber = '';
              _operator = '';
            }
            break;
          default:
        }
      },
    );
  }
}
