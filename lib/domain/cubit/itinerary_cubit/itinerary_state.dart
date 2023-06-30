part of 'itinerary_cubit.dart';

class ItineraryState extends Equatable {
  final bool isLoading;
  final bool isError;
  final ErrorModel? error;
  final ItineraryModel? itineraryModel;

  const ItineraryState({
    required this.isLoading,
    required this.isError,
    this.itineraryModel,
    this.error,
  });

  factory ItineraryState.init() {
    return const ItineraryState(
      isLoading: false,
      isError: false,
    );
  }

  ItineraryState copyWith({
    bool? isLoading,
    bool? isError,
    ErrorModel? error,
    ItineraryModel? itineraryModel,
  }) {
    return ItineraryState(
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isLoading,
      error: error ?? this.error,
      itineraryModel: itineraryModel ?? this.itineraryModel,
    );
  }

  @override
  List<Object> get props => [
        isLoading.hashCode,
        isError.hashCode,
        error.hashCode,
        itineraryModel.hashCode,
      ];
}
