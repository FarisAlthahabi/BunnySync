import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/main_tile.dart';
import 'package:flutter/material.dart';

class ElementTile extends StatelessWidget {
  const ElementTile({
    super.key,
    required this.no,
    required this.description,
    required this.subtitle,
    required this.tag,
    this.icon,
    this.createdAt,
    this.numTitle,
  });

  final String no;
  final String description;
  final String? icon;
  final String subtitle;
  final String tag;
  final String? numTitle;
  final String? createdAt;

  @override
  Widget build(BuildContext context) {
    final icon = this.icon;
    final numTitle = this.numTitle;
    final createdAt = this.createdAt;
    return MainTile(
      boxShadow: AppShadows.getTaskTileShadow(context),
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.only(left: 5),
            tileColor: context.cs.surface,
            leading: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: context.cs.primary,
                ),
                color: context.cs.surface,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  no,
                  style: context.tt.titleSmall?.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            title: Text(
              strutStyle: const StrutStyle(height: 1.6),
              description,
              style: context.tt.titleSmall?.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Row(
            children: [
              const SizedBox(width: 50),
              if (icon != null)
                Icon(
                  Icons.favorite_outline_outlined,
                  color: context.cs.onSurface,
                ),
              const SizedBox(width: 5),
              Text(
                numTitle == null ? subtitle : '$numTitle : $subtitle',
                style:
                    context.tt.labelSmall?.copyWith(color: context.cs.tertiary),
              ),
              const Expanded(
                flex: 2,
                child: SizedBox(),
              ),
              Container(
                padding: AppConstants.padding6,
                decoration: BoxDecoration(
                  borderRadius: AppConstants.borderRadius12,
                  color: context.cs.onInverseSurface,
                ),
                child: Center(
                  child: Text(
                    tag,
                    style: context.tt.labelSmall
                        ?.copyWith(color: context.cs.scrim),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (createdAt != null)
            Row(
              children: [
                const SizedBox(width: 50),
                Text(
                  createdAt,
                  style: context.tt.labelSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
