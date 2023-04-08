import 'package:flutter/material.dart';

class StockSelector extends StatelessWidget {
  const StockSelector(
      {super.key,
      required this.qty,
      required this.addQtyListener,
      required this.minusQtyListener});

  final int qty;
  final Function addQtyListener;
  final Function minusQtyListener;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 6),
          child: GestureDetector(
            onTap: () {
              minusQtyListener.call();
            },
            child: const SizedBox(
                height: 20,
                width: 30,
                child: Text("-", textAlign: TextAlign.center)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 6),
          child: SizedBox(child: Text("$qty", textAlign: TextAlign.center)),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 6),
          child: GestureDetector(
            onTap: () {
              addQtyListener.call();
            },
            child: const SizedBox(
                height: 20,
                width: 30,
                child: Text("+", textAlign: TextAlign.center)),
          ),
        ),
      ],
    );
  }
}