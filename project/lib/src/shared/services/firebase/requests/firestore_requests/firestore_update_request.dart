import '../../../../constants/lang_const.dart';
import '../../configs/firebase_instance.dart';
import '../../utils/status_util.dart';

class FirestoreUpdateRequest {
  static Future<Map<String, dynamic>> updateOne({
    required String collectionName,
    required Map<String, dynamic> data,
  }) async {
    return await firebaseFirestore
        .collection(collectionName)
        .doc(data["id"])
        .update(data["map"])
        .then<Map<String, dynamic>>(
          (_snapShotData) => {
            "status": FirebaseStatus.ok,
          },
        )
        .catchError((err) => {
              "status": FirebaseStatus.internalServerError,
              "message": Lang.serverErrorText,
            });
  }
}
