import 'package:flutter/material.dart';
import 'package:qs_flutter/core/app_context.dart';

import '../../values/app_colors.dart';

class AppTextField extends StatefulWidget {
  AppTextField(
      {Key? key,
      required this.controller,
      required this.labelText,
      this.borderRadius = 8,
      this.hintText,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.prefix,
      this.suffix,
      this.validator,
      this.borderWidth,
      this.borderColor,
      this.isFiled,
      required this.onChanged,
      this.isEnabled})
      : super(key: key);

  final TextEditingController controller;
  late String labelText;
  final double borderRadius;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? prefix;
  final Widget? suffix;
  final double? borderWidth;
  final FormFieldValidator<String>? validator;
  final Function(String?) onChanged;
  final Color? borderColor;
  final bool? isFiled;
  final String? hintText;
  final bool? isEnabled;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.isEnabled,
      controller: widget.controller,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.hintText,
        alignLabelWithHint: true,
        fillColor: Theme.of(context).colorScheme.surface,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        label: FittedBox(child: Text(widget.labelText)),
        floatingLabelBehavior: widget.hintText != null
            ? FloatingLabelBehavior.never
            : FloatingLabelBehavior.auto,
        filled: widget.isFiled ?? false,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide(width: widget.borderWidth ?? 1)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: widget.borderColor ??
                Theme.of(AppContext.context).textTheme.button!.color!,
            width: widget.borderWidth ?? 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
              color: AppColors.colorPrimary, width: widget.borderWidth ?? 1),
        ),
        suffixIcon: widget.obscureText
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
                child: _obscurePassword
                    ? const Icon(Icons.visibility_off)
                    :const Icon(Icons.visibility),
              )
            : widget.suffix,
        prefixIcon: widget.prefix,
      ),
      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
      obscureText: widget.obscureText && _obscurePassword,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
    );
  }
}
