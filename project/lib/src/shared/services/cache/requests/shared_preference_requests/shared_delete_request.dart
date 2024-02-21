import '../../configs/cache_instance.dart';

class SharedDeleteRequest {
  static Future<Map<String, dynamic>> delete({
    required String key,
  }) async {
    return (await sharedPreferences).remove(key).then(
          (value) => {
            "status": true,
          },
        );
  }
}
