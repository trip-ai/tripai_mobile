import '../data/models/sign_up_model.dart';
import '../data/repositories/local_data_repository.dart';
import '../data/repositories/sign_up_repository.dart';
import '../data/resources/remote/api_client.dart';
import '../data/resources/remote/http_services.dart';

class ProfileService {
  final ApiClient client = HttpService();

  Future<SignUpModel> onSignUp({
    required String name,
    required String email,
    required String imageUrl,
    required String providerId,
    required String provider,
  }) async {
    final repo = SignUpRepository(client);

    SignUpModel signUpModel = await repo.signUp(
      name: name,
      email: email,
      imageUrl: imageUrl,
      providerId: providerId,
      provider: provider,
    );

    LocalDataRepository.accessToken = signUpModel.token;

    return signUpModel;
  }
}
