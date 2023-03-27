import 'package:flutter/material.dart';
import 'package:stylish_max/models/product_category.dart';
import 'package:stylish_max/screens/home/widgets/home_page_banner.dart';
import 'package:stylish_max/screens/home/widgets/home_page_list.dart';

class HomeBigScreenWidget extends StatelessWidget {
  const HomeBigScreenWidget({super.key, required this.productCategoryList});

  final bool isBigScreen = true;
  final List<ProductCategory> productCategoryList;

  List<Widget> getListViewWidgets(
      bool isBigScreen, List<ProductCategory> productCategoryList) {
    List<Widget> listViewWidgets = [];

    for (int i = 0; i < productCategoryList.length; i++) {
      listViewWidgets.add(
        Expanded(
          child: ListView(
            children: [
              HomePageList(
                isBigScreen: isBigScreen,
                productCategory: productCategoryList[i],
              ),
            ],
          ),
        ),
      );
    }

    return listViewWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const HomePageBanner(),
      Expanded(
        child: Row(
          children: getListViewWidgets(isBigScreen, productCategoryList),
        ),
      )
    ]);
  }
}
