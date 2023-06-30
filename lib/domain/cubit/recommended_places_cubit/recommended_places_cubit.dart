import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/error_model.dart';
import '../../../data/models/place_model.dart';
import '../../../services/place_service.dart';

part 'recommended_places_state.dart';

class RecommendedPlacesCubit extends Cubit<RecommendedPlacesState> {
  RecommendedPlacesCubit() : super(RecommendedPlacesState.init());

  final _service = PlaceService();

  Future<void> getTop() async {
    emit(state.copyWith(isLoading: true));
    try {
      var data = await _service.getRecommended();

      emit(state.copyWith(isLoading: false, list: data));
    } on ErrorModel catch (e) {
      emit(state.copyWith(isLoading: false, isError: true, error: e));
    }
  }
}
