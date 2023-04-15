import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:stylish_max/network/bloc/product_bloc.dart';
import 'package:stylish_max/network/repository/stylish_repository.dart';
import 'package:stylish_max/screens/detail/detail_page.dart';
import 'package:stylish_max/screens/detail/detail_page_view_model.dart';
import 'package:stylish_max/screens/home/home_page.dart';

void main() {
  runApp(const StylishApp());
}

class StylishApp extends StatelessWidget {
  const StylishApp({super.key});

  @override
  Widget build(BuildContext context) {
    StylishRepository stylishRepository = StylishRepositoryImpl();

    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => ProductListBloc(stylishRepository),
          ),
        ],
        child: MaterialApp(
          title: 'Stylish',
          theme: ThemeData(
            primaryColor: Colors.grey[200],
          ),
          home: const HomePage(),
          routes: {
            DetailPage.routeName: (context) =>
                ChangeNotifierProvider<DetailPageViewModel>(
                  create: (_) => DetailPageViewModel(),
                  child: DetailPage(),
                ),
          },
        ));
  }
}
