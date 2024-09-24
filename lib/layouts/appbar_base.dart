// create a class who extends appbar
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:little_bird/config/image_path.dart';

class AppBarBase extends StatelessWidget implements PreferredSizeWidget {
  /// Título da appbar. Aparece no canto esquerdo da appbar
  final String title;

  /// Widget que aparece no canto esquerdo da appbar
  final Widget? leading;

  /// Ícone que subtitui a foto do aplicativo no título da appbar
  final IconData? icon;

  /// Um appbar base para ser usada em todas as telas
  const AppBarBase({
    super.key,
    required this.title,
    this.icon,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          icon != null
              ? Icon(icon)
              : CircleAvatar(
                  backgroundImage: AssetImage(Gallery(context).isotipo),
                ),
          const Gap(16),
          Text(title),
        ],
      ),
      leading: leading,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
