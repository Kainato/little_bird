import 'package:flutter/material.dart';
import 'package:little_bird/layouts/appbar_base.dart';
import 'package:little_bird/layouts/drawer_base.dart';

class ScaffoldBase extends StatelessWidget {
  /// Define se a página que está sendo construída possui um drawer no appbar
  final bool hasDrawer;

  /// Título da página
  final String title;

  /// Corpo da página
  final Widget body;

  /// Botão flutuante que aparece no canto inferior direito da tela.
  final FloatingActionButton? floatingActionButton;

  /// Ícone que subtitui a foto do aplicativo no título da appbar
  final IconData? icon;

  /// Ações que aparecem no canto direito da appbar
  final List<Widget>? actions;

  /// Um scaffold base para ser usada em todas as telas
  const ScaffoldBase({
    super.key,
    this.hasDrawer = false,
    required this.title,
    required this.body,
    this.actions,
    this.icon,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBase(title: title, actions: actions),
      drawer: hasDrawer ? const DrawerBase() : null,
      body: SafeArea(child: body),
      floatingActionButton: floatingActionButton,
    );
  }
}
