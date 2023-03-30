import 'package:flutter/material.dart';

class HomePageListTitle extends StatelessWidget {
  const HomePageListTitle({super.key, required this.title} );

  final String title;
  
  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}