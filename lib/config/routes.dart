// Definição da enumeração para as rotas
import 'package:flutter/material.dart';
import 'package:little_bird/app/home_page.dart';

enum AppRoutes {
  home,
  about
}

// Extensão para converter a enumeração em uma string
extension AppRoutesExtension on AppRoutes {
  String get route {
    switch (this) {
      case AppRoutes.home:
        return '/home';
      case AppRoutes.about:
        return '/about';
      default:
        return '';
    }
  }
}

// Definição das rotas usando a enumeração
Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.home.route: (context) => const HomePage(),
  // AppRoutes.about.route: (context) => const AboutPage(),
};
