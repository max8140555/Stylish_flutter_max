import 'package:flutter/material.dart';
import 'package:stylish_max/screens/detail/detail_page_view_model.dart';
import 'package:stylish_max/screens/detail/detail_product_selector.dart';
import 'package:stylish_max/widgets/stylish_app_bar.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, this.productId});
  static const String routeName = '/detail';

  final String? productId;

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String?;
    return LayoutBuilder(builder: (context, constraints) {
      bool isBigScreen = constraints.maxWidth >= 800;

      return Consumer<DetailPageViewModel>(
        builder: (context, viewModel, child) {
          viewModel.updateProductDetail(productId);

          return Scaffold(
            appBar: const StylishAppBar(),
            body: SafeArea(
                child: isBigScreen
                    ? DetailPageBigScreen(
                        imageUrl: viewModel.productDetail.imageUrl)
                    : DetailPageSmallScreen(
                        imageUrl: viewModel.productDetail.imageUrl)),
          );
        },
      );
    });
  }
}

class DetailPageBigScreen extends StatelessWidget {
  const DetailPageBigScreen({super.key, required this.imageUrl});

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(left: 32, top: 32, bottom: 32),
              child: Image.asset(imageUrl),
            )),
        const Expanded(
          flex: 5,
          child: Padding(
              padding: EdgeInsets.all(32), child: DetailProductSelector()),
        )
      ],
    );
  }
}

class DetailPageSmallScreen extends StatelessWidget {
  const DetailPageSmallScreen({super.key, required this.imageUrl});

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 90),
      children: [
        Image.asset(imageUrl),
        const DetailProductSelector(),
        const SizedBox(height: 300),
      ],
    );
  }
}
