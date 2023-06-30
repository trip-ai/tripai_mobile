import 'dart:convert';

import '../env/env.dart';
import '../models/itinerary_model.dart';
import '../resources/remote/api_client.dart';

class ItineraryRepository {
  final ApiClient _client;

  ItineraryRepository(ApiClient client) : _client = client;

  Future<List<ItineraryModel>> getAll() async {
    String url = '${AppEnvironment.baseUrl}/api/itinerary';

    var data = await _client.request(url: url, method: 'GET');

    var list = List<ItineraryModel>.from(jsonDecode(data));

    return list;
  }

  Future<ItineraryModel> getById(int id) async {
    String url = '${AppEnvironment.baseUrl}/api/itinerary/$id';

    var data = await _client.request(url: url, method: 'GET');

    return ItineraryModel.fromJson(jsonDecode(data));
  }
}
