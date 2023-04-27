import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stylish_max/network/bloc/multiple_product_bloc.dart';
import 'package:stylish_max/network/bloc/single_product_bloc.dart';
import 'package:stylish_max/network/repository/stylish_repository.dart';
import 'package:stylish_max/screens/detail/detail_page.dart';
import 'package:stylish_max/screens/detail/detail_page_view_model.dart';
import 'package:stylish_max/screens/home/home_page.dart';
import 'package:stylish_max/screens/map/map_page.dart';
import 'package:stylish_max/screens/payment/payment.dart';

void main() {
  runApp(const StylishApp());
}

class StylishApp extends StatelessWidget {
  const StylishApp({super.key});

  @override
  Widget build(BuildContext context) {
    StylishRepository stylishRepository = StylishRepositoryImpl();

    final router = GoRouter(
      routes: [
        GoRoute(
          name: "home",
          path: '/',
          builder: (context, state) => const HomePage(),
          routes: [
            GoRoute(
              name: "product",
              path: 'product/:productId',
              builder: (context, state) => ChangeNotifierProvider<DetailPageViewModel>(
                create: (_) => DetailPageViewModel(),
                child: DetailPage(
                  productId: state.params["productId"],
                ),
              ),
            ),
            GoRoute(
              name: "payment",
              path: 'payment',
              builder: (context, state) => PaymentPage(),
            ),
            GoRoute(
              name: "map",
              path: 'map',
              builder: (context, state) => MapPage(),
            ),
          ],
        ),
      ],
    );

    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => MultipleProductBloc(stylishRepository),
          ),
          BlocProvider(
            create: (_) => SingleProductBloc(stylishRepository),
          ),
        ],
        child: MaterialApp.router(
          title: 'Stylish',
          theme: ThemeData(
            primaryColor: Colors.grey[200],
          ),
          routerConfig: router,
        ));
  }
}
