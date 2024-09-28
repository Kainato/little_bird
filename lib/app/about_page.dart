import 'package:flutter/material.dart';
import 'package:little_bird/config/app_media.dart';
import 'package:little_bird/config/app_theme.dart';
import 'package:little_bird/layouts/scaffold_base.dart';
import 'package:little_bird/widgets/transparent_divider.dart';

/// Página de sobre
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBase(
      title: 'Sobre',
      hasDrawer: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          CircleAvatar(
            radius: 100,
            backgroundColor: AppTheme(context).backgroundLogo,
            backgroundImage: AssetImage(AppMedia.dashatarDev),
          ),
          const TransparentDivider(),
          SelectableText(
            'Olá! Meu nome é Caio Calado, sou desenvolvedor Flutter!',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const TransparentDivider(),
          SelectableText(
            'Este é meu projeto pessoal que demonstra meu conhecimento e habilidades em Flutter de forma clara, objetiva e funcional',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
