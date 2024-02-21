import 'package:isar/isar.dart';

import '../../../../constants/lang_const.dart';
import '../../configs/isar_instance.dart';
import '../../utils/statuts_util.dart';

class IsarGetStreamRequest {
  static Stream<Map<String, dynamic>> getOne<Type>({
    required int id,
  }) {
    var _collection = IsarInstance.isarDb!.collection<Type>();
    return _collection.watchObject(id, fireImmediately: true).map((data) {
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

  static Stream<Map<String, dynamic>> getAll<Type>() {
    var _collection = IsarInstance.isarDb!.collection<Type>();
    return _collection.where().watch(fireImmediately: true).map((data) {
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
