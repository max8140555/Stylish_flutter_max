import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish_max/models/product.dart';
import 'package:stylish_max/network/bloc/single_product_bloc.dart';
import 'package:stylish_max/screens/detail/detail_page_view_model.dart';
import 'package:stylish_max/screens/detail/detail_product_selector.dart';
import 'package:stylish_max/widgets/stylish_app_bar.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, this.productId});

  final String? productId;

  @override
  Widget build(BuildContext context) {
    var singleProductBloc = context.read<SingleProductBloc>();
    singleProductBloc.add(GetProductEvent(productId: productId ?? ""));

    return LayoutBuilder(builder: (context, constraints) {
      bool isBigScreen = constraints.maxWidth >= 800;

      return Consumer<DetailPageViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
              appBar: const StylishAppBar(),
              body: SafeArea(
                child: GestureDetector(
                  onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                  child: BlocBuilder<SingleProductBloc, SingleProductState>(builder: (context, state) {
                    if (state is SingleProductLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is SingleProductError) {
                      return Center(
                        child: Text(state.errorMsg),
                      );
                    }
                    if (state is SingleProductSuccess) {
                      var data = state.data as Product;
                      viewModel.updateProductDetail(data);

                      return Center(child: isBigScreen ? DetailPageBigScreen(product: data) : DetailPageSmallScreen(product: data));
                    }
                    return Container();
                  }),
                ),
              ));
        },
      );
    });
  }
}

class DetailPageBigScreen extends StatelessWidget {
  const DetailPageBigScreen({super.key, required this.product});

  final Product product;

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
                child: Image.network(product.mainImage),
              )),
          Expanded(
            flex: 5,
            child: Padding(
                padding: const EdgeInsets.all(32),
                child: DetailProductSelector(product: product)),
          )
        ],
        );
  }
}

class DetailPageSmallScreen extends StatelessWidget {
  const DetailPageSmallScreen({super.key, required this.product});

  final Product product;
  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.symmetric(horizontal: 90),
        children: [
          Image.network(product.mainImage),
          DetailProductSelector(product: product),
          const SizedBox(height: 300),
        ],
        );
  }
}
