import 'dart:convert';

class EncryptRequest {
  static String encrypt({
    required String data,
  }) {
    var bytes = utf8.encode(data);
    var encrypted = base64.encode(bytes);
    return encrypted;
  }
}
