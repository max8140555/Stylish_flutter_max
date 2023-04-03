import 'package:flutter/material.dart';
import 'package:stylish_max/screens/detail/detail_page.dart';
import 'package:stylish_max/screens/home/home_page.dart';

void main() {
  runApp(const StylishApp());
}

class StylishApp extends StatelessWidget {
  const StylishApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stylish',
      theme: ThemeData(
        primaryColor: Colors.grey[200],
      ),
      home: const HomePage(),
      routes: {
        DetailPage.routeName:(context) => DetailPage()
      },
    );
  }
}
