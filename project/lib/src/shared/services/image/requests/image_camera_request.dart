import 'package:image_picker/image_picker.dart';

import '../../../constants/lang_const.dart';
import '../configs/image_instance.dart';

class ImageCameraRequest {
  static Future<Map<String, dynamic>> cameraImage() async {
    return await imagePicker
        .pickImage(source: ImageSource.camera)
        .then<Map<String, dynamic>>(
      (media) {
        if (media != null) {
          return {
            "status": true,
            "data": media.path,
          };
        } else {
          return {
            "status": false,
            "message": Lang.noImageTaketext,
          };
        }
      },
    ).catchError((err) => {
              "status": false,
              "message": Lang.deviceErrorText,
            });
  }
}
