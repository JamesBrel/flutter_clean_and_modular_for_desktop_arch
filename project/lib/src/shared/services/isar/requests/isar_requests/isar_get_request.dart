import 'package:isar/isar.dart';

import '../../../../constants/lang_const.dart';
import '../../configs/isar_instance.dart';
import '../../utils/statuts_util.dart';

class IsarGetRequest {
  static Future<Map<String, dynamic>> getOne<Type>({
    required int id,
  }) async {
    var _collection = IsarInstance.isarDb!.collection<Type>();
    return await _collection.get(id).then((data) {
      if (data != null) {
        return {
          "status": IsarStatus.ok,
          "data": data,
        };
      } else {
        return {
          "status": IsarStatus.noContent,
          "message": Lang.noContentText,
        };
      }
    });
  }

  static Future<Map<String, dynamic>> getAll<Type>() async {
    var _collection = IsarInstance.isarDb!.collection<Type>();
    return await _collection.where().findAll().then((data) {
      if (data.isNotEmpty) {
        return {
          "status": IsarStatus.ok,
          "data": data,
        };
      } else {
        return {
          "status": IsarStatus.noContent,
          "message": Lang.noContentText,
        };
      }
    });
  }
}
