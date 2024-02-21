import '../../configs/cache_instance.dart';
import '../../enums/shared_preference_enum.dart';

class StreamPutRequest {
  static Future<void> put({
    required String key,
    required Map<String, dynamic> data,
    required Preferences preferences,
  }) async {
    switch (preferences) {
      case Preferences.stringType:
        (await sharedPreferencesStream).setString(key, data["value"]);
        break;
      case Preferences.boolType:
        (await sharedPreferencesStream).setBool(key, data["value"]);
        break;
      case Preferences.intType:
        (await sharedPreferencesStream).setInt(key, data["value"]);
      case Preferences.doubleType:
        (await sharedPreferencesStream).setDouble(key, data["value"]);
        break;
      case Preferences.stringListType:
        (await sharedPreferencesStream).setStringList(key, data["value"]);
        break;
    }
  }
}
