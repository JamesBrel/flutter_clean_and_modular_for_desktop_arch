import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:window_manager/window_manager.dart';

import '../../constants/double_const.dart';
import '../../constants/string_const.dart';

class WindowConfig {
  static void windows() {
    WindowManager.instance.setTitle("$app ${dotenv.env['LABEL']}");
    WindowManager.instance.setSize(const Size(windowWidth, windowHeight));
    WindowManager.instance.setResizable(false);
    WindowManager.instance.center(animate: true);
  }
}
