import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:flutter/material.dart';

class LedgerTile extends StatelessWidget {
  const LedgerTile({
    super.key,
    required this.leading,
    required this.title,
    required this.subtitle,
    this.color,
    this.border,
    this.onTap,
  });

  final Widget leading;
  final Widget title;
  final String subtitle;
  final Color? color;
  final Border? border;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color: color ?? context.cs.surface,
        border: border,
        borderRadius: AppConstants.borderRadius8,
        boxShadow: AppShadows.getTaskTileShadow(context),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: AppConstants.borderRadius8,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                leading,
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      title,
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: context.tt.titleLarge?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: context.cs.surfaceContainerHighest,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}