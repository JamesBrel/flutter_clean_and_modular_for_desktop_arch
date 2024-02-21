import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'src/core/configs/device_config/device_size.dart';
import 'src/core/configs/injectors_config/injector.dart';
import 'src/core/configs/language_config/translations_delegate.dart';
import 'src/core/init.dart';
import 'src/core/router/auto_routes.dart';
import 'src/core/themes/light_theme.dart';
import 'src/modules/hello_world_mod/features/fetch_hello_world/states_holder/hello_world_bloc/hello_world_bloc.dart';
import 'src/shared/constants/string_const.dart';

void main() async {
  await Init.start();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              sl<HelloWorldBloc>()..add(ReceiveHelloWorldFromSystemEvent()),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final _autoRoutes = AutoRoutes();
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: DeviceSize.fetchScreenSize(context),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp.router(
        routerConfig: _autoRoutes.config(),
        debugShowCheckedModeBanner: kDebugMode,
        title: app,
        theme: LightTheme.light,
        localizationsDelegates: const [
          TranslationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("fr", 'FR'),
          Locale("en", "US"),
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale!.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
      ),
    );
  }
}
