import 'package:flutter/material.dart';

class CardGridTile extends StatelessWidget {
  /// O widget principal que será exibido no GridTile
  final Widget child;

  /// O widget que será exibido no header do Card
  final Widget? header;

  /// O widget que será exibido no footer do Card
  final Widget? footer;

  /// Função que será executada ao pressionar o Card
  final void Function()? onPressed;

  /// Cor do Card
  final Color? colorData;

  /// Widget que exibe um Card com um GridTile e um InkWell
  const CardGridTile({
    super.key,
    required this.onPressed,
    required this.child,
    this.header,
    this.footer,
    this.colorData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: colorData ?? Theme.of(context).cardTheme.color,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onPressed,
        child: GridTile(
          child: child,
        ),
      ),
    );
  }
}