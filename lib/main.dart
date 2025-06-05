import 'package:booke_store/core/helpers/extentions.dart';
import 'package:booke_store/core/helpers/shared_pref_helper.dart';
import 'package:booke_store/core/router/app_route.dart';
import 'package:booke_store/core/router/generate_init_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/helpers/constants.dart';
import 'core/helpers/get_user_data.dart';
import 'features/login/data/models/login_res.dart';
import 'core/theme/app_theme.dart';

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
          theme: appTheme,
          debugShowCheckedModeBanner: false,
          title: 'Book Store',
          onGenerateRoute: appRouter.generateRoute,
          // initialRoute: isLoggedInUser ? adminhomepage : login,
          // initialRoute: register,
          // Pass arguments if logged in
          onGenerateInitialRoutes: (initialRouteName) =>
              GenerateInitRoute.generateInitialRoutes(
                  initialRouteName, appRouter),
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
