abstract class ApiClient {
  Future<String> request({
    required String url,
    required String method,
    Map<String, dynamic>? body,
    Map<String, String>? header,
  });
}
