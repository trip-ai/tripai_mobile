part of 'place_cubit.dart';

class PlaceState extends Equatable {
  final bool isLoading;
  final bool isError;
  final ErrorModel? error;
  final PlaceModel? placeModel;

  const PlaceState({
    required this.isLoading,
    required this.isError,
    this.placeModel,
    this.error,
  });

  factory PlaceState.init() {
    return const PlaceState(
      isLoading: false,
      isError: false,
    );
  }

  PlaceState copyWith({
    bool? isLoading,
    bool? isError,
    ErrorModel? error,
    PlaceModel? placeModel,
  }) {
    return PlaceState(
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isLoading,
      error: error ?? this.error,
      placeModel: placeModel ?? this.placeModel,
    );
  }

  @override
  List<Object> get props => [
        isLoading.hashCode,
        isError.hashCode,
        error.hashCode,
        placeModel.hashCode,
      ];
}
