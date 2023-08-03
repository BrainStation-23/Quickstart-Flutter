import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qs_flutter/core/routes/navbar.dart';
import 'package:qs_flutter/core/routes/routes.dart';
import 'package:qs_flutter/features/home/presentation/pages/home.dart';
import 'package:qs_flutter/features/landing/presentation/pages/landing.dart';
import 'package:qs_flutter/features/profile/presentation/pages/profile.dart';
import 'package:qs_flutter/features/sign_in/presentation/pages/sign_in.dart';
import 'package:qs_flutter/features/sign_up/presentation/pages/sign_up.dart';

const isLoggedIn = false;

class RouteGenerator {
  static final GoRouter router = GoRouter(
    errorBuilder: (context, state) {
      return const Center(
        child: Scaffold(body: Center(child: Text(""))),
      );
    },
    routes: [
      GoRoute(
        path: '/',
        redirect: (context, state) {
          return "/${Routes.landing}";
        },
      ),
      GoRoute(
        name: Routes.landing,
        path: "/${Routes.landing}",
        builder: (context, state) => Landing(),
        routes: [
          GoRoute(
            name: Routes.signIn,
            path: Routes.signIn,
            builder: (context, state) => SignIn(),
          ),
          GoRoute(
            name: Routes.signUp,
            path: Routes.signUp,
            builder: (context, state) => SignUp(),
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: Routes.home,
                path: "/${Routes.home}",
                builder: (context, state) => const Home(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: Routes.profile,
                path: "/${Routes.profile}",
                builder: (context, state) => const Profile(),
              ),
            ],
          ),
        ],
      )
    ],
  );
}
