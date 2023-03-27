import 'package:flutter/material.dart';

class HomePageBannerItem extends StatelessWidget {
  const HomePageBannerItem({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    bool isBigScreen = screenWidth >= 600;
    double boxMaxWidth = isBigScreen ? 360 : screenWidth * 0.6;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: boxMaxWidth),
          child: AspectRatio(
            aspectRatio: 2 / 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                'assets/images/home_banner_image.jpeg',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
    );
  }
}
