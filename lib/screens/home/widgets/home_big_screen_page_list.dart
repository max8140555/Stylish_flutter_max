import 'package:flutter/material.dart';
import 'package:stylish_max/models/product_category.dart';
import 'package:stylish_max/screens/home/widgets/home_page_list_item.dart';

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
