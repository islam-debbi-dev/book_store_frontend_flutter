import 'package:booke_store/core/helpers/extentions.dart';
import 'package:booke_store/core/helpers/shared_pref_helper.dart';
import 'package:booke_store/core/router/app_route.dart';
import 'package:booke_store/core/router/constants_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/helpers/constants.dart';
import 'core/helpers/get_user_data.dart';
import 'feattures/login/data/models/login_res.dart';

bool isLoggedInUser = false;

LoginRes? loggedInUser;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await checkIfLoggedInUser();
  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Book Store',
          onGenerateRoute: appRouter.generateRoute,
          initialRoute: isLoggedInUser ? adminhomepage : login,
          // Pass arguments if logged in
          onGenerateInitialRoutes: (initialRouteName) =>
              generateInitialRoutes(initialRouteName, appRouter),
        );
      },
    );
  }
}

Future<void> checkIfLoggedInUser() async {
  // check if user is logged in
  String? userToken =
      await SharedPrefHelper.getString(SharedPrefKeys.userToken);
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
    print("User is logged in  $userToken");
    GetUserData getUserData = GetUserData();
    loggedInUser = await getUserData.getUserDataFromStorage();
  } else {
    print('User is not logged in');
    isLoggedInUser = false;
    loggedInUser = null;
  }
}

List<Route<dynamic>> generateInitialRoutes(
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
