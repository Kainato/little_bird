import 'package:little_bird/enums/calculator_enum.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'calculator_store.g.dart';

class CalculatorStore = _CalculatorStoreBase with _$CalculatorStore;

abstract class _CalculatorStoreBase with Store {
  @observable
  String firstNumber = '';

  @observable
  String secondNumber = '';

  @observable
  String operatorSymbol = '';

  @observable
  ObservableList<Map<String, String>> results =
      ObservableList<Map<String, String>>();

  @observable
  late SharedPreferences prefs;

  @action
  Future<void> initState() async {
    prefs = await SharedPreferences.getInstance();
    List<String> history = prefs.getStringList('calculator_history') ?? [];
    calculateHistory(history);
  }

  @action
  void clearHistory() {
    prefs.remove('calculator_history');
    results.clear();
  }

  @action
  calculateHistory(List<String> history) {
    results = history
        .map((e) {
          e = e.replaceAll('=', '');
          List<String> values = e.split(' ');
          double first = double.parse(values[0]);
          double second = double.parse(values[2]);
          double result = 0;
          switch (values[1]) {
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
          return {result.toString(): e};
        })
        .toList()
        .asObservable();
  }

  @action
  void calculate({required CalculatorClass item}) {
    switch (item.style) {
      case CalculatorEnum.number:
        if (operatorSymbol.isEmpty) {
          firstNumber += item.value.toString();
        } else {
          secondNumber += item.value.toString();
        }
        break;
      case CalculatorEnum.add:
        operatorSymbol = '+';
        break;
      case CalculatorEnum.subtract:
        operatorSymbol = '-';
        break;
      case CalculatorEnum.multiply:
        operatorSymbol = 'x';
        break;
      case CalculatorEnum.divide:
        operatorSymbol = '/';
        break;
      case CalculatorEnum.clear:
        firstNumber = '';
        secondNumber = '';
        operatorSymbol = '';
        break;
      case CalculatorEnum.equal:
        if (firstNumber.isNotEmpty &&
            secondNumber.isNotEmpty &&
            operatorSymbol.isNotEmpty) {
          double first = double.parse(firstNumber);
          double second = double.parse(secondNumber);
          double result = 0;
          switch (operatorSymbol) {
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
          results.add({
            result.toString(): '$firstNumber $operatorSymbol $secondNumber'
          });
          prefs.setStringList(
            'calculator_history',
            results.map((e) => e.values.first).toList(),
          );
          firstNumber = result.toString();
          secondNumber = '';
          operatorSymbol = '';
        }
        break;
      default:
    }
  }
}
