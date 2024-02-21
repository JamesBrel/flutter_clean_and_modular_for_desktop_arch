import '../../configs/cache_instance.dart';

class StorageDeleteRequest {
  static Future<void> delete({
    required String key,
    required String data,
  }) async {
    await secureStorage.delete(
      key: key,
    );
  }
}
