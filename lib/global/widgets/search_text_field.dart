import 'package:bunny_sync/global/gen/assets.gen.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    this.hintText,
    this.onChanged,
    this.onDeleteText,
    this.controller,
    this.focusNode,
  });

  final String? hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onDeleteText;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          controller: controller,
          focusNode: focusNode,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: context.cs.onInverseSurface,
            prefixIconConstraints: const BoxConstraints(
              minWidth: 40,
              minHeight: 20,
              maxWidth: 40,
              maxHeight: 20,
            ),
            prefixIcon: Skeleton.shade(
              child: Assets.icons.search.svg(),
            ),
            suffixIcon: onDeleteText != null
                ? InkWell(
                    onTap: onDeleteText,
                    child: Icon(
                      color: context.cs.tertiary,
                      Icons.close,
                      size: 20,
                    ),
                  )
                : null,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(4),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(4),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ],
    );
  }
}
