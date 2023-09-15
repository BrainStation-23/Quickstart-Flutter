import 'package:flutter/material.dart';

import '../../values/app_assets_path.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return   Image.asset(
        AppAssets.appLogo,
        height: 120.0,
        width: 120.0,
      );

  }
}
