import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/router/app_route.dart';
import 'core/router/generate_init_route.dart';
import 'core/theme/app_theme_dark.dart';
import 'core/theme/app_theme_light.dart';
import 'features/settings/logic/theme_cubit.dart';

class BookStore extends StatelessWidget {
  final AppRouter appRouter;
  final ThemeMode initialThemeMode;
  const BookStore(
      {super.key, required this.appRouter, required this.initialThemeMode});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(initialThemeMode),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) {
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                theme: appThemeLight,
                darkTheme: appThemeDark,
                themeMode: state.themeMode,
                debugShowCheckedModeBanner: false,
                title: 'Book Store',
                onGenerateRoute: appRouter.generateRoute,
                onGenerateInitialRoutes: (initialRouteName) =>
                    GenerateInitRoute.generateInitialRoutes(
                        initialRouteName, appRouter),
              );
            },
          );
        },
      ),
    );
  }
}
