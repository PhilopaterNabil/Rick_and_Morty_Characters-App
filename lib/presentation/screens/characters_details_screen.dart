import 'package:flutter/material.dart';
import 'package:shop/constants/my_colors.dart';
import 'package:shop/data/models/characters_model.dart';

class CharactersDetailsScreen extends StatelessWidget {
  const CharactersDetailsScreen({super.key, required this.character});

  final CharactersModel character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(context),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsetsDirectional.all(14),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo('Status : ', character.status),
                      buildDivider(315),
                      characterInfo('Species : ', character.species),
                      buildDivider(250),
                      characterInfo('gender : ', character.gender),
                      buildDivider(280),
                      characterInfo(
                          'Name of origin site : ', character.origin.name),
                      buildDivider(300),
                      characterInfo(
                          'Current location : ', character.location.name),
                      buildDivider(270),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.54,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      iconTheme: const IconThemeData(
        color: MyColors.myGrey,
        size: 26,
        shadows: [
          Shadow(
            color: MyColors.myYellow,
            blurRadius: 10,
          ),
        ],
      ),
      expandedHeight: MediaQuery.of(context).size.height * 0.75,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.name,
          maxLines: 1,
          style: const TextStyle(
            color: MyColors.myGrey,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: MyColors.myYellow,
                blurRadius: 10,
              ),
            ],
          ),
        ),
        background: Hero(
          tag: character.id,
          child: Image.network(
            character.image,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: MyColors.myWhite,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: MyColors.myYellow,
      height: 35,
      endIndent: endIndent,
      thickness: 2.6,
    );
  }
}
