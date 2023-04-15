import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish_max/models/product.dart';
import 'package:stylish_max/network/bloc/product_bloc.dart';
import 'package:stylish_max/screens/home/component/home_page_list_title.dart';
import 'package:stylish_max/screens/home/widgets/home_page_banner.dart';

import '../../../network/api_state.dart';

class HomeBigScreenWidget extends StatelessWidget {
  const HomeBigScreenWidget({super.key});

  final bool isBigScreen = true;
  // final List<ProductCategory> productCategoryList;

  List<Widget> getListViewWidgets(
      bool isBigScreen, List<Product> productList) {
    List<Widget> listViewWidgets = [];

    for (int i = 0; i < productList.length; i++) {
      listViewWidgets.add(
        Expanded(
          child: Column(
            children: [
              HomePageListTitle(title: ""),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return HomeBigScreenPageList();
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
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child:
              BlocBuilder<ProductListBloc, ApiState>(builder: (context, state) {
            if (state is ApiLoadingState) {
              print("Max123 ApiLoadingState");

              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ApiErrorState) {
              print("Max123 ApiErrorState ${state.errorMsg}");

              return Center(
                child: Text(state.errorMsg),
              );
            }
            if (state is ApiSuccessState) {
              print("Max123 ApiSuccessState");

              var data = state.data as ProductList;
              print("Max123 ${data.data.map((e) => e.id).toList()}");
              return Row(
                children: getListViewWidgets(isBigScreen, data.data),
              );
            }
            print("Max123 ??");

            return Container();
          }),
        ),
      )
    ]);
  }
}

class HomeBigScreenPageList extends StatefulWidget {
  const HomeBigScreenPageList({super.key});

  // final ProductCategory productCategory;

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
        // children: widget.productCategory.productList
        //     .map((product) => HomePageListItem(product: product))
        //     .toList(),
        );
  }
}
