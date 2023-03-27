import 'package:flutter/material.dart';
import 'package:stylish_max/models/product_category.dart';
import 'package:stylish_max/screens/home/widgets/home_page_list_item.dart';

class HomePageList extends StatefulWidget {
  const HomePageList({
    super.key,
    required this.isBigScreen,
    required this.productCategory,
  });

  final bool isBigScreen;
  final ProductCategory productCategory;

  @override
  State<HomePageList> createState() => _HomePageListState();
}

class _HomePageListState extends State<HomePageList>
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
            if (!widget.isBigScreen) {
              setState(() {
                isExpanded = !isExpanded;
              });
            }
          },
          child: Text(widget.productCategory.title),
        ),
        widget.isBigScreen || isExpanded
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
