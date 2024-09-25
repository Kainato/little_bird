import 'package:flutter/material.dart';
import 'package:little_bird/config/app_theme.dart';
import 'package:little_bird/enums/calculator_enum.dart';
import 'package:little_bird/widgets/card_grid_tile.dart';

class CalculatorGrid extends StatefulWidget {
  final String label;
  final void Function()? onPressed;
  final CalculatorEnum style;

  const CalculatorGrid({
    super.key,
    required this.label,
    required this.onPressed,
    required this.style,
  });

  @override
  State<CalculatorGrid> createState() => _CalculatorGridState();
}

class _CalculatorGridState extends State<CalculatorGrid> {
  String get label => widget.label;
  CalculatorEnum get style => widget.style;
  void Function()? get onPressed => widget.onPressed;
  @override
  Widget build(BuildContext context) {
    return CardGridTile(
      onPressed: onPressed,
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppTheme(context).backgroundLogo,
          ),
        ),
      ),
    );
  }
}
