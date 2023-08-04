import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:qs_flutter/core/routes/routes.dart';
import 'package:qs_flutter/core/values/app_values.dart';

import '../../../../core/base/widgets/AppTextField.dart';

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
              AppTextField(
                controller: _usernameController,
                labelText: "User Name",
                onChanged: (value) {},
              ),
              const SizedBox(
                height: AppValues.height_16,
              ),
              AppTextField(
                controller: _emailController,
                labelText: "Email",
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 10,
              ),
              AppTextField(
                  controller: _passwordController,
                  labelText: "Password",
                  onChanged: (value) {},
                  obscureText: true),
              const SizedBox(
                height: 10,
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
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      context.goNamed("${Routes.signIn}");
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text("login"),
                    ),
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
