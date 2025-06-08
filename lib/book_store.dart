import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/localization/app_localizations.dart';
import 'core/localization/cubit/locale_cubit.dart';
import 'core/router/app_route.dart';
import 'core/router/generate_init_route.dart';
import 'core/theme/app_theme_dark.dart';
import 'core/theme/app_theme_light.dart';
import 'features/settings/logic/theme_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class BookStore extends StatelessWidget {
  final AppRouter appRouter;
  final ThemeMode initialThemeMode;
  final Locale initialLocale;
  const BookStore(
      {super.key,
      required this.appRouter,
      required this.initialThemeMode,
      required this.initialLocale});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit(initialThemeMode)),
        BlocProvider(create: (_) => LocaleCubit(initialLocale)),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) {
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return BlocBuilder<LocaleCubit, LocaleState>(
                  builder: (context, localeState) {
                return MaterialApp(
                  theme: appThemeLight,
                  locale: localeState.locale,
                  supportedLocales: const [
                    Locale('en'), // LTR
                    Locale('ar'), // RTL
                  ],
                  localizationsDelegates: const [
                    AppLocalizationsDelegate(),
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  darkTheme: appThemeDark,
                  themeMode: state.themeMode,
                  debugShowCheckedModeBanner: false,
                  title: 'Book Store',
                  onGenerateRoute: appRouter.generateRoute,
                  onGenerateInitialRoutes: (initialRouteName) =>
                      GenerateInitRoute.generateInitialRoutes(
                          initialRouteName, appRouter),
                );
              });
            },
          );
        },
      ),
    );
  }
}
