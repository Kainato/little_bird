import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:little_bird/app/settings/settings_store.dart';
import 'package:little_bird/layouts/dialog_base.dart';
import 'package:little_bird/layouts/scaffold_base.dart';
import 'package:little_bird/widgets/switch_list_tile_base.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final SettingsStore store = SettingsStore();

  @override
  void initState() {
    super.initState();
    store.initState();
  }

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldBase(
      title: 'Configurações',
      hasDrawer: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Observer(
            builder: (_) => SwitchListTileBase(
              title: 'Tema do aplicativo',
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tema selecionado: ${store.isDarkMode ? 'Escuro' : 'Claro'}',
                  ),
                  if (store.isChangedMode) ...[
                    const Text(
                      'Aguardando reinicialização...',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ],
                ],
              ),
              onTap: (bool value) {
                store.setDarkMode(value);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const DialogBase(
                      title: 'Tema alterado!',
                      label: 'Ok',
                      children: [
                        Text(
                          'Reinicie o aplicativo para que as alterações tenham efeito!',
                        ),
                      ],
                    );
                  },
                );
              },
              value: store.isDarkMode,
            ),
          ),
        ],
      ),
    );
  }
}
