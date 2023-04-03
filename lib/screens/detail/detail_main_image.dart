import 'package:flutter/material.dart';

class DetailMainImage extends StatelessWidget {
  const DetailMainImage(
      {super.key, required this.imageUrl, required this.isBigScreen});

  final String imageUrl;
  final bool isBigScreen;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 16.0),
        child: Image.asset(imageUrl));
  }
}
