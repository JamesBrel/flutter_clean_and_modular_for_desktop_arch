import 'dart:convert';

class DecryptRequest {
  static String decrypt({
    required String dataEncrypted,
  }) {
    var bytes = base64.decode(dataEncrypted);
    var decrypted = utf8.decode(bytes);
    return decrypted;
  }
}
