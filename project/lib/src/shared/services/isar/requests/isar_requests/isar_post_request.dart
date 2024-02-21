import 'package:isar/isar.dart';

import '../../configs/isar_instance.dart';
import '../../utils/statuts_util.dart';

class IsarPostRequest {
  static Future<Map<String, dynamic>> post<Type>({
    required Type data,
  }) async {
    var _collection = IsarInstance.isarDb!.collection<Type>();
    return await _collection.put(data).then((_) => {
          "status": IsarStatus.created,
          "data": data,
        });
  }
}
