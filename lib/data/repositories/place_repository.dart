import 'dart:convert';

import '../env/env.dart';
import '../models/place_model.dart';
import '../resources/remote/api_client.dart';

class PlaceRepository {
  final ApiClient _client;

  PlaceRepository(ApiClient client) : _client = client;

  Future<List<PlaceModel>> getAll() async {
    String url = '${AppEnvironment.baseUrl}/api/place';

    var data = await _client.request(url: url, method: 'GET');

    var list = List<PlaceModel>.from(jsonDecode(data));

    return list;
  }

  Future<PlaceModel> getById(int id) async {
    String url = '${AppEnvironment.baseUrl}/api/place/$id';

    var data = await _client.request(url: url, method: 'GET');

    return PlaceModel.fromJson(jsonDecode(data));
  }
}
