import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ScaffoldWithNestedNavigation extends StatelessWidget {
  late AppLocalizations? _appLocalizations;

   ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    _appLocalizations = AppLocalizations.of(context);
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations:  [
          NavigationDestination(label: _appLocalizations?.home??"", icon: Icon(Icons.home)),
          NavigationDestination(
              label: _appLocalizations?.profile??"", icon: Icon(Icons.person_rounded)),
          NavigationDestination(
              label: _appLocalizations?.setting??"", icon: Icon(Icons.settings)),
        ],
        onDestinationSelected: _goBranch,
      ),
    );
  }
}
