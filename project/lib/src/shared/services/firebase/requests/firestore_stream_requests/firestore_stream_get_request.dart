import '../../../../constants/lang_const.dart';
import '../../configs/firebase_instance.dart';
import '../../utils/status_util.dart';

class FirestoreStreamGetRequest {
  static Stream<Map<String, dynamic>> getOne({
    required String collectionName,
    required Map<String, dynamic> data,
  }) {
    return firebaseFirestore
        .collection(collectionName)
        .doc(data["id"])
        .snapshots()
        .map((_snapShotStream) {
      if (_snapShotStream.exists) {
        return {
          "status": FirebaseStatus.ok,
          "data": _snapShotStream.data(),
        };
      } else {
        return {
          "status": FirebaseStatus.noContent,
          "message": Lang.noContentText,
        };
      }
    });
  }

  static Stream<Map<String, dynamic>> getAll({
    required String collectionName,
  }) {
    return firebaseFirestore
        .collection(collectionName)
        .snapshots()
        .map((_snapShotsStream) {
      if (_snapShotsStream.docs.isNotEmpty) {
        return {
          "status": FirebaseStatus.ok,
          "data": _snapShotsStream.docs,
        };
      } else {
        return {
          "status": FirebaseStatus.noContent,
          "message": Lang.noContentText,
        };
      }
    });
  }
}
