import '../../configs/cache_instance.dart';
import '../../enums/shared_preference_enum.dart';

class StreamGetRequest {
  static Stream<Map<String, dynamic>> get({
    required String key,
    required Preferences preferences,
    required Map<String, dynamic> data,
  }) async* {
    switch (preferences) {
      case Preferences.stringType:
        yield* (await sharedPreferencesStream)
            .getString(key, defaultValue: data["defaultValue"])
            .map((dataEvent) => {
                  "data": dataEvent,
                });

      case Preferences.boolType:
        yield* (await sharedPreferencesStream)
            .getBool(key, defaultValue: data["defaultValue"])
            .map((dataEvent) => {
                  "data": dataEvent,
                });

      case Preferences.intType:
        yield* (await sharedPreferencesStream)
            .getInt(key, defaultValue: data["defaultValue"])
            .map((dataEvent) => {
                  "data": dataEvent,
                });

      case Preferences.doubleType:
        yield* (await sharedPreferencesStream)
            .getDouble(key, defaultValue: data["defaultValue"])
            .map((dataEvent) => {
                  "data": dataEvent,
                });

      case Preferences.stringListType:
        yield* (await sharedPreferencesStream)
            .getStringList(key, defaultValue: data["defaultValue"])
            .map((dataEvent) => {
                  "data": dataEvent,
                });
    }
  }
}
