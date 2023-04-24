import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/characters_overview.dart';
import './providers/characters_provider.dart';
import './screens/characters_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CharactersProv()),
      ],
      child: MaterialApp(
        title: 'wubba lubba dub dub',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.light(
            primary: Color.fromRGBO(44, 231, 30, 1),
          ),
          textTheme: ThemeData.light().textTheme.copyWith(
                headline1: const TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                bodyText1: const TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                headline2: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 28,
                  color: Colors.white.withOpacity(1),
                  fontWeight: FontWeight.bold,
                ),
                bodyText2: const TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
        home: CharactersOverview(),
        routes: {
          CharactersDetails.RouteName: (context) => CharactersDetails(),
        },
      ),
    );
  }
}
