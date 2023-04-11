import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish_max/models/product_detail.dart';
import 'package:stylish_max/network/api_state.dart';
import 'package:stylish_max/network/bloc/product_bloc.dart';
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
    final productId =
        ModalRoute.of(context)?.settings.arguments as String? ?? "";

    context
        .read<ProductDetailBloc>()
        .add(ProductDetailEvent.getProductDetailEvent(productId));

    return LayoutBuilder(builder: (context, constraints) {
      bool isBigScreen = constraints.maxWidth >= 800;

      return Consumer<DetailPageViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
              appBar: const StylishAppBar(),
              body: SafeArea(
                child: GestureDetector(
                  onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                  child: BlocBuilder<ProductDetailBloc, ApiState>(
                      builder: (context, state) {
                    if (state is ApiLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is ApiErrorState) {
                      return Center(
                        child: Text(state.errorMsg),
                      );
                    }
                    if (state is ApiSuccessState) {
                      var data = state.data as ProductDetail;
                      viewModel.updateProductDetail(data);

                      return Center(
                          child: isBigScreen
                              ? DetailPageBigScreen(productDetail: data)
                              : DetailPageSmallScreen(productDetail: data));
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
  const DetailPageBigScreen({super.key, required this.productDetail});

  final ProductDetail productDetail;
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
              child: Image.asset(productDetail.imageUrl),
            )),
        Expanded(
          flex: 5,
          child: Padding(
              padding: const EdgeInsets.all(32),
              child: DetailProductSelector(productDetail: productDetail)),
        )
      ],
    );
  }
}

class DetailPageSmallScreen extends StatelessWidget {
  const DetailPageSmallScreen({super.key, required this.productDetail});

  final ProductDetail productDetail;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 90),
      children: [
        Image.asset(productDetail.imageUrl),
        DetailProductSelector(productDetail: productDetail),
        const SizedBox(height: 300),
      ],
    );
  }
}
