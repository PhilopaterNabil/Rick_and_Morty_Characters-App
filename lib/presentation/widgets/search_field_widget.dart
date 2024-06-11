import 'package:flutter/material.dart';
import 'package:shop/constants/my_colors.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
    super.key,
    required this.searchTextController,
    required this.onChanged,
    required this.hintText,
  });
  final TextEditingController searchTextController;
  final Function(String) onChanged;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchTextController,
      cursorColor: MyColors.myYellow,
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none,
        hintStyle: const TextStyle(
          color: MyColors.myGrey,
          fontSize: 18,
        ),
      ),
      onChanged: onChanged,
    );
  }
}
