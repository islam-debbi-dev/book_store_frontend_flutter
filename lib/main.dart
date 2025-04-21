import 'package:booke_store/core/router/app_route.dart';
import 'package:booke_store/core/router/constants_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Store',
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: login,
    );
  }
}
