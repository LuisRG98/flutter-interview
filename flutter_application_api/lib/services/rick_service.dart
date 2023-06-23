import 'package:dio/dio.dart';
import 'package:flutter_application_api/models/rick_model.dart';

class RickService {
  final dio = Dio();
  final urlBase = 'https://rickandmortyapi.com/api';
  final endPointt = '/character';

  Future<List<RickModel>> getCharacters() async {
    final urlRequest = urlBase + endPointt;
    final response = await dio.get(urlRequest);

    if (response.statusCode == 200) {
      final rickJson = response.data['results'];
      final rick = List<RickModel>.from(
          rickJson.map((json) => RickModel.fromJson(json)));

      return rick;
    }

    throw Exception('Something went wrong');
  }
}
