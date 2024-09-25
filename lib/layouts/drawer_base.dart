import 'package:flutter/material.dart';
import 'package:little_bird/config/image_path.dart';
import 'package:little_bird/config/routes.dart';
import 'package:little_bird/config/app_theme.dart';
import 'package:little_bird/widgets/drawer_list_tile.dart';

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
          DrawerListTile(
            title: 'Página inicial',
            selected: _itemSelected(context, route: AppRoutes.home.route),
            leading: const Icon(Icons.home),
            onTap: () => _onTapDrawerListTile(
              context,
              route: AppRoutes.home.route,
            ),
          ),
          DrawerListTile(
            title: 'Calculadora',
            selected: _itemSelected(context, route: AppRoutes.calculator.route),
            leading: const Icon(Icons.calculate),
            onTap: () => _onTapDrawerListTile(
              context,
              route: AppRoutes.calculator.route,
            ),
          ),
          const DrawerListTile(
            title: 'Sobre',
            selected: false,
            leading: Icon(Icons.info),
          ),
        ],
      ),
    );
  }

  bool _itemSelected(BuildContext context, {required String route}) {
    return ModalRoute.of(context)?.settings.name == route;
  }

  void _onTapDrawerListTile(BuildContext context, {required String route}) {
    if (ModalRoute.of(context)?.settings.name == route) {
      Navigator.of(context).pop();
      return;
    } else {
      Navigator.of(context).popAndPushNamed(route);
    }
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
