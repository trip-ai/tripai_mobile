import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tripai/data/models/place_model.dart';
import 'package:tripai/services/place_service.dart';

import '../../../data/models/error_model.dart';

part 'place_state.dart';

class PlaceCubit extends Cubit<PlaceState> {
  PlaceCubit() : super(PlaceState.init());

  final _service = PlaceService();

  Future<void> getById(int id) async {
    emit(state.copyWith(isLoading: true));
    try {
      var data = await _service.getById(id);

      emit(state.copyWith(isLoading: false, placeModel: data));
    } on ErrorModel catch (e) {
      emit(state.copyWith(isLoading: false, isError: true, error: e));
    }
  }
}
