import 'package:flutter/material.dart';

class DialogBase extends StatelessWidget {
  final List<Widget> children;
  final VoidCallback? onPressed;
  final String label;
  final String title;
  final IconData? icon;

  const DialogBase({
    super.key,
    this.icon,
    required this.title,
    required this.children,
    this.onPressed,
    this.label = 'Ok',
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AlertDialog(
        icon: icon != null ? Icon(icon) : null,
        title: Text(title),
        content: Container(
          constraints: BoxConstraints(
            maxWidth: 600,
            maxHeight: MediaQuery.of(context).size.height * 0.25,
          ),
          child: Column(children: children),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fechar'),
          ),
          if (onPressed != null)
            ElevatedButton(
              onPressed: onPressed,
              child: Text(label),
            ),
        ],
      ),
    );
  }
}
