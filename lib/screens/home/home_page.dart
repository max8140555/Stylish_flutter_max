import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish_max/network/bloc/product_bloc.dart';
import 'package:stylish_max/screens/home/widgets/home_big_screen_widget.dart';
import 'package:stylish_max/screens/home/widgets/home_small_screen_widget.dart';
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

    context
        .read<ProductListBloc>()
        .add(ProductListEvent.getProductListEvent("men"));

    return LayoutBuilder(builder: (context, constraints) {
      bool isBigScreen = constraints.maxWidth >= 600;
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
          child: Center(
            child: getScreen(),
          ),
        ),
      );
    });
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