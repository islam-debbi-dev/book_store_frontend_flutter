
import 'package:flutter/material.dart';

import '../../feattures/login/presentation/login_page.dart';
import '../../feattures/home/presentation/homepage.dart';
import '../../feattures/registration/presentation/registration.dart';
import 'constants_router.dart';

class AppRouter {
  
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case register:
        return MaterialPageRoute(builder: (_) => RegistrationPage());
      case homepage:
        return MaterialPageRoute(builder: (_) => Homepage());
      default:
        return  MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('Page not found ${settings.name}'),
                  ),
                ));


    }
  }
}

 
