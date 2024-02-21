import '../../configs/firebase_instance.dart';

class AnalyticGetEventRequest {
  static Future<void> get({
    required String eventName,
    required Map<String, dynamic> eventParameters,
  }) async {
    await firebaseAnalyser.logEvent(
      name: eventName,
      parameters: eventParameters,
    );
  }
}
