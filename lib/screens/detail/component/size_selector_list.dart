import 'package:flutter/material.dart';

class SizeSelectorList extends StatelessWidget {
  const SizeSelectorList({
    super.key,
    required this.sizes,
    required this.selectedSize,
    required this.selectedSizeListener,
  });

  final List<String> sizes;
  final String selectedSize;
  final void Function(String) selectedSizeListener;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Row(
            children: sizes
                .map((size) => Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: GestureDetector(
                        onTap: () {
                          selectedSizeListener.call(size);
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: selectedSize == size
                                    ? Colors.red
                                    : Colors.transparent,
                              ),
                            ),
                            Text(size),
                          ],
                        ),
                      ),
                    ))
                .toList(),
          );
        },
        itemCount: 1,
      ),
    );
  }
}