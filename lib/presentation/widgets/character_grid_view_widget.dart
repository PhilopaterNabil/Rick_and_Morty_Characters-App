import 'package:flutter/material.dart';
import 'package:shop/constants/my_colors.dart';
import 'package:shop/data/models/characters_model.dart';
import 'package:shop/presentation/widgets/character_item.dart';

class CharacterGridViewWidget extends StatelessWidget {
  const CharacterGridViewWidget({
    super.key,
    required this.characters,
  });
  final List<CharactersModel> characters;

  @override
  Widget build(BuildContext context) {
    return characters.isEmpty
        ? Center(
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
                    'No characters found with that name',
                    style: TextStyle(
                      color: MyColors.myWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                ],
              ),
            ),
          )
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
            ),
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: characters.length,
            itemBuilder: (context, index) {
              return CharacterItem(
                charactersModel: characters[index],
              );
            },
          );
  }
}
