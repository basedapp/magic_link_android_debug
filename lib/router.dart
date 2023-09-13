

import 'package:go_router/go_router.dart';
import 'package:its_magic/screens/auth.dart';
import 'package:its_magic/screens/home.dart';
import 'package:its_magic/screens/log_out.dart';
import 'package:its_magic/screens/logged_in.dart';

final router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: '/log_out',
      builder: (context, state) =>  const LogOutScreen(),
    ),
    GoRoute(
      path: '/logged_in',
      builder: (context, state) =>  const LoggedInScreen(),
    ),
    GoRoute(
      path: '/Auth',
      builder: (context, state) =>  const AuthScreen(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);