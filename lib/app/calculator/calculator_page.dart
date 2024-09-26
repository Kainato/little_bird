import 'package:flutter/material.dart';
import 'package:little_bird/enums/calculator_enum.dart';
import 'package:little_bird/layouts/dialog_base.dart';
import 'package:little_bird/layouts/scaffold_base.dart';
import 'package:little_bird/widgets/calculator_grid.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Página de calculadora
class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final EdgeInsetsGeometry _padding = const EdgeInsets.all(12);
  final List<Map<String, String>> _result = [];
  String _firstNumber = '';
  String _secondNumber = '';
  String _operator = '';
  final Future<SharedPreferencesWithCache> _prefs =
      SharedPreferencesWithCache.create(
    cacheOptions: const SharedPreferencesWithCacheOptions(
      allowList: <String>{'calculator_history'},
    ),
  );

  @override
  void initState() {
    super.initState();
    _prefs.then((prefs) {
      List<String> history = prefs.getStringList('calculator_history') ?? [];
      _result.clear();
      for (var element in history) {
        List<String> item = element.split(':');
        _result.add({item[0]: item[1]});
      }
    });
  }

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
      useSafeArea: true,
      context: context,
      builder: (context) {
        return DialogBase(
          icon: Icons.history,
          title: 'Histórico',
          children: List.generate(
            _result.length,
            (index) {
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
              );
            },
          ),
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
              _prefs.then((prefs) {
                List<String> history =
                    prefs.getStringList('calculator_history') ?? [];
                history.add('$result:$_firstNumber $_operator $_secondNumber');
                prefs.setStringList('calculator_history', history);
              });
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
