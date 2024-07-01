import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:styles/src/theme/bloc/theme_bloc.dart';
import 'package:styles/src/theme/bloc/theme_state.dart';
import 'package:styles/src/theme/theme_base.dart';

class ThemeScope extends StatefulWidget {
  const ThemeScope({super.key, required this.themeCubit, required this.child});
  final ThemeCubit themeCubit;
  final Widget child;

  static ThemeBase of(BuildContext context) =>
      InheritedModel.inheritFrom<_InheritedThemeScope>(context)?.themeBase ??
      (throw ArgumentError(
        'Out of scope, not found inherited model '
            'a $_InheritedThemeScope of the exact type',
        'out_of_scope',
      ));
  @override
  State<ThemeScope> createState() => _ThemeScopeState();
}

class _ThemeScopeState extends State<ThemeScope> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      bloc: widget.themeCubit,
      builder: (context, state) => _InheritedThemeScope(
        themeBase: state.themeBase,
        state: state,
        child: widget.child,
      ),
    );
  }
}

class _InheritedThemeScope extends InheritedModel<ThemeBase> {
  final ThemeBase themeBase;
  final ThemeState state;
  const _InheritedThemeScope(
      {required this.themeBase, required this.state, required super.child});

  @override
  bool updateShouldNotify(_InheritedThemeScope oldWidget) {
    return state != oldWidget.state;
  }

  @override
  bool updateShouldNotifyDependent(
      covariant _InheritedThemeScope oldWidget, Set<ThemeBase> dependencies) {
    return state.themeBase.themeData != oldWidget.state.themeBase.themeData;
  }
}
