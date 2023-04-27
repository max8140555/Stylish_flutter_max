import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish_max/values/text_styles.dart';

class StylishAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StylishAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: Center(
        child: Image.asset(
          'assets/images/stylish_logo.png',
          fit: BoxFit.fitHeight,
          height: preferredSize.height - 32,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
