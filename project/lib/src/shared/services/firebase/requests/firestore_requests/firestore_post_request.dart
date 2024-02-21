import '../../../../constants/lang_const.dart';
import '../../configs/firebase_instance.dart';
import '../../utils/status_util.dart';

class FirestorePostRequest {
  static Future<Map<String, dynamic>> post({
    required String collectionName,
    required Map<String, dynamic> data,
  }) async {
    return await firebaseFirestore
        .collection(collectionName)
        .doc(data["id"])
        .set(data["map"])
        .then<Map<String, dynamic>>(
          (value) => {
            "status": FirebaseStatus.created,
          },
        )
        .catchError((err) => {
              "status": FirebaseStatus.internalServerError,
              "message": Lang.serverErrorText,
            });
  }
}
