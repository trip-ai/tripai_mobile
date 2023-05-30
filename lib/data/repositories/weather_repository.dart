import 'dart:convert';

import 'package:tripai/data/env/env.dart';
import 'package:tripai/data/models/weather_model.dart';
import 'package:tripai/data/resources/remote/api_client.dart';

class WeatherRepository {
  final ApiClient _client;

  WeatherRepository(ApiClient client) : _client = client;

  Future<WeatherModel> getWeather({
    required double lat,
    required double long,
  }) async {
    String url = '${AppEnvironment.weatherApi}&q=$lat,$long&aqi=no';
    try {
      var data = await _client.request(url: url, method: 'GET');
      return WeatherModel.fromJson(jsonDecode(data));
    } catch (e) {
      rethrow;
    }
  }
}
