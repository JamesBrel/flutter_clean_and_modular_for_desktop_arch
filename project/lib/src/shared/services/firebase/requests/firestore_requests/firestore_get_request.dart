import '../../../../constants/lang_const.dart';
import '../../configs/firebase_instance.dart';
import '../../utils/status_util.dart';

class FirestoreGetRequest {
  static Future<Map<String, dynamic>> getOne({
    required String collectionName,
    required Map<String, dynamic> data,
  }) async {
    return await firebaseFirestore
        .collection(collectionName)
        .doc(data["id"])
        .get()
        .then<Map<String, dynamic>>(
      (_snapShotDoc) {
        if (_snapShotDoc.exists) {
          return {
            "status": FirebaseStatus.ok,
            "data": _snapShotDoc.data(),
          };
        } else {
          return {
            "status": FirebaseStatus.noContent,
            "message": Lang.noContentText,
          };
        }
      },
    ).catchError((err) => {
              "status": FirebaseStatus.internalServerError,
              "message": Lang.serverErrorText,
            });
  }

  static Future<Map<String, dynamic>> getAll({
    required String collectionName,
  }) async {
    return await firebaseFirestore
        .collection(collectionName)
        .orderBy("createdAt", descending: true)
        .get()
        .then<Map<String, dynamic>>(
      (_snapQueriesDoc) {
        if (_snapQueriesDoc.docs.isNotEmpty) {
          return {
            "status": FirebaseStatus.ok,
            "data": _snapQueriesDoc.docs,
          };
        } else {
          return {
            "status": FirebaseStatus.noContent,
            "message": Lang.noContentText
          };
        }
      },
    ).catchError((err) => {
              "status": FirebaseStatus.internalServerError,
              "message": Lang.serverErrorText,
            });
  }
}
