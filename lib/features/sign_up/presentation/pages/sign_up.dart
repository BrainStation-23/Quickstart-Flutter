import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qs_flutter/core/routes/routes.dart';
import 'package:qs_flutter/core/values/app_values.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUp extends StatelessWidget {
  late AppLocalizations? _appLocalizations;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    _appLocalizations = AppLocalizations.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppValues.padding),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                    labelText: _appLocalizations?.usernameLabel ?? ""),
              ),
              const SizedBox(
                height: AppValues.height_16,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                    labelText: _appLocalizations?.emailLabel ?? ""),
              ),
              const SizedBox(
                height: AppValues.height_16,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                    labelText: _appLocalizations?.passwordLabel ?? ""),
                obscureText: true,
              ),
              const SizedBox(
                height: AppValues.height_16,
              ),
              ElevatedButton(
                onPressed: () {
                  context.goNamed(Routes.signIn, queryParameters: {
                    "email": _emailController.text,
                    "password": _passwordController.text,
                  });
                },
                child: Text(_appLocalizations?.submit ?? ""),
              ),
              const SizedBox(
                height: AppValues.height_16,
              ),
              Row(
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      context.goNamed(Routes.signIn);
                    },
                    child: const Text("login"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
