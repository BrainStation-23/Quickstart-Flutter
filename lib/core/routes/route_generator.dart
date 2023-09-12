import 'package:go_router/go_router.dart';
import 'package:qs_flutter/core/routes/error_screen.dart';
import 'package:qs_flutter/core/routes/navbar.dart';
import 'package:qs_flutter/core/routes/routes.dart';
import 'package:qs_flutter/features/home/presentation/pages/home_screen.dart';
import 'package:qs_flutter/features/introduction/presentation/pages/introduction_screen.dart';
import 'package:qs_flutter/features/landing/presentation/pages/landing_screen.dart';
import 'package:qs_flutter/features/settings/presentation/pages/settings_screen.dart';
import 'package:qs_flutter/features/sign_in/presentation/pages/sign_in_screen.dart';
import 'package:qs_flutter/features/sign_up/presentation/pages/sign_up_screen.dart';

import '../../features/sign_up/presentation/widgets/otp_verificaticion_widget.dart';

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
          path: "/${Routes.signIn}",
          builder: (context, state) => const SignInScreen(),
          routes: [
            GoRoute(
              name: Routes.signUp,
              path: Routes.signUp,
              builder: (context, state) => const SignUpScreen(),
            ),
            GoRoute(
              name: Routes.verifyOtp,
              path: Routes.verifyOtp,
              builder: (context, state) => const OTPVerificationView(),
            ),
            GoRoute(
              name: Routes.introduction,
              path: Routes.introduction,
              builder: (context, state) => const Introduction(),
            ),
          ]),
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
                builder: (context, state) => const Introduction(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: Routes.settings,
                path: "/${Routes.settings}",
                builder: (context, state) => SettingsScreen(),
              ),
            ],
          ),
        ],
      )
    ],
  );
}
