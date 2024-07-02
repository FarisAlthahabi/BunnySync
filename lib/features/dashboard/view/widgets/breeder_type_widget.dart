import 'package:bunny_sync/global/theme/theme.dart';
import 'package:flutter/material.dart';

class BreederTypeWidget extends StatelessWidget {
  const BreederTypeWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final Widget icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
        hoverColor: AppColors.backgroundColor,
          onTap: onTap,
          child: CircleAvatar(
            backgroundColor: AppColors.greyShade9,
            radius: 30,
            child: icon
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          title,
          style: context.tt.bodyMedium?.copyWith(fontSize: 12, height: 1.2),
        ),
      ],
    );
  }
}
