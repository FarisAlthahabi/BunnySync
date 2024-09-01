import 'package:auto_size_text/auto_size_text.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LedgerTile extends StatelessWidget {
  const LedgerTile({
    super.key,
    required this.leading,
    required this.title,
    required this.subtitle,
    this.color,
    this.border,
    this.onTap,
    this.secondSubtitle,
  });

  final Widget leading;
  final Widget title;
  final String subtitle;
  final Color? color;
  final Border? border;
  final String? secondSubtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final secondSubtitle = this.secondSubtitle;
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
                Skeleton.shade(child: leading),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      title,
                      const SizedBox(height: 4),
                      Expanded(
                        child: AutoSizeText(
                          subtitle,
                          style: context.tt.titleLarge?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: context.cs.surfaceContainerHighest,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      if(secondSubtitle != null)
                      Expanded(
                        child: AutoSizeText(
                          secondSubtitle,
                          style: context.tt.titleLarge?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: context.cs.surfaceContainerHighest,
                          ),
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
