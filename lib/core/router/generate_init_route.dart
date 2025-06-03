import 'package:flutter/material.dart';

import '../../main.dart';
import 'app_route.dart';
import 'constants_router.dart';

class GenerateInitRoute {
  static List<Route<dynamic>> generateInitialRoutes(
      String initialRouteName, AppRouter appRouter) {
    if (isLoggedInUser && loggedInUser != null) {
      return [
        loggedInUser!.isAdmin == true
            ? appRouter.generateRoute(
                RouteSettings(name: adminhomepage, arguments: loggedInUser),
              )
            : appRouter.generateRoute(
                RouteSettings(name: homepage, arguments: loggedInUser),
              )
      ];
    } else {
      return [
        appRouter.generateRoute(
          RouteSettings(name: login),
        ),
      ];
    }
  }
}
