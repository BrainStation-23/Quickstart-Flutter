import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qs_flutter/core/routes/routes.dart';
import 'package:qs_flutter/core/validators/input_validators.dart';
import 'package:qs_flutter/core/values/app_values.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignIn extends StatelessWidget {
  late AppLocalizations? _appLocalizations;
  late String? email;
  late String? password;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  SignIn({super.key, this.email, this.password});

  @override
  Widget build(BuildContext context) {
    _appLocalizations = AppLocalizations.of(context);

    if (email != '' && password != '') {
      _emailController.text = email ?? "";
      _passwordController.text = password ?? "";
    }

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
                    context.goNamed(Routes.home);
                  },
                  child: Text(_appLocalizations?.submit ?? ""))
            ],
          ),
        ),
      ),
    );
  }
}
