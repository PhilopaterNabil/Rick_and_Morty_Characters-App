import 'package:flutter/material.dart';
import 'package:shop/constants/my_colors.dart';

class AppBarTitleWidget extends StatelessWidget {
  const AppBarTitleWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: MyColors.myGrey,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
