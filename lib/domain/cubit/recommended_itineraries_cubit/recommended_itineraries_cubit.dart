import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/error_model.dart';
import '../../../data/models/itinerary_model.dart';
import '../../../services/itinerary_service.dart';

part 'recommended_itineraries_state.dart';

class TopItinerariesCubit extends Cubit<RecommendedItinerariesState> {
  TopItinerariesCubit() : super(RecommendedItinerariesState.init());

  final _service = ItineraryService();

  Future<void> getRecommended() async {
    emit(state.copyWith(isLoading: true));
    try {
      var data = await _service.getRecommended();

      emit(state.copyWith(isLoading: false, list: data));
    } on ErrorModel catch (e) {
      emit(state.copyWith(isLoading: false, isError: true, error: e));
    }
  }
}
