import 'package:bunny_sync/global/theme/theme.dart';
import 'package:flutter/material.dart';

class BunnyTextField extends StatefulWidget {
  const BunnyTextField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.focusNode,
    this.errorText,
    this.onSubmitted,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
  });

  final String hintText;
  final bool isPassword;
  final FocusNode? focusNode;
  final String? errorText;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  State<BunnyTextField> createState() => _BunnyTextFieldState();
}

class _BunnyTextFieldState extends State<BunnyTextField> {
  late bool isObscure = widget.isPassword;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: widget.onSubmitted,
      onChanged: widget.onChanged,
      obscureText: isObscure,
      focusNode: widget.focusNode,
      decoration: InputDecoration(
        prefixIconConstraints: const BoxConstraints(
          minWidth: 40,
          minHeight: 20,
          maxWidth: 40,
          maxHeight: 20,
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                child: Icon(
                  isObscure
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: context.cs.tertiary,
                ),
              )
            : widget.suffixIcon,
        hintText: widget.hintText,
      ),
    );
  }
}
