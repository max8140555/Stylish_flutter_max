import 'package:flutter/material.dart';
import 'package:stylish_max/models/product.dart';

class ColorSelectorList extends StatelessWidget {
  const ColorSelectorList({
    super.key,
    required this.colors,
    required this.selectedColorListener,
    required this.selectedColorInt,
  });

  final List<MyColor> colors;
  final String? selectedColorInt;
  final void Function(String) selectedColorListener;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Row(
            children: colors
                .map((color) => Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: GestureDetector(
                          onTap: () {
                            selectedColorListener.call(color.code);
                          },
                          child: Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Color(0xFF000000 + int.parse(color.code, radix: 16)),
                              border: Border.all(
                                color: selectedColorInt == color.code ? Colors.red : Colors.transparent,
                                width: 2,
                              ),
                            ),
                          )),
                    ))
                .toList(),
          );
        },
        itemCount: 1,
      ),
    );
  }
}
