import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:qs_flutter/features/sign_up/presentation/bloc/sign_up_selector.dart';

import '../../../../core/base/widgets/app_primary_button.dart';
import '../../../../core/base/widgets/app_textfield.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/validators/input_validators.dart';
import '../bloc/sign_up_bloc.dart';

class OTPVerificationView extends StatefulWidget {
  const OTPVerificationView({super.key});

  @override
  State<OTPVerificationView> createState() => _OTPVerificationViewState();
}

class _OTPVerificationViewState extends State<OTPVerificationView> {
  final TextEditingController _otpEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late AppLocalizations? _appLocalizations;

  @override
  Widget build(BuildContext context) {
    _appLocalizations = AppLocalizations.of(context);

    return BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state.status == SignUpStatus.success) {
            showSnackBarMessage(
                context, "Successfully Signed Up", SnackBarMessageType.success);
            context.read<SignUpBloc>().add(SignUpStatusChange());
            context.goNamed(Routes.signIn);
          } else if (state.status == SignUpStatus.failure) {
            showSnackBarMessage(
                context, "Something is wrong", SnackBarMessageType.failure);
          }
        },
        child: Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child:
                              Text(_appLocalizations?.fieldLabelTextOTP ?? ""),
                        ),
                        subtitle: SignUpLoadingSelector((currentStatus) {
                          return AppTextField(
                              isEnabled: currentStatus == false,
                              controller: _otpEditingController,
                              validator: InputValidators.otp,
                              labelText: _appLocalizations?.fieldTitleOTP ?? "",
                              onChanged: (value) {
                                context
                                    .read<SignUpBloc>()
                                    .add(OTPChangeEvent(otp: value.toString()));
                              });
                        })),
                    SignUpLoadingSelector((currentStatus) {
                      return currentStatus == false
                          ? AppPrimaryButton(
                              onPressed: () {
                                context
                                    .read<SignUpBloc>()
                                    .add(VerifyOTPEvent());
                              },
                              title: _appLocalizations?.verifyOTP ?? "")
                          : const CircularProgressIndicator();
                    })
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
