import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/error_model.dart';
import '../../../data/models/itinerary_model.dart';
import '../../../services/itinerary_service.dart';

part 'itinerary_state.dart';

class ItineraryCubit extends Cubit<ItineraryState> {
  ItineraryCubit() : super(ItineraryState.init());

  final _service = ItineraryService();

  Future<void> getById(int id) async {
    emit(state.copyWith(isLoading: true));
    try {
      var data = await _service.getById(id);

      emit(state.copyWith(isLoading: false, itineraryModel: data));
    } on ErrorModel catch (e) {
      emit(state.copyWith(isLoading: false, isError: true, error: e));
    }
  }
}
