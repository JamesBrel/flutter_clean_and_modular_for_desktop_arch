import '../../../../constants/lang_const.dart';
import '../../configs/firebase_instance.dart';
import '../../utils/status_util.dart';

class FirebaseStorageGetRequest {
  static Future<Map<String, dynamic>> getUrlImage({
    required String fileName,
    required String folderRef,
  }) async {
    return await firebaseStorage
        .ref(folderRef)
        .child(fileName)
        .getDownloadURL()
        .then(
          (imageUrl) => {
            "status": FirebaseStatus.ok,
            "data": imageUrl,
          },
        )
        .catchError((err) => {
              "status": FirebaseStatus.internalServerError,
              "message": Lang.serverErrorText,
            });
  }
}
