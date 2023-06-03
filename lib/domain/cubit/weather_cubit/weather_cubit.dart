import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/error_model.dart';
import '../../../data/models/weather_model.dart';
import '../../../services/weather_service.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherState.init());

  Future<void> getWeather({required double lat, required double long}) async {
    emit(state.copyWith(isLoading: true));

    try {
      var service = WeatherService();
      var data = await service.getWeather(lat: lat, long: long);
      emit(state.copyWith(isLoading: false, isLoaded: true, weather: data));
    } on ErrorModel catch (error) {
      emit(state.copyWith(isLoading: false, isError: true, error: error));
    } catch (e) {
      var error = ErrorModel(id: 0, isFriendly: false, message: e.toString());
      emit(state.copyWith(isLoading: false, isError: true, error: error));
    }
  }
}
