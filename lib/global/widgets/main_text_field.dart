import 'package:bunny_sync/global/theme/theme.dart';
import 'package:flutter/material.dart';

class MainTextField extends StatefulWidget {
  const MainTextField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.focusNode,
    this.errorText,
    this.onSubmitted,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.labelText,
    this.keyboardType,
    this.initialValue,
    this.maxLines,
    this.fillColor,
    this.enabled,
  });

  final String hintText;
  final bool isPassword;
  final FocusNode? focusNode;
  final String? errorText;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? labelText;
  final TextInputType? keyboardType;
  final String? initialValue;
  final int? maxLines;
  final Color? fillColor;
  final bool? enabled;

  @override
  State<MainTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  late bool isObscure = widget.isPassword;

  @override
  Widget build(BuildContext context) {
    final label = widget.labelText;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (label != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: context.tt.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: context.cs.surfaceContainerHighest,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        TextFormField(
          enabled: widget.enabled,
          initialValue: widget.initialValue,
          onFieldSubmitted: widget.onSubmitted,
          onChanged: widget.onChanged,
          obscureText: isObscure,
          focusNode: widget.focusNode,
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
            fillColor: widget.fillColor,
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
            errorText: widget.errorText,
          ),
        ),
      ],
    );
  }
}
