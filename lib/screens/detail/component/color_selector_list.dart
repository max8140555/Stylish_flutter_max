import 'package:flutter/material.dart';

class ColorSelectorList extends StatelessWidget {
  const ColorSelectorList({
    super.key,
    required this.colors,
    required this.selectedColorListener,
    required this.selectedColorInt,
  });

  final List<int> colors;
  final int? selectedColorInt;
  final void Function(int) selectedColorListener;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Row(
            children: colors
                .map((colorInt) => Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: GestureDetector(
                          onTap: () {
                            selectedColorListener.call(colorInt);
                          },
                          child: Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Color(colorInt),
                              border: Border.all(
                                color: selectedColorInt == colorInt
                                    ? Colors.red
                                    : Colors.transparent,
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
