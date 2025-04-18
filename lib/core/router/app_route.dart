import 'package:booke_store/feattures/login/logic/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feattures/login/data/repo/login_repo.dart';
import '../../feattures/login/presentation/login_page.dart';
import '../../feattures/home/presentation/homepage.dart';
import '../../feattures/registration/presentation/registration.dart';
import '../service/Api.dart';
import 'constants_router.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginCubit(LoginRepo(Api())),
                  child: LoginPage(),
                ));
      case register:
        return MaterialPageRoute(builder: (_) => RegistrationPage());
      case homepage:
        return MaterialPageRoute(builder: (_) => Homepage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('Page not found ${settings.name}'),
                  ),
                ));
    }
  }
}
