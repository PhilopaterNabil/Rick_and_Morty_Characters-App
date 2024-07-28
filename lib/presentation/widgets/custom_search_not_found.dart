import 'package:flutter/material.dart';
import 'package:shop/constants/my_colors.dart';

class CustomSearchNotFound extends StatelessWidget {
  const CustomSearchNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.25,
          horizontal: MediaQuery.sizeOf(context).width * 0.1,
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/images/search_not_found2.gif',
              height: MediaQuery.sizeOf(context).height * 0.23,
              width: MediaQuery.sizeOf(context).width * 0.4,
            ),
            const Text(
              'No characters found with that name 😕',
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: MyColors.myWhite,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
