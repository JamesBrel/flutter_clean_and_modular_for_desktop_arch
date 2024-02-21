import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpPostRequest {
  static Future<Response> post({
    required String apiUri,
    required dynamic contentBody,
    required Map<String, String> headers,
  }) async {
    var _response = await http.post(
      Uri.parse(apiUri),
      headers: headers,
      body: contentBody,
    );
    return _response;
  }

//   Future<String> put() async {
//     return "";
//   }

//   Future<String> delete() async {
//     return "";
//   }

//   Future<String> patch() async {
//     return "";
//   }

//   Future<String> head() async {
//     return "";
//   }

//   Future<String> options() async {
//     return "";
//   }
}
