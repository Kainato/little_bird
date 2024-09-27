import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:little_bird/app/calculator/calculator_store.dart';
import 'package:little_bird/enums/calculator_enum.dart';
import 'package:little_bird/layouts/dialog_base.dart';
import 'package:little_bird/layouts/scaffold_base.dart';
import 'package:little_bird/widgets/calculator_grid.dart';

/// Página de calculadora
class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final EdgeInsetsGeometry _padding = const EdgeInsets.all(12);
  final CalculatorStore store = CalculatorStore();

  @override
  void initState() {
    super.initState();
    store.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldBase(
      hasDrawer: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.history),
          onPressed: () => _history(),
        ),
      ],
      title: 'Calculadora',
      body: Observer(builder: (context) {
        return Column(
          children: [
            Container(
              width: double.infinity,
              padding: _padding,
              constraints: const BoxConstraints(minHeight: 100),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  _display(),
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            const Divider(),
            Flexible(
              child: GridView.builder(
                padding: _padding,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                ),
                itemCount: calculatorEnumList.length,
                itemBuilder: (context, index) {
                  CalculatorClass item =
                      CalculatorClass.fromMap(calculatorEnumList[index]);
                  return CalculatorGrid(
                    label: item.label,
                    style: item.style,
                    onPressed: () => store.calculate(item: item),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }

  String _display() {
    if (store.firstNumber.isEmpty) {
      return '0';
    } else if (store.operatorSymbol.isEmpty) {
      return store.firstNumber;
    } else if (store.operatorSymbol.isNotEmpty) {
      return '${store.firstNumber} ${store.operatorSymbol} ${store.secondNumber}';
    } else {
      return store.results.last.keys.first;
    }
  }

  Future _history() {
    return showDialog(
      useSafeArea: true,
      context: context,
      builder: (context) {
        return DialogBase(
          icon: Icons.history,
          title: 'Histórico',
          children: [
            SizedBox(
              height: 300,
              width: 600,
              child: ListView.builder(
                itemCount: store.results.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      store.results[index].values.first,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    subtitle: Text(
                      store.results[index].keys.first,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
