import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:styles/src/theme/bloc/theme_bloc.dart';
import 'package:styles/src/theme/bloc/theme_state.dart';
import 'package:styles/src/theme/theme_generator/theme_generator_base.dart';

class ThemeScope extends StatefulWidget {
  const ThemeScope({super.key, required this.themeCubit, required this.child});
  final ThemeCubit themeCubit;
  final Widget child;

  static T of<T extends ThemeGeneratorBase>(BuildContext context) =>
      InheritedModel.inheritFrom<_InheritedThemeScope<T>>(context)
          ?.themeGenerator ??
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
        themeGenerator: state.themeGenerator,
        state: state,
        child: widget.child,
      ),
    );
  }
}

class _InheritedThemeScope<T extends ThemeGeneratorBase>
    extends InheritedModel<ThemeGeneratorBase> {
  final T themeGenerator;
  final ThemeState state;
  const _InheritedThemeScope(
      {required this.themeGenerator,
      required this.state,
      required super.child});

  @override
  bool updateShouldNotify(_InheritedThemeScope oldWidget) {
    return state != oldWidget.state;
  }

  @override
  bool updateShouldNotifyDependent(covariant _InheritedThemeScope oldWidget,
      Set<ThemeGeneratorBase> dependencies) {
    return state.themeGenerator != oldWidget.state.themeGenerator;
  }
}
