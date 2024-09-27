// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculator_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CalculatorStore on _CalculatorStoreBase, Store {
  late final _$firstNumberAtom =
      Atom(name: '_CalculatorStoreBase.firstNumber', context: context);

  @override
  String get firstNumber {
    _$firstNumberAtom.reportRead();
    return super.firstNumber;
  }

  @override
  set firstNumber(String value) {
    _$firstNumberAtom.reportWrite(value, super.firstNumber, () {
      super.firstNumber = value;
    });
  }

  late final _$secondNumberAtom =
      Atom(name: '_CalculatorStoreBase.secondNumber', context: context);

  @override
  String get secondNumber {
    _$secondNumberAtom.reportRead();
    return super.secondNumber;
  }

  @override
  set secondNumber(String value) {
    _$secondNumberAtom.reportWrite(value, super.secondNumber, () {
      super.secondNumber = value;
    });
  }

  late final _$operatorSymbolAtom =
      Atom(name: '_CalculatorStoreBase.operatorSymbol', context: context);

  @override
  String get operatorSymbol {
    _$operatorSymbolAtom.reportRead();
    return super.operatorSymbol;
  }

  @override
  set operatorSymbol(String value) {
    _$operatorSymbolAtom.reportWrite(value, super.operatorSymbol, () {
      super.operatorSymbol = value;
    });
  }

  late final _$resultsAtom =
      Atom(name: '_CalculatorStoreBase.results', context: context);

  @override
  ObservableList<Map<String, String>> get results {
    _$resultsAtom.reportRead();
    return super.results;
  }

  @override
  set results(ObservableList<Map<String, String>> value) {
    _$resultsAtom.reportWrite(value, super.results, () {
      super.results = value;
    });
  }

  late final _$prefsAtom =
      Atom(name: '_CalculatorStoreBase.prefs', context: context);

  @override
  SharedPreferences get prefs {
    _$prefsAtom.reportRead();
    return super.prefs;
  }

  bool _prefsIsInitialized = false;

  @override
  set prefs(SharedPreferences value) {
    _$prefsAtom.reportWrite(value, _prefsIsInitialized ? super.prefs : null,
        () {
      super.prefs = value;
      _prefsIsInitialized = true;
    });
  }

  late final _$initStateAsyncAction =
      AsyncAction('_CalculatorStoreBase.initState', context: context);

  @override
  Future<void> initState() {
    return _$initStateAsyncAction.run(() => super.initState());
  }

  late final _$_CalculatorStoreBaseActionController =
      ActionController(name: '_CalculatorStoreBase', context: context);

  @override
  void getHistory() {
    final _$actionInfo = _$_CalculatorStoreBaseActionController.startAction(
        name: '_CalculatorStoreBase.getHistory');
    try {
      return super.getHistory();
    } finally {
      _$_CalculatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculate({required CalculatorClass item}) {
    final _$actionInfo = _$_CalculatorStoreBaseActionController.startAction(
        name: '_CalculatorStoreBase.calculate');
    try {
      return super.calculate(item: item);
    } finally {
      _$_CalculatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
firstNumber: ${firstNumber},
secondNumber: ${secondNumber},
operatorSymbol: ${operatorSymbol},
results: ${results},
prefs: ${prefs}
    ''';
  }
}
