import 'package:auto_route/auto_route.dart';

import '../../modules/hello_world_mod/ui/screens/welcome_screen.dart';
import '../../shared/constants/routes_const.dart';

part "auto_routes.gr.dart";

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class AutoRoutes extends _$AutoRoutes {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: RoutePath.welcomePath,
          page: WelcomeRoute.page,
          initial: true,
        ),
      ];
}
