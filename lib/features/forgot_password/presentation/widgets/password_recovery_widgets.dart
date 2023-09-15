// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//
// import '../../../../core/base/widgets/app_textfield.dart';
// import '../../../../core/values/app_values.dart';
//
// class StepOne extends StatefulWidget {
//   const StepOne({super.key});
//
//   @override
//   State<StepOne> createState() => _StepOneState();
// }
//
// class _StepOneState extends State<StepOne> {
//   late AppLocalizations? _appLocalizations;
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();
//
//   @override
//   void initState() {
//     _emailController.text = "";
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     _appLocalizations = AppLocalizations.of(context);
//
//     return Form(
//       key: _formKey,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           ListTile(
//             contentPadding: EdgeInsets.zero,
//             title: Padding(
//               padding: const EdgeInsets.only(left: AppValues.margin_2),
//               child: Text(
//                 _appLocalizations?.fieldTitleUsername ?? "",
//                 style: formTitleStyle,
//               ),
//             ),
//             subtitle: Padding(
//               padding: const EdgeInsets.only(top: AppValues.smallMargin),
//               child: AppTextField(
//                 prefix: SvgPicture.asset(
//                   AppAssetsPath.iconEmail,
//                   fit: BoxFit.scaleDown,
//                 ),
//                 controller: _emailController,
//                 hintText: _appLocalizations?.emailFormLabel ?? "",
//                 labelText: _appLocalizations?.emailFormLabel ?? "",
//                 validator: InputValidators.email,
//                 onChanged: (value) {
//                   context
//                       .read<ForgotPasswordBloc>()
//                       .add(ForgotPasswordEmailChanged(email: value));
//                 },
//               ),
//             ),
//           ),
//           const AppSpacer(height: AppValues.height_40),
//           AppPrimaryButton(
//             onPressed: () {
//               if (_formKey.currentState?.validate() == true) {
//                 _formKey.currentState?.save();
//                 context.read<ForgotPasswordBloc>().add(
//                       ForgotPasswordRequestedSendOTP(
//                         email: _emailController.text,
//                       ),
//                     );
//               }
//             },
//             title: _appLocalizations?.next ?? "",
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class StepTwo extends StatefulWidget {
//   const StepTwo({super.key});
//
//   @override
//   State<StepTwo> createState() => _StepTwoState();
// }
//
// class _StepTwoState extends State<StepTwo> {
//   late AppLocalizations? _appLocalizations;
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _otpController = TextEditingController();
//   Timer? _resendTimer;
//   int _resendDuration = 60;
//   bool _isResendButtonEnabled = false;
//
//   @override
//   void initState() {
//     super.initState();
//     startResendTimer();
//   }
//
//   @override
//   void dispose() {
//     _otpController.dispose();
//     _resendTimer?.cancel();
//     super.dispose();
//   }
//
//   void startResendTimer() {
//     _isResendButtonEnabled = false;
//     _resendDuration = 60;
//     _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         if (_resendDuration > 0) {
//           _resendDuration--;
//         } else {
//           _isResendButtonEnabled = true;
//           _resendTimer?.cancel();
//         }
//       });
//     });
//   }
//
//   void _onResendPressed() {
//     _otpController.text = "";
//     context.read<ForgotPasswordBloc>().add(
//           ForgotPasswordRequestedResendOTP(),
//         );
//     startResendTimer();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     _appLocalizations = AppLocalizations.of(context);
//
//     return Form(
//       key: _formKey,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           ListTile(
//             contentPadding: EdgeInsets.zero,
//             title: Padding(
//               padding: const EdgeInsets.only(left: AppValues.margin_2),
//               child: Text(
//                 _appLocalizations?.fieldTitleOTP ?? "",
//                 style: formTitleStyle,
//               ),
//             ),
//             subtitle: Padding(
//               padding: const EdgeInsets.only(top: AppValues.smallMargin),
//               child: AppTextField(
//                 prefix: SvgPicture.asset(
//                   AppAssetsPath.iconKey,
//                   fit: BoxFit.scaleDown,
//                 ),
//                 controller: _otpController,
//                 hintText: _appLocalizations?.fieldLabelTextOTP ?? "",
//                 labelText: _appLocalizations?.fieldLabelTextOTP ?? "",
//                 validator: InputValidators.otp,
//                 onChanged: (value) {
//                   try {
//                     if (value != null) {
//                       int otpInt = int.parse(value);
//                       context.read<ForgotPasswordBloc>().add(
//                             ForgotPasswordOTPChanged(otp: otpInt),
//                           );
//                     } else {
//                       context.read<ForgotPasswordBloc>().add(
//                             const ForgotPasswordOTPChanged(otp: null),
//                           );
//                     }
//                   } catch (e) {
//                     //
//                   }
//                 },
//                 keyboardType: TextInputType.number,
//               ),
//             ),
//           ),
//           const AppSpacer(height: AppValues.height_20),
//           if (_isResendButtonEnabled)
//             Align(
//               alignment: Alignment.centerRight,
//               child: GestureDetector(
//                 onTap: () {
//                   _onResendPressed();
//                 },
//                 child: Text(_appLocalizations?.resend ?? "",
//                     style: boldSectionTitlePrimaryColorStyle),
//               ),
//             )
//           else
//             Align(
//               alignment: Alignment.centerRight,
//               child: CustomTextSpam(
//                 startingValue: _appLocalizations?.otpResendTextStart ?? "",
//                 modifyValue: _resendDuration.toString(),
//                 lastValue: _appLocalizations?.otpResendTextEnd ?? "",
//               ),
//             ),
//           const AppSpacer(height: AppValues.height_20),
//           AppPrimaryButton(
//             onPressed: () {
//               if (_formKey.currentState?.validate() == true) {
//                 _formKey.currentState?.save();
//
//                 try {
//                   context.read<ForgotPasswordBloc>().add(
//                         ForgotPasswordRequestedVerifyOTP(
//                           otp: int.parse(_otpController.text),
//                         ),
//                       );
//                   _otpController.text = '';
//                 } catch (e) {
//                   showSnackbarMessage(
//                     context,
//                     "Invalid OTP",
//                     SnackBarMessageType.failure,
//                   );
//                 }
//               }
//             },
//             title: _appLocalizations?.next ?? "",
//             isEnabled: !_isResendButtonEnabled,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class StepThree extends StatefulWidget {
//   const StepThree({super.key});
//
//   @override
//   State<StepThree> createState() => _StepThreeState();
// }
//
// class _StepThreeState extends State<StepThree> {
//   late AppLocalizations? _appLocalizations;
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     _appLocalizations = AppLocalizations.of(context);
//
//     return Form(
//       key: _formKey,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           ListTile(
//             contentPadding: EdgeInsets.zero,
//             title: Padding(
//               padding: const EdgeInsets.only(left: AppValues.margin_2),
//               child: Text(
//                 _appLocalizations?.fieldTitlePassword ?? "",
//                 style: formTitleStyle,
//               ),
//             ),
//             subtitle: Padding(
//               padding: const EdgeInsets.only(top: AppValues.smallMargin),
//               child: AppTextField(
//                 prefix: SvgPicture.asset(
//                   AppAssetsPath.iconKey,
//                   fit: BoxFit.scaleDown,
//                 ),
//                 controller: _passwordController,
//                 hintText: _appLocalizations?.fieldLabelTextNewPassword ?? "",
//                 labelText: _appLocalizations?.fieldLabelTextNewPassword ?? "",
//                 onChanged: (value) {
//                   context.read<ForgotPasswordBloc>().add(
//                         ForgotPasswordNewPasswordChanged(
//                           password: value,
//                         ),
//                       );
//                 },
//                 validator: InputValidators.password,
//                 obscureText: true,
//               ),
//             ),
//           ),
//           const AppSpacer(height: AppValues.height_40),
//           AppPrimaryButton(
//             onPressed: () {
//               if (_formKey.currentState?.validate() == true) {
//                 _formKey.currentState?.save();
//
//                 context.read<ForgotPasswordBloc>().add(ForgotPasswordSubmited(
//                       password: _passwordController.text,
//                     ));
//                 _passwordController.text = "";
//               }
//             },
//             title: _appLocalizations?.resetPassword ?? "",
//           ),
//         ],
//       ),
//     );
//   }
// }
