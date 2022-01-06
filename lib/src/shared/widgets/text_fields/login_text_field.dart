import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  LoginTextField({
    Key? key,
    this.controller,
    this.hint,
    this.prefix,
    this.suffix,
    this.obscure,
    this.textInputType,
    this.onChanged,
    this.enabled,
    this.errorText
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hint;
  final Widget? prefix;
  final Widget? suffix;
  final bool? obscure;
  final TextInputType? textInputType;
  final Function(String)? onChanged;
  final bool? enabled;
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(5)
      ),
      padding: prefix != null ? null : const EdgeInsets.only(left: 16),
      child: TextField(
        controller: controller,
        obscureText: obscure ?? false,
        keyboardType: textInputType,
        onChanged: onChanged,
        enabled: enabled,
        decoration: InputDecoration(
          hintText: hint,
          border: const OutlineInputBorder(),
          prefixIcon: prefix,
          suffixIcon: suffix,
          errorText: errorText
        ),
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}
