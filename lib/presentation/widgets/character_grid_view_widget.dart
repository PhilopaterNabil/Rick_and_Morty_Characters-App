import 'package:flutter/material.dart';
import 'package:shop/data/models/characters_model.dart';
import 'package:shop/presentation/widgets/character_item.dart';
import 'package:shop/presentation/widgets/custom_search_not_found.dart';

class CharacterGridViewWidget extends StatelessWidget {
  const CharacterGridViewWidget({
    super.key,
    required this.characters,
  });
  final List<CharactersModel> characters;

  @override
  Widget build(BuildContext context) {
    return characters.isEmpty
        ? const CustomSearchNotFound()
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
