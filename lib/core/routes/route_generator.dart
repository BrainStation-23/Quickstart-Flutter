import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qs_flutter/core/routes/config.dart';
import 'package:qs_flutter/core/routes/navbar.dart';
import 'package:qs_flutter/core/routes/routes.dart';
import 'package:qs_flutter/features/home/presentation/pages/home.dart';
import 'package:qs_flutter/features/landing/presentation/pages/landing.dart';
import 'package:qs_flutter/features/profile/presentation/pages/profile.dart';
import 'package:qs_flutter/features/sign_in/presentation/pages/sign_in.dart';
import 'package:qs_flutter/features/sign_up/presentation/pages/sign_up.dart';

class RouteGenerator {
  static final GoRouter router = GoRouter(
    navigatorKey: rootRouterKey,
    initialLocation: "/",
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        redirect: (context, state) {
          return "/${Routes.landing}";
        },
      ),
      GoRoute(
        name: Routes.landing,
        path: "/${Routes.landing}",
        pageBuilder: (context, state) {
          return MaterialPage(child: Landing());
        },
        routes: <RouteBase>[
          GoRoute(
            name: Routes.signIn,
            path: Routes.signIn,
            pageBuilder: (context, state) {
              var email = state.uri.queryParameters['email'] ?? '';
              var password = state.uri.queryParameters['password'] ?? '';

              return MaterialPage(
                  child: SignIn(
                email: email,
                password: password,
              ));
            },
          ),
          GoRoute(
            name: Routes.signUp,
            path: Routes.signUp,
            pageBuilder: (context, state) {
              return MaterialPage(child: SignUp());
            },
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: shellNavigatorHomeKey,
            routes: <RouteBase>[
              GoRoute(
                name: Routes.home,
                path: "/${Routes.home}",
                pageBuilder: (context, state) {
                  return const MaterialPage(child: Home());
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: shellNavigatorProfileKey,
            routes: <RouteBase>[
              GoRoute(
                name: Routes.profile,
                path: "/${Routes.profile}",
                pageBuilder: (context, state) {
                  return const MaterialPage(child: Profile());
                },
              ),
            ],
          ),
        ],
      )
    ],
  );
}
