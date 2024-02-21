import '../../configs/cache_instance.dart';
import '../../enums/shared_preference_enum.dart';

class SharedPutRequest {
  static Future<void> put({
    required String key,
    required Map<String, dynamic> data,
    required Preferences preferences,
  }) async {
    switch (preferences) {
      case Preferences.stringType:
        (await sharedPreferences).setString(key, data["value"]);
        break;
      case Preferences.boolType:
        (await sharedPreferences).setBool(key, data["value"]);
        break;
      case Preferences.intType:
        (await sharedPreferences).setInt(key, data["value"]);
      case Preferences.doubleType:
        (await sharedPreferences).setDouble(key, data["value"]);
        break;
      case Preferences.stringListType:
        (await sharedPreferences).setStringList(key, data["value"]);
        break;
    }
  }
}
