import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rosa/pages/college_profiles/college_profile.dart';
import 'package:rosa/pages/college_profiles/uBuffProfile.dart';
import 'package:rosa/pages/college_profiles/wesProfile.dart';
import 'pages/college_profiles/hunterProfile.dart';
import 'pages/login.dart';
import 'constants/constants.dart';
import 'pages/home/home.dart';
import 'pages/intakes.dart';
import 'pages/match.dart';
import 'package:confetti/confetti.dart';

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
    ),
    GoRoute(
      path: '/MatchPage1State',
      builder: (context, state) => const MatchPage1(),
    ),
    GoRoute(
      path: '/UB_profile',
      builder: (context, state) => const CollegeProfileUB(),
    ),
    GoRoute(
      path: '/WES_profile',
      builder: (context, state) => const CollegeProfileWES(),
    ),
    GoRoute(
      path: '/H_profile',
      builder: (context, state) => const CollegeProfileH(),
    ),
  ],
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      theme: appTheme,
    );
  }
}