import 'package:flutter/material.dart';
import 'package:shop/constants/my_colors.dart';
import 'package:shop/data/models/characters_model.dart';
import 'package:shop/presentation/widgets/character_grid_view_widget.dart';

class CharacterListWidget extends StatelessWidget {
  const CharacterListWidget({
    super.key,
    required this.characters,
    required this.searchTextController,
    required this.searchedForCharacters,
  });

  final List<CharactersModel> characters;
  final TextEditingController searchTextController;
  final List<CharactersModel> searchedForCharacters;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [
            CharacterGridViewWidget(
              characters: searchTextController.text.isEmpty
                  ? characters
                  : searchedForCharacters,
            ),
          ],
        ),
      ),
    );
  }
}
