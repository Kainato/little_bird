// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingsStore on _SettingsStoreBase, Store {
  late final _$isDarkModeAtom =
      Atom(name: '_SettingsStoreBase.isDarkMode', context: context);

  @override
  bool get isDarkMode {
    _$isDarkModeAtom.reportRead();
    return super.isDarkMode;
  }

  @override
  set isDarkMode(bool value) {
    _$isDarkModeAtom.reportWrite(value, super.isDarkMode, () {
      super.isDarkMode = value;
    });
  }

  late final _$isChangedModeAtom =
      Atom(name: '_SettingsStoreBase.isChangedMode', context: context);

  @override
  bool get isChangedMode {
    _$isChangedModeAtom.reportRead();
    return super.isChangedMode;
  }

  @override
  set isChangedMode(bool value) {
    _$isChangedModeAtom.reportWrite(value, super.isChangedMode, () {
      super.isChangedMode = value;
    });
  }

  late final _$initStateAsyncAction =
      AsyncAction('_SettingsStoreBase.initState', context: context);

  @override
  Future<void> initState() {
    return _$initStateAsyncAction.run(() => super.initState());
  }

  late final _$getDarkModeAsyncAction =
      AsyncAction('_SettingsStoreBase.getDarkMode', context: context);

  @override
  Future<dynamic> getDarkMode() {
    return _$getDarkModeAsyncAction.run(() => super.getDarkMode());
  }

  late final _$setDarkModeAsyncAction =
      AsyncAction('_SettingsStoreBase.setDarkMode', context: context);

  @override
  Future<void> setDarkMode(bool value) {
    return _$setDarkModeAsyncAction.run(() => super.setDarkMode(value));
  }

  late final _$_SettingsStoreBaseActionController =
      ActionController(name: '_SettingsStoreBase', context: context);

  @override
  void dispose() {
    final _$actionInfo = _$_SettingsStoreBaseActionController.startAction(
        name: '_SettingsStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_SettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setChangedMode({bool? value}) {
    final _$actionInfo = _$_SettingsStoreBaseActionController.startAction(
        name: '_SettingsStoreBase.setChangedMode');
    try {
      return super.setChangedMode(value: value);
    } finally {
      _$_SettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isDarkMode: ${isDarkMode},
isChangedMode: ${isChangedMode}
    ''';
  }
}
