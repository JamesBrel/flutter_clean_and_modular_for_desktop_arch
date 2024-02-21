import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../../constants/string_const.dart';
import '../database/categories_models/category_model.dart';
import '../database/contact_social_network_models/contact_social_network_model.dart';
import '../database/contacts_models/contact_model.dart';
import '../database/personal_contact_models/personal_contact_model.dart';
import '../database/personal_contact_social_network_models/personal_social_network_model.dart';
import '../database/pin_code_models/pin_code_model.dart';

class IsarConfig {
  /// Note : Dans cette fonction , j'initialise la Base de Donnée Isar pour Android
  static Future<void> isarAndroidInit() async {
    try {
      String pathDir = (await getExternalStorageDirectory())!.path;
      Directory _directory = Directory("$pathDir/$app ${dotenv.env['LABEL']}");
      await _directory.create(recursive: true).then((_directoryCreated) async {
        await Isar.open(
          [
            CategoryModelSchema,
            ContactModelSchema,
            ContactSocialNetworkModelSchema,
            PersonalContactModelSchema,
            PersonalSocialNetworkModelSchema,
            PinCodeModelSchema,
          ],
          directory: _directoryCreated.path,
          name: "${dotenv.env["INSTANCE_NAME"]}",
          inspector: kDebugMode ? true : false,
        );
      });
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  /// Note : Dans cette fonction , j'initialise la Base de Donnée Isar pour Windows
  static Future<void> isarWindowsInit() async {
    try {
      String pathDir = (await getApplicationDocumentsDirectory()).path;
      Directory _directory = Directory("$pathDir/$app ${dotenv.env['LABEL']}");
      _directory.create(recursive: true);

      await Isar.open(
        [],
        directory: _directory.path,
        name: "${dotenv.env["INSTANCE_NAME"]}",
        inspector: kDebugMode ? true : false,
      );
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
