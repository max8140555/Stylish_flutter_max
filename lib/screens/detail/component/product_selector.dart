import 'package:flutter/material.dart';

class ProductSelector extends StatelessWidget {
  const ProductSelector({
    super.key,
    required this.widget,
    required this.title,
  });

  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Expanded(
        child: Row(
          children: [
            Text(title),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child:
                  VerticalDivider(width: 1, color: Colors.grey, thickness: 1),
            ),
            widget
          ],
        ),
      ),
    );
  }
}