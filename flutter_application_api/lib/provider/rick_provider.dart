import 'package:flutter/material.dart';
import 'package:flutter_application_api/models/rick_model.dart';
import 'package:flutter_application_api/services/rick_service.dart';

enum RequestStatus {
  none,
  loading,
  loaded,
  failed,
}

class RickProvider extends ChangeNotifier {
  RickProvider({
    this.characters = const <RickModel>[],
    this.requestStatus = RequestStatus.none,
  });

  List<RickModel> characters;
  RequestStatus requestStatus;

  final rickService = RickService();

  getCharacters() async {
    try {
      requestStatus = RequestStatus.loading;
      notifyListeners();
      await Future.delayed(const Duration(seconds: 3));
      final responseMovies = await rickService.getCharacters();
      characters = responseMovies;
      requestStatus = RequestStatus.loaded;
      notifyListeners();
    } catch (exception) {
      requestStatus = RequestStatus.failed;
      notifyListeners();
    }
  }
}
