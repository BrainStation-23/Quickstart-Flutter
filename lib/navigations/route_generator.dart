import 'package:go_router/go_router.dart';

import '../presentation/landing/landing.dart';
import 'error_screen.dart';

class RouteGenerator {
  static final GoRouter router = GoRouter(
    errorBuilder: (context, state) {
      return const ErrorPage();
    },
    routes: [
      GoRoute(
        path: '/',
        redirect: (context, state) {
          return "/${LandingPage.path}";
        },
      ),
      GoRoute(
        name: LandingPage.path,
        path: "/${LandingPage.path}",
        builder: (context, state) => const LandingPage(),
      ),
    ],
  );
}
