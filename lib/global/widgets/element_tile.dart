import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/main_tile.dart';
import 'package:flutter/material.dart';

class ElementTile extends StatelessWidget {
  const ElementTile({
    super.key,
    required this.no,
    required this.description,
    required this.tag,
    this.type,
    this.createdAt,
    this.secondaryTag,
    this.note,
  });

  final String no;
  final String description;
  final String tag;
  final Widget? type;
  final String? createdAt;
  final String? secondaryTag;
  final String? note;

  @override
  Widget build(BuildContext context) {
    final type = this.type;
    final createdAt = this.createdAt;
    final secondaryTag = this.secondaryTag;
    final note = this.note;

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
              if (type != null) type,
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
                    style: context.tt.labelSmall?.copyWith(
                      color: context.cs.scrim,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          if (createdAt != null) ...[
            const SizedBox(height: 5),
            Row(
              children: [
                const SizedBox(width: 50),
                Text(
                  createdAt,
                  style: context.tt.labelSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                if (secondaryTag != null)
                  Text(
                    secondaryTag,
                    style: context.tt.labelMedium?.copyWith(
                      color: context.cs.scrim,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 5),
          ],
          if (note != null)
            Column(
              children: [
                Divider(
                  thickness: 1,
                  color: context.cs.tertiaryContainer,
                  height: 30,
                  indent: 12,
                  endIndent: 12,
                ),
                Text(
                  note,
                  style: context.tt.labelMedium?.copyWith(
                    color: context.cs.scrim,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
