import 'package:flutter_native_image/flutter_native_image.dart';

import '../../../constants/lang_const.dart';

class ImageCompressRequest {
  static Future<Map<String, dynamic>> compressTheImage({
    required String mediaImage,
  }) async {
    return await FlutterNativeImage.compressImage(
      mediaImage,
      quality: 80,
      percentage: 80,
    )
        .then(
          (imageCompressed) => {
            "status": true,
            "data": imageCompressed.path,
          },
        )
        .catchError((err) => {
              "status": false,
              "message": Lang.deviceErrorText,
            });
  }
}
