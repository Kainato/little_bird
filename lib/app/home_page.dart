import 'package:flutter/material.dart';
import 'package:little_bird/layouts/scaffold_base.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const ScaffoldBase(
      hasDrawer: true,
      title: 'Página inicial',
      body: Placeholder(),
    );
  }
}
