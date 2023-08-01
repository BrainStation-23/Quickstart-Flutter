import 'package:flutter/material.dart';

class AppContext {
  late BuildContext _context;
  bool _lock = false;

  static final AppContext instance = AppContext._internal();

  AppContext._internal();

  factory AppContext.instantiate({
    required BuildContext context,
  }) {
    if (instance._lock) return instance;

    instance._context = context;
    instance._lock = true;

    return instance;
  }

  static BuildContext context = AppContext.instance._context;
}
