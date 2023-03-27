import 'package:flutter/material.dart';
import 'package:stylish_max/models/product.dart';
import 'package:stylish_max/models/product_category.dart';
import 'package:stylish_max/screens/home/widgets/home_big_screen_widget.dart';
import 'package:stylish_max/screens/home/widgets/home_small_screen_widget.dart';
import 'package:stylish_max/widgets/stylish_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Product> productList;
  late List<ProductCategory> productCategoryList;

  @override
  void initState() {
    super.initState();
    productList = [
      Product(
          title: "最新男士大衣",
          price: 100,
          imageUrl: 'assets/images/home_banner_image.jpeg'),
      Product(
          title: "最新男士中衣",
          price: 200,
          imageUrl: 'assets/images/home_banner_image.jpeg'),
      Product(
          title: "最新男士小衣",
          price: 300,
          imageUrl: 'assets/images/stylish_logo.png'),
      Product(
          title: "最新男士中衣",
          price: 400,
          imageUrl: 'assets/images/home_banner_image.jpeg'),
      Product(
          title: "最新男士小衣",
          price: 500,
          imageUrl: 'assets/images/stylish_logo.png'),
      Product(
          title: "最新男士大衣",
          price: 600,
          imageUrl: 'assets/images/home_banner_image.jpeg'),
      Product(
          title: "最新男士大衣",
          price: 700,
          imageUrl: 'assets/images/stylish_logo.png'),
      Product(
          title: "最新男士小衣",
          price: 800,
          imageUrl: 'assets/images/home_banner_image.jpeg'),
      Product(
          title: "最新男士中衣",
          price: 900,
          imageUrl: 'assets/images/stylish_logo.png'),
    ];
    productCategoryList = [
      ProductCategory(title: "男裝", productList: productList),
      ProductCategory(title: "女裝", productList: productList),
      ProductCategory(title: "配件", productList: productList),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool isBigScreen = constraints.maxWidth >= 600;

      Widget getScreen() {
        if (isBigScreen) {
          return HomeBigScreenWidget(productCategoryList: productCategoryList);
        } else {
          return HomeSmallScreenWidget(productCategoryList: productCategoryList);
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
