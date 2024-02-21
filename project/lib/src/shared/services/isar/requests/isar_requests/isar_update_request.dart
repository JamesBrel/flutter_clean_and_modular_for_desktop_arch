import 'package:isar/isar.dart';

import '../../configs/isar_instance.dart';
import '../../utils/statuts_util.dart';

class IsarUpdateRequest {
  static Future<Map<String, dynamic>> updateOne<Type>({
    required Type data,
  }) async {
    var _collection = IsarInstance.isarDb!.collection<Type>();
    return await _collection.put(data).then((dataId) => {
          "status": IsarStatus.ok,
        });
  }
}
