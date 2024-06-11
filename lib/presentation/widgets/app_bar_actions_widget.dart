import 'package:flutter/material.dart';
import 'package:shop/constants/my_colors.dart';

class AppBarActionsWidget extends StatelessWidget {
  const AppBarActionsWidget({super.key, required this.isSearching, required this.startSearch, required this.clearSearch});
  final bool isSearching;
  final Function() startSearch;
  final Function() clearSearch;

  @override
  Widget build(BuildContext context) {

    if (isSearching) {
      return IconButton(
        onPressed: clearSearch,
        icon: const Icon(
          Icons.clear,
          color: MyColors.myGrey,
        ),
      );
    } else {
      return IconButton(
        onPressed: startSearch,
        icon: const Icon(
          Icons.search,
          color: MyColors.myGrey,
        ),
      );
    }
  }
}
