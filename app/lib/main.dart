import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rosa/college_profile.dart';
import 'login.dart';
import 'constants.dart';
import 'homepage.dart';
import 'intakes.dart';

void main() {
  runApp(const MainApp());
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: '/intakes',
      builder: (context, state) => const IntakeForm(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginForm(),
    ),
    GoRoute(
      path: '/testcollege_profile',
      builder: (context, state) => const CollegeProfile(),
    )
  ],
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      theme: appTheme,
    );
  }
}
