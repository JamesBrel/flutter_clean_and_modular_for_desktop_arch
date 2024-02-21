import '../../configs/cache_instance.dart';

class StreamDeleteRequest {
  static Future<void> delete({
    required String key,
  }) async {
    await (await sharedPreferencesStream).remove(key);
  }
}
