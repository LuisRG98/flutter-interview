import 'package:flutter/material.dart';
import 'package:flutter_application_api/models/rick_model.dart';
import 'package:flutter_application_api/services/rick_service.dart';

class RickProvider extends ChangeNotifier {
  RickProvider({this.characters = const <RickModel>[]}) {
    getCharacter();
  }

  List<RickModel> characters;

  final rickService = RickService();

  getCharacter() async {
    final responseRick = await rickService.getCharacters();
    characters = responseRick;
    notifyListeners();
  }
}
