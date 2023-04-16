import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish_max/models/product.dart';
import 'package:stylish_max/network/api_state.dart';
import 'package:stylish_max/network/bloc/product_bloc.dart';
import 'package:stylish_max/screens/home/widgets/home_big_screen_widget.dart';
import 'package:stylish_max/screens/home/widgets/home_page_banner.dart';
import 'package:stylish_max/screens/home/widgets/home_page_list_item.dart';
import 'package:stylish_max/screens/home/widgets/home_small_screen_widget.dart';
import 'package:stylish_max/values/text_styles.dart';
import 'package:stylish_max/widgets/stylish_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<DoNothingAction> productList;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final dio = Dio();

    // Future<ResponseProductList> getHttp() async {
    //   final response =
    //       await dio.get('https://api.appworks-school.tw/api/1.0/products/all');
    //   print("Max123 ${ResponseProductList.fromJson(response.extra)}");
    //   return ResponseProductList.fromJson(response.extra);
    // }

    var productListBloc = context.read<ProductListBloc>();

    return LayoutBuilder(
      builder: (context, constraints) {
        productListBloc.add(ProductListEvent.getProductListEvent("men"));
        bool isBigScreen = constraints.maxWidth >= 800;
        // var a = getHttp();
        Widget getScreen() {
          if (isBigScreen) {
            return HomeBigScreenWidget();
          } else {
            return HomeSmallScreenWidget();
          }
        }

        return Scaffold(
          appBar: const StylishAppBar(),
          body: SafeArea(
            child: SizedBox(
              height: constraints.maxHeight,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 32, bottom: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "熱門首選",
                          style: midTextStyle,
                        ),
                      ],
                    ),
                  ),
                  const HomePageBanner(),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: SingleChildScrollView(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: GestureDetector(
                              onTap: () => productListBloc.add(ProductListEvent.getProductListEvent("men")),
                              child: Text("Men", style: smallTextStyle),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: GestureDetector(
                                onTap: () => productListBloc.add(ProductListEvent.getProductListEvent("women")),
                                child: Text("Women", style: smallTextStyle)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: GestureDetector(
                                onTap: () => productListBloc.add(ProductListEvent.getProductListEvent("accessories")),
                                child: Text("Accessories", style: smallTextStyle)),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: BlocBuilder<ProductListBloc, ApiState>(
                      builder: (context, state) {
                        if (state is ApiSuccessState) {
                          var productList = state.data as ProductList;
                          return GridView.count(
                            crossAxisCount: isBigScreen ? 3 : 1,
                            mainAxisSpacing: 8.0,
                            crossAxisSpacing: 8.0,
                            childAspectRatio: 3,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            children: productList.data.map((product) {
                              return HomePageListItem(product: product);
                            }).toList(),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// GestureDetector(
//               onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//               child: BlocBuilder<ProductListBloc, ApiState>(
//                   builder: (context, state) {
//                 if (state is ApiLoadingState) {
//                   print("Max123 ApiLoadingState");

//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//                 if (state is ApiErrorState) {
//                   print("Max123 ApiErrorState ${state.errorMsg}");

//                   return Center(
//                     child: Text(state.errorMsg),
//                   );
//                 }
//                 if (state is ApiSuccessState) {
//                   print("Max123 ApiSuccessState");

//                   var data = state.data as ResponseProductList;
//                   // viewModel.updateProductDetail(data);

//                   return Center(
//                       child: isBigScreen
//                           ? HomeBigScreenWidget()
//                           : HomeSmallScreenWidget());
//                 }
//                 print("Max123 ??");

//                 return Container();
//               }),
//             ),