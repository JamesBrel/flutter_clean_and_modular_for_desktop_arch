import '../../configs/cache_instance.dart';
import '../../enums/shared_preference_enum.dart';

class SharedGetRequest {
  static Future<Map<String, dynamic>> get({
    required String key,
    required Preferences preferences,
  }) async {
    if ((await sharedPreferences).containsKey(key)) {
      switch (preferences) {
        case Preferences.stringType:
          return {
            "status": true,
            "data": (await sharedPreferences).getString(key)!,
          };

        case Preferences.boolType:
          return {
            "status": true,
            "data": (await sharedPreferences).getBool(key)!,
          };

        case Preferences.intType:
          return {
            "status": true,
            "data": (await sharedPreferences).getInt(key)!,
          };

        case Preferences.doubleType:
          return {
            "status": true,
            "data": (await sharedPreferences).getDouble(key)!,
          };

        case Preferences.stringListType:
          return {
            "status": true,
            "data": (await sharedPreferences).getStringList(key)!,
          };
      }
    } else {
      return {
        "status": false,
      };
    }
  }
}
