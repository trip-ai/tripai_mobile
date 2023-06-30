part of 'top_places_cubit.dart';

class TopPlacesState extends Equatable {
  final bool isLoading;
  final bool isError;
  final ErrorModel? error;
  final List<PlaceModel>? list;

  const TopPlacesState({
    required this.isLoading,
    required this.isError,
    this.list,
    this.error,
  });

  factory TopPlacesState.init() {
    return const TopPlacesState(
      isLoading: false,
      isError: false,
    );
  }

  TopPlacesState copyWith({
    bool? isLoading,
    bool? isError,
    ErrorModel? error,
    List<PlaceModel>? list,
  }) {
    return TopPlacesState(
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
