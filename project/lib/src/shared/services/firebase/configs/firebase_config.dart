import 'package:firebase_core/firebase_core.dart';

import '../options/dev/firebase_emulators_dev.dart';
import '../options/dev/firebase_options_dev.dart' as option_dev;
import '../options/staging/firebase_options_staging.dart' as option_staging;
import '../utils/string_util.dart';

class FirebaseConfig {
  static Future<void> init({
    required String env,
  }) async {
    switch (env) {
      case dev:
        await Firebase.initializeApp(
          options: option_dev.DefaultFirebaseOptions.currentPlatform,
        ).then((value) {
          if (const bool.fromEnvironment("USE_FIREBASE_EMU")) {
            Emulators.auth();
            Emulators.firestore();
          }
        });
        break;
      case staging:
        await Firebase.initializeApp(
          options: option_staging.DefaultFirebaseOptions.currentPlatform,
        );
        break;

      default:
        // await Firebase.initializeApp(
        //         name: "prod"
        //   options: prod.DefaultFirebaseOptions.currentPlatform);
        // await FirebaseAppCheck.instance.activate(
        //     // androidProvider: AndroidProvider.debug,
        //     );
        break;
    }
  }
}
