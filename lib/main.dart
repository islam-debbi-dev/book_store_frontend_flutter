import 'package:booke_store/core/helpers/extentions.dart';
import 'package:booke_store/core/helpers/shared_pref_helper.dart';
import 'package:booke_store/core/router/app_route.dart';
import 'package:booke_store/core/router/constants_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/helpers/constants.dart';

bool isLoggedInUser = false;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Adjust to your design's size
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Book Store',
          onGenerateRoute: appRouter.generateRoute,
          initialRoute: isLoggedInUser ? homepage : login,
        );
      },
    );
  }
}

checkIfLoggedInUser() async {
  // check if user is logged in
  String? userToken =
      await SharedPrefHelper.getString(SharedPrefKeys.userToken);
  if (!userToken!.isNullOrEmpty()) {
    isLoggedInUser = true;
    print("User is logged in  ${userToken}");
  } else {
    print('User is not logged in');
    isLoggedInUser = false;
  }
}
