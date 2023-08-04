import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:qs_flutter/core/routes/routes.dart';
import 'package:qs_flutter/core/values/app_values.dart';

import '../../../../core/base/widgets/AppTextField.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late AppLocalizations? _appLocalizations;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    _dateController.text = "Day-Month-Year";
    super.initState();
  }

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
              SizedBox(
                height: 50,
                child: OutlinedButton(
                  onPressed: () async {
                    await _selectDate(context);
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.cake_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          _dateController.text,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.outline),
                        ),
                      ],
                    ),
                  ),
                ),
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dateController.text == "Day-Month-Year"
          ? _selectedDate
          : DateFormat('MM/dd/yyyy').parse(_dateController.text),
      initialDatePickerMode: DatePickerMode.year,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      confirmText: "Select",
      cancelText: "Cancel",
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: Colors.green),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.green.shade800, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('MM/dd/yyyy').format(picked);
      });
    }
  }
}
