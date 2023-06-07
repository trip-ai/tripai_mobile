import 'dart:convert';

import 'package:tripai/data/env/env.dart';

import '../models/sign_up_model.dart';
import '../resources/remote/api_client.dart';

class SignUpRepository {
  final ApiClient _client;

  SignUpRepository(ApiClient client) : _client = client;

  Future<SignUpModel> signUp({
    required String name,
    required String email,
    required String imageUrl,
    required String providerId,
    required String provider,
  }) async {
    String url = '${AppEnvironment.baseUrl}/api/auth/sign-in';
    var data = await _client.request(
      url: url,
      method: 'POST',
      body: {
        "name": name,
        "email": email,
        "imageUrl": imageUrl,
        "providerId": providerId,
        "provider": provider,
      },
    );
    return SignUpModel.fromJson(jsonDecode(data));
  }
}
