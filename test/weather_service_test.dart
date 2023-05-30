import 'package:flutter_test/flutter_test.dart';
import 'package:tripai/data/models/weather_model.dart';
import 'package:tripai/data/repositories/weather_repository.dart';
import 'package:tripai/data/resources/remote/http_services.dart';

void main() {
  group("Test Weather Repository", () {
    test('Success', () async {
      final client = HttpService();
      final WeatherRepository repository = WeatherRepository(client);
      var data = await repository.getWeather(lat: 40.506594, long: 68.776960);

      expect(data, isA<WeatherModel>());
    });

    test('Error', () async {
      final client = HttpService();
      final WeatherRepository repository = WeatherRepository(client);
      dynamic error;
      try {
        await repository.getWeather(lat: 2320, long: 32320);
      } catch (e) {
        error = e;
      }

      expect(error, isException);
    });
  });
}
