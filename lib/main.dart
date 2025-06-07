import 'package:booke_store/core/helpers/extentions.dart';
import 'package:booke_store/core/helpers/shared_pref_helper.dart';
import 'package:booke_store/core/router/app_route.dart';
import 'package:flutter/material.dart';
import 'book_store.dart';
import 'core/helpers/constants.dart';
import 'core/helpers/get_user_data.dart';
import 'features/login/data/models/login_res.dart';

import 'features/settings/logic/theme_cubit.dart';

bool isLoggedInUser = false;

LoginRes? loggedInUser;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await checkIfLoggedInUser();
  final ThemeMode savedThemeMode = await ThemeCubit.getSavedThemeMode();
  runApp(BookStore(appRouter: AppRouter(), initialThemeMode: savedThemeMode));
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
