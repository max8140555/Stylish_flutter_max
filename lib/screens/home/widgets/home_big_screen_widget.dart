import 'package:flutter/material.dart';
import 'package:stylish_max/models/product_category.dart';
import 'package:stylish_max/screens/home/component/home_page_list_title.dart';
import 'package:stylish_max/screens/home/widgets/home_page_banner.dart';
import 'package:stylish_max/screens/home/widgets/home_page_list_item.dart';

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
          child: Column(
            children: [
              HomePageListTitle(title: productCategoryList[i].title),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return HomeBigScreenPageList(
                      productCategory: productCategoryList[i],
                    );
                  },
                  itemCount: 1,
                ),
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

class HomeBigScreenPageList extends StatefulWidget {
  const HomeBigScreenPageList({
    super.key,
    required this.productCategory,
  });

  final ProductCategory productCategory;

  @override
  State<HomeBigScreenPageList> createState() => _HomeBigScreenPageListState();
}

class _HomeBigScreenPageListState extends State<HomeBigScreenPageList>
    with AutomaticKeepAliveClientMixin {
  bool isExpanded = true;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: widget.productCategory.productList
          .map((product) => HomePageListItem(product: product))
          .toList(),
    );
  }
}