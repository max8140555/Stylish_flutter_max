import 'package:flutter/material.dart';
import 'package:stylish_max/models/product_category.dart';
import 'package:stylish_max/screens/home/widgets/home_page_banner.dart';
import 'package:stylish_max/screens/home/widgets/home_small_screen_page_list.dart';

class HomeSmallScreenWidget extends StatelessWidget {
  const HomeSmallScreenWidget({super.key, required this.productCategoryList});

  final bool isBigScreen = false;
  final List<ProductCategory> productCategoryList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productCategoryList.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return const HomePageBanner();
        }

        return HomeSmallScreenPageList(
          productCategory: productCategoryList[index - 1],
        );
      },
    );
  }
}
