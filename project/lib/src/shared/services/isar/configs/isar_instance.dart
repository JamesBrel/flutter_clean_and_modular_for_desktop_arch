import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:isar/isar.dart';

class IsarInstance {
  static var isarDb = Isar.getInstance("${dotenv.env["INSTANCE_NAME"]}");
}
