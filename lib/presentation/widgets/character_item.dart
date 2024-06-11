import 'package:flutter/material.dart';
import 'package:shop/constants/my_colors.dart';
import 'package:shop/constants/strings.dart';
import 'package:shop/data/models/characters_model.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({super.key, required this.charactersModel});

  final CharactersModel charactersModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, characterDetailsScreen,
            arguments: charactersModel),
        child: GridTile(
          footer: Hero(
            tag: charactersModel.id,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child: Text(
                charactersModel.name,
                style: const TextStyle(
                  height: 1.3,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: MyColors.myWhite,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          child: Container(
            color: MyColors.myGrey,
            child: charactersModel.image.isNotEmpty
                ? FadeInImage.assetNetwork(
                    width: MediaQuery.of(context).size.width * 0.01,
                    height: MediaQuery.of(context).size.height * 0.1,
                    placeholder: 'assets/images/Loading1.gif',
                    image: charactersModel.image,
                    fit: BoxFit.fill,
                  )
                : Image.asset('assets/images/No_Found.gif'),
          ),
        ),
      ),
    );
  }
}
