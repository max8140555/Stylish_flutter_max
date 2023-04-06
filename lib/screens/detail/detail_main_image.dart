import 'package:flutter/material.dart';

class DetailMainImage extends StatelessWidget {
  const DetailMainImage(
      {super.key, required this.imageUrl, required this.isBigScreen});

  final String imageUrl;
  final bool isBigScreen;

  @override
  Widget build(BuildContext context) {
    return Image.asset(imageUrl, fit: BoxFit.cover);
  }
}
