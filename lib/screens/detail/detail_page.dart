import 'package:flutter/material.dart';
import 'package:stylish_max/models/product.dart';
import 'package:stylish_max/screens/detail/detail_main_image.dart';
import 'package:stylish_max/screens/detail/detail_page_view_model.dart';
import 'package:stylish_max/screens/detail/detail_product_selector.dart';
import 'package:stylish_max/widgets/stylish_app_bar.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key, this.product});
  static const String routeName = '/detail';

  Product? product;

  @override
  Widget build(BuildContext context) {
    product = ModalRoute.of(context)?.settings.arguments as Product?;
    return LayoutBuilder(builder: (context, constraints) {
      bool isBigScreen = constraints.maxWidth >= 600;

      return Consumer<DetailPageViewModel>(
        builder: (context, viewModel, child) {
          viewModel.updateProductDetail(product);

          return Scaffold(
            appBar: const StylishAppBar(),
            body: SafeArea(
              child: Column(
                children: [
                  DetailMainImage(
                      imageUrl: viewModel.productDetail.imageUrl,
                      isBigScreen: isBigScreen),
                  DetailProductSelector()
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
