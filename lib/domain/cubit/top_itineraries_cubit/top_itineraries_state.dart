part of 'top_itineraries_cubit.dart';

class TopItinerariesState extends Equatable {
  final bool isLoading;
  final bool isError;
  final ErrorModel? error;
  final List<ItineraryModel>? list;

  const TopItinerariesState({
    required this.isLoading,
    required this.isError,
    this.list,
    this.error,
  });

  factory TopItinerariesState.init() {
    return const TopItinerariesState(
      isLoading: false,
      isError: false,
    );
  }

  TopItinerariesState copyWith({
    bool? isLoading,
    bool? isError,
    ErrorModel? error,
    List<ItineraryModel>? list,
  }) {
    return TopItinerariesState(
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
