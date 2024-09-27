// Definição da enumeração para as rotas
import 'package:flutter/material.dart';
import 'package:little_bird/app/about_page.dart';
import 'package:little_bird/app/calculator/calculator_page.dart';
import 'package:little_bird/app/home_page.dart';
import 'package:little_bird/app/settings_page.dart';

/// Enumeração para as rotas da aplicação
enum AppRoutes {
  home,
  about,
  calculator,
  settings,
}

/// Extensão para converter a enumeração em uma string
extension AppRoutesExtension on AppRoutes {
  String get route {
    switch (this) {
      case AppRoutes.home:
        return '/home';
      case AppRoutes.about:
        return '/about';
      case AppRoutes.calculator:
        return '/calculator';
      case AppRoutes.settings:
        return '/settings';
      default:
        return '';
    }
  }
}

/// Definição das rotas usando a enumeração
Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.home.route: (context) => const HomePage(),
  AppRoutes.about.route: (context) => const AboutPage(),
  AppRoutes.calculator.route: (context) => const CalculatorPage(),
  AppRoutes.settings.route: (context) => const SettingsPage(),
};
