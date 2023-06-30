part of 'recommended_itineraries_cubit.dart';

class RecommendedItinerariesState extends Equatable {
  final bool isLoading;
  final bool isError;
  final ErrorModel? error;
  final List<ItineraryModel>? list;

  const RecommendedItinerariesState({
    required this.isLoading,
    required this.isError,
    this.list,
    this.error,
  });

  factory RecommendedItinerariesState.init() {
    return const RecommendedItinerariesState(
      isLoading: false,
      isError: false,
    );
  }

  RecommendedItinerariesState copyWith({
    bool? isLoading,
    bool? isError,
    ErrorModel? error,
    List<ItineraryModel>? list,
  }) {
    return RecommendedItinerariesState(
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
