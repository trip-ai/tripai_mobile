import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/error_model.dart';
import '../../../data/models/sign_up_model.dart';
import '../../../services/profile_service.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpState.init());

  final _service = ProfileService();

  Future<void> onSignUp({
    required String name,
    required String email,
    required String imageUrl,
    required String providerId,
    required String provider,
  }) async {
    try {
      emit(state.copyWith(isLoading: true));
      SignUpModel signUpModel = await _service.onSignUp(
        name: name,
        email: email,
        imageUrl: imageUrl,
        providerId: providerId,
        provider: provider,
      );
      emit(
        state.copyWith(
          isLoading: false,
          isError: false,
          signUpModel: signUpModel,
        ),
      );
    } on ErrorModel catch (e) {
      emit(state.copyWith(
        isLoading: false,
        isError: true,
        errorModel: e,
        signUpModel: null,
      ));
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          isError: true,
          errorModel: ErrorModel(
            id: 0,
            isFriendly: false,
            message: e.toString(),
          ),
          signUpModel: null,
        ),
      );
    }
  }
}
