import 'package:mobx/mobx.dart';

part 'calculator_store.g.dart';

class CalculatorStore = _CalculatorStoreBase with _$CalculatorStore;

abstract class _CalculatorStoreBase with Store {
  @action
  getHistory() {}
}
