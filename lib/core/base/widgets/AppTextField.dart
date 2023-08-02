import 'package:flutter/material.dart';
import 'package:qs_flutter/core/app_context.dart';
import 'package:qs_flutter/core/values/app_colors.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.borderRadius = 8,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    required this.onChanged,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final double borderRadius;
  final TextInputType? keyboardType;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final Function(String?) onChanged;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        label: Text(widget.labelText),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        filled: false,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: const BorderSide(),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: const BorderSide(color: AppColors.colorPrimary),
        ),
        hintStyle: const TextStyle(),
        suffixIcon: widget.obscureText
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
                child: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  color: Theme.of(AppContext.context).secondaryHeaderColor,
                ),
              )
            : null,
        errorStyle: TextStyle(color: Theme.of(AppContext.context).colorScheme.error),
      ),
      style: const TextStyle(),
      obscureText: widget.obscureText && _obscurePassword,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
    );
  }
}
