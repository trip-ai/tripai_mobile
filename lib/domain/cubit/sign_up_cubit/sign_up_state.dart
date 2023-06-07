part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  final bool isLoading;
  final bool isError;
  final ErrorModel? errorModel;
  final SignUpModel? signUpModel;

  const SignUpState({
    required this.isLoading,
    required this.isError,
    this.errorModel,
    this.signUpModel,
  });

  factory SignUpState.init() {
    return const SignUpState(
      isLoading: false,
      isError: false,
    );
  }

  SignUpState copyWith({
    bool? isLoading,
    bool? isError,
    ErrorModel? errorModel,
    SignUpModel? signUpModel,
  }) {
    return SignUpState(
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      errorModel: errorModel ?? this.errorModel,
      signUpModel: signUpModel ?? this.signUpModel,
    );
  }

  @override
  List<Object> get props => [
        isLoading.hashCode,
        isError.hashCode,
        errorModel.hashCode,
        signUpModel.hashCode,
      ];
}
