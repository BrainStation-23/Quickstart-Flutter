import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:qs_flutter/core/base/widgets/app_primary_button.dart';
import 'package:qs_flutter/core/base/widgets/app_spacer.dart';
import 'package:qs_flutter/core/base/widgets/base_setting_row.dart';
import 'package:qs_flutter/core/validators/input_validators.dart';
import 'package:qs_flutter/core/values/app_assets_path.dart';

import '../../../../core/base/widgets/app_textfield.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/values/app_values.dart';
import '../bloc/sign_in_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late AppLocalizations? _appLocalizations;

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _appLocalizations = AppLocalizations.of(context);

    return BlocConsumer<SignInBloc, SignInState>(listener: (context, state) {
      if (state.status == SignInStatus.success) {
        showSnackBarMessage(
            context,
            _appLocalizations?.loginSuccessMessage ?? "",
            SnackBarMessageType.success);
        context.goNamed(Routes.home);
      } else if (state.status == SignInStatus.failure) {
        showSnackBarMessage(context, _appLocalizations?.failedMessage ?? "",
            SnackBarMessageType.failure);
      }
    }, builder: (context, state) {
      return Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const ChangeSetting(),
                      const AppSpacer(),
                      _buildAppHeader(),
                      const AppSpacer(),
                      _buildEmailTextField(state),
                      _buildPasswordTextField(state),
                      const AppSpacer(),
                      _buildSignInButton(state),
                      const AppSpacer(
                        height: AppValues.height_16,
                      ),
                      _buildSignInWith(context),
                      const AppSpacer(
                        height: AppValues.height_16,
                      ),
                      _buildSocialLogIn(context),
                      _buildDontHaveAccount(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Image _buildAppHeader() {
    return Image.asset(
      AppAssets.appLogo,
      height: 120.0,
      width: 120.0,
    );
  }

  Widget _buildSocialLogIn(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: SvgPicture.asset(AppAssets.googleSVG),
            onPressed: () {},
          ),
          const AppSpacer(
            width: AppValues.padding,
          ),
          IconButton(
            icon: SvgPicture.asset(AppAssets.facebookSVG),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSignInButton(SignInState state) {
    return state.status == SignInStatus.loading?const CircularProgressIndicator():AppPrimaryButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            context.read<SignInBloc>().add(SignInSubmitted());
          }
        },
        title: _appLocalizations?.logIn ?? "");
  }

  Widget _buildDontHaveAccount() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(_appLocalizations?.dontHaveAccount ?? ""),
        const AppSpacer(width: AppValues.halfPadding),
        TextButton(
            onPressed: () {
              context.goNamed(Routes.signUp);
            },
            child: Text(_appLocalizations?.signUp ?? ""))
      ],
    );
  }

  Widget _buildSignInWith(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Flexible(
            flex: 1,
            child: Divider(),
          ),
          Flexible(
            flex: 3,
            child:
                FittedBox(child: Text(_appLocalizations?.orSignInWith ?? "")),
          ),
          const Flexible(
            flex: 1,
            child: Divider(),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordTextField(SignInState state) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Padding(
        padding: const EdgeInsets.only(left: AppValues.margin_2),
        child: Text(
          _appLocalizations?.fieldTitlePassword ?? "",
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(
          top: AppValues.smallMargin,
        ),
        child: AppTextField(
            isEnabled: state.status != SignInStatus.loading,
            prefix: const Icon(Icons.password_outlined),
            controller: _passwordController,
            labelText: _appLocalizations?.fieldLabelTextPassword ?? "",
            onChanged: (value) {
              context
                  .read<SignInBloc>()
                  .add(PasswordChangeEvent(password: value.toString()));
            },
            // validator: InputValidators.password,
            obscureText: true),
      ),
    );
  }

  //
  Widget _buildEmailTextField(SignInState state) {
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
          isEnabled: state.status != SignInStatus.loading,
          prefix: const Icon(Icons.email_outlined),
          controller: _emailController,
          labelText: _appLocalizations?.fieldLabelTextEmail ?? "",
          validator: InputValidators.email,
          onChanged: (value) {
            context
                .read<SignInBloc>()
                .add(EmailChangeEvent(email: value.toString()));
          },
        ),
      ),
    );
  }
}
