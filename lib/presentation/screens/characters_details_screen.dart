import 'package:flutter/material.dart';
import 'package:flutter_breaking_bad/constants/colors.dart';

import 'package:flutter_breaking_bad/data/models/characters.dart';

class CharacterDetailsScreen extends StatelessWidget {
  const CharacterDetailsScreen({
    Key? key,
    required this.character,
  }) : super(key: key);
  final Character character;

  Widget buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height * 0.8, //600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.grey,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          character.nickName,
          style: const TextStyle(
            color: MyColors.white,
          ),
        ),
        background: Hero(
          tag: character.charId,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
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
                color: MyColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
          TextSpan(
              text: value,
              style: const TextStyle(
                color: MyColors.white,
                fontSize: 16,
              ))
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: MyColors.yellow,
      height: 30,
      endIndent: endIndent,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.grey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(context),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo('Job : ', character.jobs.join(', ')),
                      buildDivider(315),
                      characterInfo('Appered in : ', character.categorySeries),
                      buildDivider(250),
                      characterInfo('Seasons : ',
                          character.appearanceOfSeasons.join(', ')),
                      buildDivider(270),
                      characterInfo('Status : ', character.status),
                      buildDivider(290),
                      character.betterCallSaulApp.isEmpty
                          ? Container()
                          : characterInfo('Better Sall Saul Seasons : ',
                              character.betterCallSaulApp.join(', ')),
                      character.betterCallSaulApp.isEmpty
                          ? Container()
                          : buildDivider(150),
                      characterInfo('Actor/Actress : ', character.actorName),
                      buildDivider(230),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                const SizedBox(height: 500),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
