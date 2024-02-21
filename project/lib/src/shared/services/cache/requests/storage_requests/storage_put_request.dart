import '../../configs/cache_instance.dart';

class StoragePutRequest {
  static Future<void> put({
    required String key,
    required String data,
  }) async {
    await secureStorage.write(
      key: key,
      value: data,
    );
  }
}
