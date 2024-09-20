import 'package:flutter/material.dart';
import 'package:little_bird/layouts/appbar_base.dart';
import 'package:little_bird/layouts/drawer_base.dart';

class ScaffoldBase extends StatelessWidget {
  final bool hasDrawer;
  final String title;
  final Widget body;
  final FloatingActionButton? floatingActionButton;

  /// Um scaffold base para ser usada em todas as telas
  const ScaffoldBase({
    super.key,
    this.hasDrawer = false,
    required this.title,
    required this.body,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBase(title: title),
      drawer: hasDrawer ? const DrawerBase() : null,
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
