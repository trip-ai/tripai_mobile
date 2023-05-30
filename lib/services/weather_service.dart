import '../data/models/weather_model.dart';
import '../data/repositories/weather_repository.dart';
import '../data/resources/remote/api_client.dart';
import '../data/resources/remote/http_services.dart';

class WeatherService {
  final ApiClient client = HttpService();

  Future<WeatherModel> getWeather({
    required double lat,
    required double long,
  }) async {
    var repo = WeatherRepository(client);
    return repo.getWeather(lat: lat, long: long);
  }
}
