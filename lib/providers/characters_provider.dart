import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/characters_model.dart';

class CharactersProv with ChangeNotifier {
  List<CharacterModel> _charsList = [];

  List<CharacterModel> get charsList {
    return [..._charsList];
  }

  CharacterModel findById(id) {
    return _charsList.firstWhere(
      (c) => c.id == id,
    );
  }

  Future<void> fetchCharacters() async {
    var url = Uri.parse('https://rickandmortyapi.com/api/character');
    try {
      final response = await http.get(url);
      List<CharacterModel> fetchedChars = [];
      final data = json.decode(response.body)['results'] as List<dynamic>;
      fetchedChars = data.map((e) => CharacterModel.fromJson(e)).toList();
      _charsList = fetchedChars;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
