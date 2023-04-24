import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/characters_provider.dart';

class CharactersDetails extends StatelessWidget {
  static const RouteName = '/details';
  @override
  Widget build(BuildContext context) {
    final charId = ModalRoute.of(context)!.settings.arguments as int;
    final loadedChar =
        Provider.of<CharactersProv>(context, listen: false).findById(charId);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color.fromRGBO(160, 255, 01, 1),
              Color.fromRGBO(44, 231, 30, 1),
              Color.fromRGBO(10, 175, 48, 1),
            ],
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 350,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  loadedChar.name!,
                  style: Theme.of(context).textTheme.headline2,
                ),
                background: Hero(
                  tag: loadedChar.id!,
                  child: Image.network(
                    loadedChar.image!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 8, right: 8),
                    child: Row(
                      children: [
                        Icon(
                          size: 17,
                          Icons.circle,
                          color: loadedChar.status == 'Alive'
                              ? Colors.green
                              : Colors.red,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          loadedChar.status!,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          '-',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          loadedChar.species!,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 9, right: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Orgin: ',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 75, 72, 72),
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          loadedChar.origin!.name!,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Last known Location: ',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 75, 72, 72),
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          loadedChar.location!.name!,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Gender: ',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 75, 72, 72),
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          loadedChar.gender!,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        SizedBox(
                          height: 800,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
