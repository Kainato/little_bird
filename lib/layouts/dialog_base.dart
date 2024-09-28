import 'package:flutter/material.dart';

class DialogBase extends StatelessWidget {
  final List<Widget> children;
  final String title;
  final IconData? icon;
  final String label;
  final List<Widget>? actions;

  const DialogBase({
    super.key,
    this.icon,
    required this.title,
    required this.children,
    this.label = 'Fechar',
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AlertDialog(
        icon: icon != null ? Icon(icon) : null,
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
        actions: actions ??
            <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(label),
              ),
            ],
      ),
    );
  }
}
