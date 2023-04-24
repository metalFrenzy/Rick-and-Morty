import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/characters_provider.dart';
import './characters_item.dart';

class CharactersGrid extends StatelessWidget {
  const CharactersGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final charList = Provider.of<CharactersProv>(context).charsList;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 8,
        childAspectRatio: 3 / 2.5,
      ),
      itemBuilder: (context, index) => CharactersItem(
        charList[index].id,
        charList[index].name,
        charList[index].image,
      ),
      itemCount: charList.length,
    );
  }
}
