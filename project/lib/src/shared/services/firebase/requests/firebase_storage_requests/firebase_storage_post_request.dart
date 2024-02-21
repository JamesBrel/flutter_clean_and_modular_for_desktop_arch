import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

import '../../../../constants/lang_const.dart';
import '../../configs/firebase_instance.dart';
import '../../utils/status_util.dart';

class FirebaseStoragePostRequest {
  static Future<Map<String, dynamic>> uploadFile({
    required String folderRef,
    required String fileName,
    required String filePath,
  }) async {
    return await firebaseStorage
        .ref(folderRef)
        .child(fileName)
        .putFile(
            File(filePath),
            SettableMetadata(
              contentType: "image/png",
            ))
        .then<Map<String, dynamic>>(
          (p0) => {
            "status": FirebaseStatus.created,
          },
        )
        .catchError((err) => {
              "status": FirebaseStatus.internalServerError,
              "message": Lang.serverErrorText,
            });
  }
}
