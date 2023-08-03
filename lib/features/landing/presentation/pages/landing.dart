import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:qs_flutter/core/routes/routes.dart';

class Landing extends StatelessWidget {
  late AppLocalizations? _appLocalizations;

  Landing({super.key});

  @override
  Widget build(BuildContext context) {
    _appLocalizations = AppLocalizations.of(context);
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              _appLocalizations?.welcome ?? "",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.resolveWith(
                  (states) =>
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                ),
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => Theme.of(context).colorScheme.primary),
              ),
              onPressed: () {
                context.goNamed(Routes.signIn);
              },
              child: Text(
                _appLocalizations?.logIn ?? "",
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.resolveWith(
                    (states) => const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 20),
                  ),
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Theme.of(context).colorScheme.secondary)),
              onPressed: () {
                context.goNamed(Routes.signUp);
              },
              child: Text(
                _appLocalizations?.signUp ?? "",
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
