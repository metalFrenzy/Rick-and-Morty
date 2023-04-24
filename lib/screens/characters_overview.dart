import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/characters_grid.dart';
import '../providers/characters_provider.dart';

class CharactersOverview extends StatefulWidget {
  const CharactersOverview({super.key});

  @override
  State<CharactersOverview> createState() => _CharactersOverviewState();
}

class _CharactersOverviewState extends State<CharactersOverview> {
  var _isLoading = false;
  bool isInit = true;
  @override
  void didChangeDependencies() {
    if (isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<CharactersProv>(context).fetchCharacters().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    isInit = false;
    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(160, 255, 00, 1),
                Color.fromRGBO(102, 255, 01, 1),
                Color.fromRGBO(44, 231, 30, 1),
                Color.fromRGBO(10, 175, 48, 1),
              ],
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Rick and Morty',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(160, 255, 00, 1),
                Color.fromRGBO(102, 255, 01, 1),
                Color.fromRGBO(44, 231, 30, 1),
              ],
            ),
          ),
          child: _isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : CharactersGrid(),
        ),
      ),
    );
  }
}
