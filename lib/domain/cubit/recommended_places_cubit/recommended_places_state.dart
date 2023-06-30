part of 'recommended_places_cubit.dart';

class RecommendedPlacesState extends Equatable {
  final bool isLoading;
  final bool isError;
  final ErrorModel? error;
  final List<PlaceModel>? list;

  const RecommendedPlacesState({
    required this.isLoading,
    required this.isError,
    this.list,
    this.error,
  });

  factory RecommendedPlacesState.init() {
    return const RecommendedPlacesState(
      isLoading: false,
      isError: false,
    );
  }

  RecommendedPlacesState copyWith({
    bool? isLoading,
    bool? isError,
    ErrorModel? error,
    List<PlaceModel>? list,
  }) {
    return RecommendedPlacesState(
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isLoading,
      error: error ?? this.error,
      list: list ?? this.list,
    );
  }

  @override
  List<Object> get props => [
        isLoading.hashCode,
        isError.hashCode,
        error.hashCode,
        list.hashCode,
      ];
}
