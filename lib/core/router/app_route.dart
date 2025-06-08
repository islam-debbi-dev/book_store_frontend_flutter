import 'package:booke_store/features/admin/adminhome/data/repo/home_repo.dart';
import 'package:booke_store/features/admin/adminhome/logic/admin_home_cubit.dart';
import 'package:booke_store/features/login/logic/login_cubit.dart';
import 'package:booke_store/features/login/presentation/login_screen.dart';
import 'package:booke_store/features/registration/logic/registration_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/admin/adminhome/presentation/admin_home_page.dart';
import '../../features/edit_profile/data/repository/profile_repository.dart';
import '../../features/edit_profile/logic/cubit/profile_cubit.dart';
import '../../features/edit_profile/presentation/edit_profile.dart';
import '../../features/login/data/models/login_res.dart';
import '../../features/login/data/repo/login_repo.dart';
import '../../features/user/home/presentation/homepage.dart';
import '../service/Api.dart';
import 'constants_router.dart';
import '../../features/settings/presentation/settings.dart';
import '../../features/registration/data/repo/registration_repo.dart';
import '../../features/registration/presentation/registration.dart';
import '../../features/admin/adminhome/presentation/widgets/authors_widgets/details_author.dart';

import '../../features/admin/adminhome/data/models/author.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case settingsPage:
        return MaterialPageRoute(
          builder: (_) => const SettingsPage(),
        );
      case login:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginCubit(LoginRepo(Api())),
                  child: LoginScreen(),
                ));

      case register:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) =>
                      RegistrationCubit(RegistrationRepo(Api())),
                  child: RegistrationPage(),
                ));
      case adminhomepage:
        if (arguments is LoginRes) {
          return MaterialPageRoute(
              builder: (_) => BlocProvider(
                    create: (context) => AdminHomeCubit(HomeRepo(Api())),
                    child: AdminHomepage(arguments),
                  ));
        } else {
          return MaterialPageRoute(
              builder: (_) => Scaffold(
                    body: Center(
                      child: Text('Invalid arguments for AdminHomepage route'),
                    ),
                  ));
        }
      case detailsScreen:
        final argument = settings.arguments as Author;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => ProfileCubit(ProfileRepository(Api())),
                  child: DetailsAuthor(author: argument),
                ));

      case editProfile:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => ProfileCubit(ProfileRepository(Api())),
                  child: EditProfile(),
                ));
      case homepage:
        if (arguments is LoginRes) {
          return MaterialPageRoute(builder: (_) => Homepage(arguments));
        } else {
          return MaterialPageRoute(
              builder: (_) => Scaffold(
                    body: Center(
                      child: Text('Invalid arguments for Homepage route'),
                    ),
                  ));
        }

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Page not found ${settings.name}'),
            ),
          ),
        );
    }
  }
}
