import 'package:flutter/material.dart';
import 'package:stylish_max/models/product_category.dart';
import 'package:stylish_max/screens/home/component/home_page_list_title.dart';
import 'package:stylish_max/screens/home/widgets/home_page_list_item.dart';

class HomeSmallScreenPageList extends StatefulWidget {
  const HomeSmallScreenPageList({
    super.key,
    required this.productCategory,
  });

  final ProductCategory productCategory;

  @override
  State<HomeSmallScreenPageList> createState() =>
      _HomeSmallScreenPageListState();
}

class _HomeSmallScreenPageListState extends State<HomeSmallScreenPageList>
    with AutomaticKeepAliveClientMixin {
  bool isExpanded = true;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: HomePageListTitle(title: widget.productCategory.title),
        ),
        isExpanded
            ? Column(
                children: widget.productCategory.productList
                    .map((product) => HomePageListItem(product: product))
                    .toList(),
              )
            : Container(),
      ],
    );
  }
}
