import 'package:bunny_sync/global/extensions/string_x.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:flutter/material.dart';

class HomeTile extends StatelessWidget {
  const HomeTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.secondSubtitle,
  });

  final String icon;
  final String title;
  final String subtitle;
  final String secondSubtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: context.cs.primary,
        borderRadius: AppConstants.borderRadius18,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: icon.svg(
              width: 56,
              height: 56,
              color: context.cs.surface,
            ),
          ),
          const Spacer(),
          Text(
            title,
            style: context.tt.titleSmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: context.cs.surface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: context.tt.headlineMedium?.copyWith(
              color: context.cs.surface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            secondSubtitle,
            style: context.tt.labelSmall?.copyWith(
              color: context.cs.surface,
            ),
          ),
        ],
      ),
    );
  }
}
