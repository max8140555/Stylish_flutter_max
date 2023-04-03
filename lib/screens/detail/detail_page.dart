import 'package:flutter/material.dart';
import 'package:stylish_max/screens/detail/detail_main_image.dart';
import 'package:stylish_max/widgets/stylish_app_bar.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});
  static const String routeName = '/detail';

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool isBigScreen = constraints.maxWidth >= 600;

      return Scaffold(
        appBar: const StylishAppBar(),
        body: SafeArea(
          child: Center(
            child: DetailMainImage(
                imageUrl: 'assets/images/home_banner_image.jpeg',
                isBigScreen: isBigScreen),
          ),
        ),
      );
    });
  }
}
