import 'package:flutter/material.dart';
import 'package:stylish_max/screens/home/widgets/home_page_banner_item.dart';

class HomePageBanner extends StatelessWidget {
  const HomePageBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: const [
            HomePageBannerItem(),
            HomePageBannerItem(),
            HomePageBannerItem(),
            HomePageBannerItem(),
            HomePageBannerItem()
          ],
        ),
      ),
    );
  }
}
