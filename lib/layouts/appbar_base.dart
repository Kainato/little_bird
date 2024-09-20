// create a class who extends appbar
import 'package:flutter/material.dart';

class AppBarBase extends StatelessWidget implements PreferredSizeWidget {
  /// Título da appbar. Aparece no canto esquerdo da appbar
  final String title;

  /// Widget que aparece no canto esquerdo da appbar
  final Widget? leading;

  /// Um appbar base para ser usada em todas as telas
  const AppBarBase({
    super.key,
    required this.title,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: leading,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
