import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../domain/core/log.dart';
import '../../repositories/local_data_repository.dart';
import 'api_client.dart';

class HttpService implements ApiClient {
  final client = http.Client();

  Map<String, String> _getHeader(Map<String, String>? header) {
    final requestHeader = header ?? {};

    requestHeader.addAll({'content-type': 'application/json'});

    final accessToken = LocalDataRepository.accessToken;

    if (LocalDataRepository.accessToken.isNotEmpty) {
      requestHeader.addAll({'Authorization': 'Bearer $accessToken'});
    }

    return requestHeader;
  }

  @override
  Future<String> request({
    required String url,
    required String method,
    Map<String, dynamic>? body,
    Map<String, String>? header,
  }) async {
    final requestHeader = _getHeader(header);

    http.Response response;
    try {
      switch (method) {
        case 'GET':
          response = await _getRequest(
            url: url,
            header: requestHeader,
          );
          break;
        case 'POST':
          response = await _postRequest(
            url: url,
            body: body ?? {},
            header: requestHeader,
          );
          break;
        default:
          throw Exception('No such method');
      }

      logWarning('================');
      logWarning('| URL |\n$url');
      logWarning('| Header |\n$requestHeader');
      logWarning('| Body |\n$body');
      logWarning('| Response (${response.statusCode})|\n${response.body}');
      logWarning('================');

      if (response.statusCode == 401) {
        //Todo: refresh token;
      }

      if (response.statusCode == 200) {
        return response.body;
      }

      throw Exception('Unknown error');
    } catch (e) {
      logError('================');
      logError('| URL |\n$url');
      logError('| Header |\n$requestHeader');
      logError('| Body |\n$body');
      logError('| Error |\n$e');
      logError('================');
      rethrow;
    }
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
      body: jsonEncode(body),
    );
  }
}
