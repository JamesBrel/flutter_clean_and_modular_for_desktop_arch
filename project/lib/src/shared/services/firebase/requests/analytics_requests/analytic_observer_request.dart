import 'package:firebase_analytics/firebase_analytics.dart';

import '../../configs/firebase_instance.dart';

class AnalyticObserverRequest {
  static FirebaseAnalyticsObserver initObserverNavigator() =>
      FirebaseAnalyticsObserver(analytics: firebaseAnalyser);
}
