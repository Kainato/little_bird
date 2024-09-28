import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:little_bird/app/home_page.dart';
import 'package:little_bird/config/app_routes.dart';
import 'package:little_bird/config/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isDarkMode = prefs.getBool('isDarkMode') ?? false;
  log(isDarkMode.toString(), name: 'isDarkMode');

  runApp(MainApp(isDarkMode: isDarkMode));
}

class MainApp extends StatelessWidget {
  final bool isDarkMode;
  const MainApp({
    super.key,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      initialRoute: '/home',
      title: 'Little Bird',
      locale: const Locale('pt', 'BR'),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: const HomePage(),
    );
  }
}
