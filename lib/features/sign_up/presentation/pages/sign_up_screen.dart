import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:qs_flutter/core/base/widgets/app_spacer.dart';
import 'package:qs_flutter/core/utils/utils.dart';

import '../../../../core/base/widgets/app_primary_button.dart';
import '../../../../core/base/widgets/app_textfield.dart';
import '../../../../core/validators/input_validators.dart';
import '../../../../core/values/app_assets_path.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/values/app_values.dart';
import '../bloc/sign_up_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  late AppLocalizations? _appLocalizations;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    _appLocalizations = AppLocalizations.of(context);
    return Scaffold(
      body: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state.status == SignUpStatus.success) {
            _firstNameController.text = '';
            _lastNameController.text = '';
            _passwordController.text = '';
            _birthDateController.text = '';
            _emailController.text = '';
            _phoneNumberController.text = '';
            _selectedDate = DateTime.now();
            context.read<SignUpBloc>().add(SignUpStatusChange());
          } else if (state.status == SignUpStatus.failure) {
            showSnackBarMessage(
                context, "Something is wrong", SnackBarMessageType.failure);
          } else if (state.status == SignUpStatus.verify_otp) {
            showSnackBarMessage(
                context, state.responseMessage, SnackBarMessageType.success);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppValues.padding,
                horizontal: AppValues.padding,
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Form(
                  key: _formKey,
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        _buildAppHeader(),
                        const SizedBox(
                          height: AppValues.halfPadding,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildFirsNameField(),
                            const SizedBox(
                              width: AppValues.margin,
                            ),
                            _buildLastNameField(),
                          ],
                        ),
                        const SizedBox(
                          height: AppValues.halfPadding,
                        ),
                        _buildEmailField(),
                        const SizedBox(
                          height: AppValues.halfPadding,
                        ),
                        _buildPhoneNumberField(),
                        const SizedBox(
                          height: AppValues.halfPadding,
                        ),

                      _buildPasswordTextField(),
                         const SizedBox(
                          height: AppValues.padding,
                        ),
                        _buildSubmitButton(state),
                        const SizedBox(
                          height: AppValues.padding,
                        ),
                        _buildCreateAccountWith(context),
                        const SizedBox(
                          height: AppValues.halfPadding,
                        ),
                        _buildSocialLogIn(context),
                        _buildFooter(context)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCreateAccountWith(BuildContext context) {
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
            flex: 2,
            child: Text(_appLocalizations?.orCreateAccountWith ?? ""),
          ),
          const Flexible(
            flex: 1,
            child: Divider(),
          ),
        ],
      ),
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
            width: 8,
          ),
          IconButton(
            icon: SvgPicture.asset(AppAssets.facebookSVG),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
  Widget _buildFirsNameField() {
    return Flexible(
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Padding(
          padding: const EdgeInsets.only(left: AppValues.margin_2),
          child: Text(
            _appLocalizations?.firstNameFormTitle ?? "",
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: AppValues.smallMargin),
          child: AppTextField(
            onChanged: (value) {
              context.read<SignUpBloc>().add(
                    FirstNameChangeEvent(
                      firstName: value ?? "",
                    ),
                  );
            },
            controller: _firstNameController,
            validator: InputValidators.name,
            labelText: _appLocalizations?.firstNameFormLabel ?? "",
          ),
        ),
      ),
    );
  }

  Widget _buildLastNameField() {
    return Flexible(
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Padding(
          padding: const EdgeInsets.only(left: AppValues.margin_2),
          child: Text(
            _appLocalizations?.lastNameFormTitle ?? "",
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: AppValues.smallMargin),
          child: AppTextField(
            onChanged: (value) {
              context.read<SignUpBloc>().add(
                    LastNameChangeEvent(
                      lastName: value ?? "",
                    ),
                  );
            },
            controller: _lastNameController,
            validator: InputValidators.name,
            labelText: _appLocalizations?.lastNameFormLabel ?? "",
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Padding(
        padding: const EdgeInsets.only(left: AppValues.margin_2),
        child: Text(
          _appLocalizations?.fieldLabelTextEmail ?? "",
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: AppValues.smallMargin),
        child: AppTextField(
          onChanged: (value) {
            context.read<SignUpBloc>().add(
                  EmailChangeEvent(
                    email: value ?? "",
                  ),
                );
          },
          controller: _emailController,
          validator: InputValidators.email,
          labelText: _appLocalizations?.emailLabel ?? "",
          prefix: const Icon(Icons.email_outlined)
        ),
      ),
    );
  }
  Image _buildAppHeader() {
    return Image.asset(
      AppAssets.appLogo,
      height: 120.0,
      width: 120.0,
      fit: BoxFit.scaleDown,
    );
  }

  Widget _buildPhoneNumberField() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Padding(
        padding: const EdgeInsets.only(left: AppValues.margin_2),
        child: Text(
          _appLocalizations?.fieldLabelTextPhone ?? "",
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: AppValues.smallMargin),
        child: AppTextField(
          onChanged: (value) {
            context.read<SignUpBloc>().add(
                  PhoneNumberChangeEvent(
                    phoneNumber: value ?? "",
                  ),
                );
          },
          controller: _phoneNumberController,
          validator: InputValidators.phone,
          labelText: _appLocalizations?.phoneLabel ?? "",
          prefix:const Icon(Icons.phone_iphone_outlined),
        ),
      ),
    );
  }

  // Widget _buildBirthDateField(SignUpState state) {
  //   return ListTile(
  //     contentPadding: EdgeInsets.zero,
  //     title: Padding(
  //       padding: const EdgeInsets.only(left: AppValues.margin_2),
  //       child: Text(
  //         _appLocalizations?.birthdateFormTitle ?? "",
  //       ),
  //     ),
  //     subtitle: Padding(
  //       padding: const EdgeInsets.only(top: AppValues.smallMargin),
  //       child: OutlinedButton(
  //         onPressed: () async {
  //           await _selectDate(context);
  //         },
  //         style: OutlinedButton.styleFrom(
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //           side: BorderSide(
  //             color: state.isAgeValidate
  //                 ? AppColors.formBorderColor
  //                 : Theme.of(context).colorScheme.error,
  //             width: 1,
  //           ),
  //           padding: const EdgeInsets.symmetric(
  //             vertical: AppValues.buttonVerticalPadding,
  //           ),
  //         ),
  //         child: Center(
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: [
  //               const SizedBox(
  //                 width: AppValues.margin_14,
  //               ),
  //               SvgPicture.asset("assets/svg/birthdate_prefix.svg"),
  //               const SizedBox(
  //                 width: AppValues.margin_14,
  //               ),
  //               Text(
  //                 _birthDateController.text == ""
  //                     ? _appLocalizations?.birthdateFormLabel ?? ""
  //                     : _birthDateController.text,
  //                 style: TextStyle(
  //                   fontSize: 16,
  //                   fontWeight: FontWeight.w400,
  //                   color: state.isAgeValidate
  //                       ? AppColors.formLabelColor
  //                       : Theme.of(context).colorScheme.error,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildPasswordTextField() {
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

            prefix: const Icon(Icons.password_outlined),
            controller: _passwordController,
            labelText: _appLocalizations?.fieldLabelTextPassword ?? "",
            onChanged: (value) {
              context
                  .read<SignUpBloc>()
                  .add(PasswordChangeEvent(password: value.toString()));
            },
            validator: InputValidators.password,
            obscureText: true),
      ),
    );
  }

  Widget _buildSubmitButton(SignUpState state) {
    return state.status == SignUpStatus.loading
        ? const Center(
            child: CircularProgressIndicator(
              color: AppColors.colorPrimary,
            ),
          )
        : AppPrimaryButton(
            onPressed: () => {
              _formKey.currentState?.validate(),
              if (_birthDateController.text == "")
                {
                  context.read<SignUpBloc>().add(
                        const SignUpValidateAgeEvent(
                          isValidAge: false,
                        ),
                      )
                }
              else if (_formKey.currentState?.validate() != false &&
                  state.isAgeValidate)
                context.read<SignUpBloc>().add(SignUpSubmitted())
            },
            title: _appLocalizations?.signUp ?? "",
          );
  }

  Widget _buildFooter(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       const Text("Already Have Account?"),
        const SizedBox(width: AppValues.halfPadding,),
        TextButton(onPressed: (){
          context.pop();
        }, child: const Text("Sign In"))
      ],
    );
  }
  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: _birthDateController.text == ""
  //         ? _selectedDate
  //         : _birthDateController.text.toDate(),
  //     initialDatePickerMode: DatePickerMode.year,
  //     firstDate: DateTime(1900),
  //     lastDate: DateTime.now(),
  //     confirmText: "Select",
  //     cancelText: "Cancel",
  //     builder: (context, child) {
  //       return Theme(
  //         data: Theme.of(context).copyWith(
  //           colorScheme: const ColorScheme.light(primary: Colors.green),
  //           textButtonTheme: TextButtonThemeData(
  //             style: TextButton.styleFrom(
  //               foregroundColor: Colors.green.shade800, // button text color
  //             ),
  //           ),
  //         ),
  //         child: child!,
  //       );
  //     },
  //   );
  //
  //   if (picked != null) {
  //     context.read<SignUpBloc>().add(
  //           BirthDateChangeEvent(
  //             birthdate: picked.formatToString(),
  //           ),
  //         );
  //
  //     context.read<SignUpBloc>().add(
  //           SignUpValidateAgeEvent(
  //             isValidAge: InputValidators.age(picked),
  //           ),
  //         );
  //     _selectedDate = picked;
  //     _birthDateController.text = picked.formatToString(format: 'MM/dd/yyyy');
  //   }
  // }
}