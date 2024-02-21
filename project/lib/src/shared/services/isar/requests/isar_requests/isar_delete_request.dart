import 'package:isar/isar.dart';

import '../../configs/isar_instance.dart';
import '../../utils/statuts_util.dart';

class IsarDeleteRequest {
  static Future<Map<String, dynamic>> deleteOne<Type>({
    required int id,
  }) async {
    var _collection = IsarInstance.isarDb!.collection<Type>();
    return await _collection.delete(id).then((dataId) => {
          "status": IsarStatus.ok,
        });
  }

  static Future<Map<String, dynamic>> deleteAll<Type>({
    required List<int> ids,
  }) async {
    var _collection = IsarInstance.isarDb!.collection<Type>();
    return await _collection.deleteAll(ids).then((dataIds) => {
          "status": IsarStatus.ok,
        });
  }
}
