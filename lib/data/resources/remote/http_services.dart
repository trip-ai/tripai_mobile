import 'package:http/http.dart' as http;

import 'api_client.dart';

class HttpService implements ApiClient {
  final client = http.Client();

  @override
  Future<String> request({
    required String url,
    required String method,
    Map<String, dynamic>? body,
    Map<String, String>? header,
  }) async {
    http.Response response;
    switch (method) {
      case 'GET':
        response = await _getRequest(
          url: url,
          header: header,
        );
        break;
      case 'POST':
        response = await _postRequest(
          url: url,
          body: body ?? {},
          header: header,
        );
        break;
      default:
        throw Exception('No such method');
    }

    if (response.statusCode == 401) {
      //Todo: refresh token;
    }

    if (response.statusCode == 200) {
      return response.body;
    }

    throw Exception('Unknown error');
  }

  Future<http.Response> _getRequest({
    required String url,
    required Map<String, String>? header,
  }) async {
    return await client.get(
      Uri.parse(url),
      headers: header,
    );
  }

  Future<http.Response> _postRequest({
    required String url,
    required Map<String, dynamic> body,
    required Map<String, String>? header,
  }) async {
    return await client.post(
      Uri.parse(url),
      headers: header,
      body: body,
    );
  }
}
