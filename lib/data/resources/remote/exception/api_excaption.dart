import 'package:http/http.dart';

class ApiException extends ClientException {
  final int statusCode;
  final bool isFriendly;

  ApiException(
    super.message, {
    required this.statusCode,
    required this.isFriendly,
  });
}
