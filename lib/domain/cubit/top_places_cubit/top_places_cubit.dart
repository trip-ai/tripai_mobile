import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/error_model.dart';
import '../../../data/models/place_model.dart';
import '../../../services/place_service.dart';

part 'top_places_state.dart';

class TopPlacesCubit extends Cubit<TopPlacesState> {
  TopPlacesCubit() : super(TopPlacesState.init());

  final _service = PlaceService();

  Future<void> getTop() async {
    emit(state.copyWith(isLoading: true));
    try {
      var data = await _service.getTop();

      emit(state.copyWith(isLoading: false, list: data));
    } on ErrorModel catch (e) {
      emit(state.copyWith(isLoading: false, isError: true, error: e));
    }
  }
}
