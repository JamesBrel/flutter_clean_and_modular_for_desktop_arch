import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpGetRequest {
  static Future<Response> get({
    required String apiUri,
    required Map<String, String> headers,
  }) async {
    var _response = await http.get(
      Uri.parse(apiUri),
      headers: headers,
    );
    return _response;
  }
}
