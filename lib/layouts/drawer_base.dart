import 'package:flutter/material.dart';
import 'package:little_bird/config/image_path.dart';
import 'package:little_bird/config/theme.dart';

class DrawerBase extends StatelessWidget implements Drawer {
  /// Um drawer base para ser usada em todas as telas.
  /// Precisa ser usada dentro de um Scaffold
  const DrawerBase({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage(Gallery(context).isotipoTransparente.toString()),
                fit: BoxFit.contain,
              ),
              color: AppTheme(context).backgroundLogo,
            ),
            child: Container(),
          ),
          ListTile(
            title: const Text('Página inicial'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Sobre'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Color? get backgroundColor => throw UnimplementedError();

  @override
  Widget? get child => throw UnimplementedError();

  @override
  Clip? get clipBehavior => throw UnimplementedError();

  @override
  double? get elevation => throw UnimplementedError();

  @override
  String? get semanticLabel => throw UnimplementedError();

  @override
  Color? get shadowColor => throw UnimplementedError();

  @override
  ShapeBorder? get shape => throw UnimplementedError();

  @override
  Color? get surfaceTintColor => throw UnimplementedError();

  @override
  double? get width => throw UnimplementedError();
}
