part of 'weather_cubit.dart';

class WeatherState extends Equatable {
  final bool isLoading;
  final bool isLoaded;
  final bool isError;
  final ErrorModel? error;
  final WeatherModel weather;

  const WeatherState({
    required this.isLoading,
    required this.isLoaded,
    required this.isError,
    required this.weather,
    this.error,
  });

  factory WeatherState.init() {
    return WeatherState(
      isLoading: false,
      isLoaded: false,
      isError: false,
      weather: WeatherModel(
        location: WeatherLocationModel(
          name: 'Tashkent',
          region: 'Tashkent',
          country: 'Uzbekistan',
          lat: 40.506958,
          lon: 68.766166,
          tzId: '',
          localtimeEpoch: 0,
          localtime: DateTime.now(),
        ),
        current: WeatherCurrentModel(
          lastUpdatedEpoch: 0,
          lastUpdated: '',
          tempC: 0.0,
          tempF: 0.0,
          isDay: 0,
          condition: WeatherConditionModel(
            text: '',
            icon: '',
            code: 0,
          ),
          windMph: 0.0,
          windKph: 0.0,
          windDegree: 0,
          windDir: '',
          pressureMb: 0,
          pressureIn: 0.0,
          precipMm: 0,
          precipIn: 0,
          humidity: 0,
          cloud: 0,
          feelslikeC: 0.0,
          feelslikeF: 0.0,
          visKm: 0,
          visMiles: 0,
          uv: 0,
          gustMph: 0.0,
          gustKph: 0.0,
        ),
      ),
    );
  }

  WeatherState copyWith({
    bool? isLoading,
    bool? isLoaded,
    bool? isError,
    ErrorModel? error,
    WeatherModel? weather,
  }) {
    return WeatherState(
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
      isError: isError ?? this.isError,
      error: error ?? this.error,
      weather: weather ?? this.weather,
    );
  }

  @override
  List<Object> get props => [
        isLoading.hashCode,
        isLoaded.hashCode,
        isError.hashCode,
        error.hashCode,
        weather.hashCode,
      ];
}
