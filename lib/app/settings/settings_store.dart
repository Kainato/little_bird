import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_store.g.dart';

class SettingsStore = _SettingsStoreBase with _$SettingsStore;

abstract class _SettingsStoreBase with Store {
  @action
  Future<void> initState() async {
    getDarkMode();
    return;
  }

  @action
  void dispose() {
    isDarkMode = false;
    isChangedMode = false;
  }

  @observable
  bool isDarkMode = false;

  @observable
  bool isChangedMode = false;

  @action
  Future getDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDarkMode = prefs.getBool('isDarkMode') ?? false;
  }

  @action
  Future<void> setDarkMode(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', value);
    isDarkMode = value;
    setChangedMode();
  }

  @action
  setChangedMode({bool? value}) {
    isChangedMode = value ?? !isChangedMode;
  }
}
