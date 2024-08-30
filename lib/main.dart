import 'package:flutter/material.dart';
import 'package:little_bird/config/image_path.dart';
import 'package:little_bird/config/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Little Bird',
      themeMode: ThemeMode.system,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          title: const Text('Little Bird'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(Gallery(context).imagotipo),
            ],
          ),
        ),
      ),
    );
  }
}
