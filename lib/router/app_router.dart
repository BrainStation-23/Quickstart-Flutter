import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qs_flutter/features/auth/presentation/pages/landing_page.dart';

import '../core/values/app_routes.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

class AppRouter {
  final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/',
        name: AppRoutes.root,
        redirect: (context, state) => state.namedLocation(AppRoutes.signIn),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return ScaffoldWithNavBar(child: child);
        },
        routes: <RouteBase>[
          GoRoute(
            path: '/home',
            name: AppRoutes.home,
            pageBuilder: (context, state) => MaterialPage(
              child: const PlaceHolderPage(
                text: "Home",
                title: "Home",
                navigateTo: AppRoutes.homeAbout,
              ),
              key: state.pageKey,
            ),
            routes: [
              GoRoute(
                path: 'about',
                name: AppRoutes.homeAbout,
                pageBuilder: (context, state) => MaterialPage(
                  child: const PlaceHolderPage(
                    text: "Welcome to about screen",
                    title: "About",
                    navigateTo: AppRoutes.homeAboutDeep,
                  ),
                  key: state.pageKey,
                ),
                routes: [
                  GoRoute(
                    path: 'deep',
                    name: AppRoutes.homeAboutDeep,
                    pageBuilder: (context, state) => MaterialPage(
                      child: const PlaceHolderPage(
                        text: "Welcome to about -> deep screen",
                        title: "About -> Deep",
                      ),
                      key: state.pageKey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: '/dash',
            name: AppRoutes.dashTab,
            pageBuilder: (context, state) => MaterialPage(
              child: const PlaceHolderPage(
                title: "Dash",
                text: "Dash",
              ),
              key: state.pageKey,
            ),
          ),
          GoRoute(
            path: '/profile',
            name: AppRoutes.profileTab,
            pageBuilder: (context, state) => MaterialPage(
              child: const PlaceHolderPage(
                title: "Profile",
                text: "Profile",
                navigateTo: AppRoutes.signIn,
              ),
              key: state.pageKey,
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/landing',
        name: AppRoutes.landing,
        pageBuilder: (context, state) => MaterialPage(
          child: const LandingPage(),
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: '/login',
        name: AppRoutes.signIn,
        pageBuilder: (context, state) => MaterialPage(
          child: const PlaceHolderPage(
            title: "SignIn",
            text: "SignIn",
            navigateTo: AppRoutes.signUp,
          ),
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: '/signup',
        name: AppRoutes.signUp,
        pageBuilder: (context, state) => MaterialPage(
          child: const PlaceHolderPage(
            title: "SignUp",
            text: "SignUp",
            navigateTo: AppRoutes.signIn,
          ),
          key: state.pageKey,
        ),
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: PlaceHolderPage(
        title: "Error",
        text: state.error?.message ?? "Something Went Wrong!",
        navigateTo: AppRoutes.home,
      ),
    ),
    redirect: (BuildContext context, GoRouterState state) {
      // final loginLocation = state.namedLocation(AppRoutes.signIn);
      // final loggingIn = state.matchedLocation == loginLocation;
      // final signupLocation = state.namedLocation(AppRoutes.signUp);
      // final registeringAccount = state.matchedLocation == signupLocation;
      // final loggedIn = true; // TODO: Have to keep strac of Auth State
      // final homelocation = state.namedLocation(AppRoutes.home);
      // final landingLocation = state.namedLocation(AppRoutes.landing);
      // final inLandingScreen = state.matchedLocation == landingLocation;

      // if (!loggedIn && !loggingIn && !registeringAccount && !inLandingScreen) {
      //   return landingLocation;
      // }
      // if (loggedIn && (loggingIn || registeringAccount)) {
      //   return homelocation;
      // }

      return null;
    },
  );
}

class ScaffoldWithNavBar extends StatelessWidget {
  /// Constructs an [ScaffoldWithNavBar].
  const ScaffoldWithNavBar({
    required this.child,
    super.key,
  });

  /// The widget to display in the body of the Scaffold.
  /// In this sample, it is a Navigator.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flutter_dash_rounded),
            label: 'Dash',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx, context),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Home'),
              onTap: () {
                GoRouter.of(context).goNamed(AppRoutes.home);
                Navigator.pop(context); // Close the drawer after navigation
              },
            ),
            ListTile(
              title: const Text('Dash'),
              onTap: () {
                GoRouter.of(context).goNamed(AppRoutes.dashTab);
                Navigator.pop(context); // Close the drawer after navigation
              },
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                GoRouter.of(context).goNamed(AppRoutes.profileTab);
                Navigator.pop(context); // Close the drawer after navigation
              },
            ),
          ],
        ),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/home')) {
      return 0;
    }
    if (location.startsWith('/dash')) {
      return 1;
    }
    if (location.startsWith('/profile')) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/home');
        break;
      case 1:
        GoRouter.of(context).go('/dash');
        break;
      case 2:
        GoRouter.of(context).go('/profile');
        break;
    }
  }
}

class PlaceHolderPage extends StatelessWidget {
  final String title;
  final String text;
  final String? navigateTo;
  const PlaceHolderPage(
      {super.key, required this.title, required this.text, this.navigateTo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.goNamed(AppRoutes.home);
              },
              child: const Text('Go Back to Home'),
            ),
            if (navigateTo != null)
              ElevatedButton(
                onPressed: () {
                  context.goNamed(navigateTo!);
                },
                child: Text('Navigate to ${navigateTo ?? "..."}'),
              ),
          ],
        ),
      ),
    );
  }
}
