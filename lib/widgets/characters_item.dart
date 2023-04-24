import 'package:flutter/material.dart';
import 'package:rick_and_morty/screens/characters_details.dart';

class CharactersItem extends StatelessWidget {
  final int? id;
  final String? name;
  final String? imageUrl;

  CharactersItem(this.id, this.name, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        top: 10,
        bottom: 4,
        right: 4,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 60, 59, 59),
              blurRadius: 5.0,
              offset: Offset(0, 5),
            ),
            BoxShadow(
              color: Colors.transparent,
              blurRadius: 5.0,
              offset: Offset(-5, 0),
            ),
            BoxShadow(
              color: Colors.transparent,
              offset: Offset(5, 0),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GridTile(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  CharactersDetails.RouteName,
                  arguments: id!,
                );
              },
              child: Hero(
                tag: id!,
                child: FadeInImage(
                  placeholder: AssetImage('assets/images/placeholder.jpg'),
                  image: NetworkImage(imageUrl!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            footer: GridTileBar(
              backgroundColor: Colors.black45,
              title: Text(
                name!,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
