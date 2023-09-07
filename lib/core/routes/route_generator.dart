import 'package:go_router/go_router.dart';
import 'package:qs_flutter/core/routes/error_screen.dart';
import 'package:qs_flutter/core/routes/navbar.dart';
import 'package:qs_flutter/core/routes/routes.dart';
import 'package:qs_flutter/features/home/presentation/pages/home.dart';
import 'package:qs_flutter/features/introduction/presentation/pages/introduction_screen.dart';
import 'package:qs_flutter/features/landing/presentation/pages/landing_screen.dart';
import 'package:qs_flutter/features/profile/presentation/pages/profile.dart';
import 'package:qs_flutter/features/sign_in/presentation/pages/sign_in_screen.dart';
import 'package:qs_flutter/features/sign_up/presentation/pages/sign_up.dart';

class RouteGenerator {
  static final GoRouter router = GoRouter(
    errorBuilder: (context, state) {
      return const ErrorPage();
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
        builder: (context, state) => const LandingScreen(),
      ),
      GoRoute(
        name: Routes.signIn,
        path:"/${Routes.signIn}" ,
        builder: (context, state) => SignIn(),
        routes: [
          GoRoute(
            name: Routes.signUp,
            path: Routes.signUp,
            builder: (context, state) => SignUp(),
          ),
          GoRoute(
            name: Routes.introduction,
            path: Routes.introduction,
            builder: (context, state) => const Introduction(),
          ),
        ]
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
