import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../lib_test/src/core/configs/windows_config/window_config.dart';
import '../shared/constants/envs_const.dart';
import '../shared/constants/int_const.dart';
import 'configs/env_config/env_checker.dart';
import 'configs/injectors_config/injector.dart';
// import '../shared/constants/svgs_const.dart' as icon;

class Init {
  static Future<void> start() async {
    //! WidgetFlutter and DeviceType Initialization
    // active these lines down
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) async {
      Element? context = WidgetsFlutterBinding.ensureInitialized().rootElement;

      //! Prelod All the svg
      final svgs = [];
      final imagesSvg = svgs.map((svgElement) => SvgAssetLoader(svgElement));
      imagesSvg.map((imageSvg) async => await svg.cache.putIfAbsent(
          imageSvg.cacheKey(context), () => imageSvg.loadBytes(context)));

      //! Prelod All the png
      final pngs = [];
      final imagesPng = pngs.map((pngElement) =>
          precacheImage(Image.asset(pngElement).image, context!));
      await Future.wait(imagesPng);

      //! Prelod All the jpg
      final jpgs = [];
      final imagesJpg = jpgs.map((jpgElement) =>
          precacheImage(Image.asset(jpgElement).image, context!));
      await Future.wait(imagesJpg);

      //! splash screen remover
      await Future.delayed(const Duration(seconds: splashDuration))
          .then((_) => {
                FlutterNativeSplash.remove(),
              });

      //! screen config
      WindowConfig.windows();
    });

    //! services config init
    // await FirebaseConfig.init(
    //   env: EnvPath.env,
    // );

    // HttpOverrides.global = new HttpOverridesHelper();

    //! initialisation of service locator
    await initSl();
  }
}
