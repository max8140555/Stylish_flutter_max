import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/stylish_app_bar.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const StylishAppBar(),
        body: SafeArea(
          child: Text("Map"),
        ));
  }
}
