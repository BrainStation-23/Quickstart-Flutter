import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:qs_flutter/core/base/widgets/app_primary_button.dart';
import 'package:qs_flutter/core/base/widgets/app_textfield.dart';
import 'package:qs_flutter/core/validators/input_validators.dart';
import 'package:qs_flutter/core/values/app_values.dart';
import 'package:qs_flutter/features/forgot_password/presentation/bloc/forgot_password_bloc.dart';
import 'package:qs_flutter/features/forgot_password/presentation/bloc/forgot_password_event.dart';
import 'package:qs_flutter/features/forgot_password/presentation/bloc/forgot_password_state.dart';

import '../../../../core/base/widgets/app_header.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/utils.dart';

class PasswordRecoveryScreen extends StatefulWidget {
  const PasswordRecoveryScreen({super.key});

  @override
  State<PasswordRecoveryScreen> createState() => _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState extends State<PasswordRecoveryScreen> {
  late AppLocalizations? _appLocalizations;

  final TextEditingController _emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _appLocalizations = AppLocalizations.of(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
            listener: (context, state) {
              if (state.status == ForgotPasswordScreenStatus.success) {
                showSnackBarMessage(
                    context,
                    _appLocalizations?.loginSuccessMessage ?? "",
                    SnackBarMessageType.success);
                context.goNamed(Routes.signIn);
              } else if (state.status == ForgotPasswordScreenStatus.verify) {
                showSnackBarMessage(
                    context,
                    _appLocalizations?.loginSuccessMessage ?? "",
                    SnackBarMessageType.success);
                context.goNamed(Routes.verifyOtp);
              }
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(AppValues.padding),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const AppHeader(),
                      _buildEmailTextField(state),
                      AppPrimaryButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context
                                  .read<ForgotPasswordBloc>()
                                  .add(ResetSubmitEvent());
                            }
                          },
                          title: "Reset Password"),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildEmailTextField(ForgotPasswordState state) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Padding(
        padding: const EdgeInsets.only(
          left: AppValues.margin_2,
        ),
        child: Text(
          _appLocalizations?.fieldTitleEmail ?? "",
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: AppValues.smallMargin),
        child: AppTextField(
          isEnabled: state.status != ForgotPasswordScreenStatus.loading,
          prefix: const Icon(Icons.email_outlined),
          controller: _emailController,
          labelText: _appLocalizations?.fieldLabelTextEmail ?? "",
          validator: InputValidators.email,
          onChanged: (value) {
            context
                .read<ForgotPasswordBloc>()
                .add(ForgotPasswordEmailChangeEvent(email: value.toString()));
          },
        ),
      ),
    );
  }
}
