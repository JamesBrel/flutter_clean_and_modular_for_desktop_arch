import '../../../../constants/lang_const.dart';
import '../../configs/firebase_instance.dart';
import '../../utils/status_util.dart';

class FirestoreDeleteRequest {
  static Future<Map<String, dynamic>> deleteOne({
    required String collectionName,
    required Map<String, dynamic> data,
  }) async {
    return await firebaseFirestore
        .collection(collectionName)
        .doc(data["id"])
        .delete()
        .then<Map<String, dynamic>>(
          (value) => {
            "status": FirebaseStatus.ok,
          },
        )
        .catchError((err) => {
              "status": FirebaseStatus.internalServerError,
              "message": Lang.serverErrorText,
            });
  }
}
