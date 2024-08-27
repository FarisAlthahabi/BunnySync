import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/main_tile.dart';
import 'package:flutter/material.dart';

class ElementTile<T> extends StatelessWidget {
  const ElementTile({
    super.key,
    required this.leading,
    required this.title,
    this.tag,
    this.type,
    this.createdAt,
    this.secondaryTag,
    this.note,
    this.onTap,
    this.model,
    this.boxShadow,
    this.onLongPress,
  });

  final Widget leading;
  final Widget title;
  final String? tag;
  final Widget? type;
  final String? createdAt;
  final String? secondaryTag;
  final String? note;
  final ValueSetter<T>? onTap;
  final ValueSetter<T>? onLongPress;
  final T? model;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    final type = this.type;
    final createdAt = this.createdAt;
    final secondaryTag = this.secondaryTag;
    final tag = this.tag;
    final note = this.note;
    final onTap = this.onTap;
    final onLongPress = this.onLongPress;
    final model = this.model;
    return MainTile(
      onTap: onTap == null || model == null ? null : () => onTap(model),
      onLongPress: onLongPress == null || model == null
          ? null
          : () => onLongPress(model),
      boxShadow: boxShadow ?? AppShadows.getTaskTileShadow(context),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              leading,
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    title,
                    Row(
                      children: [
                        if (type != null)
                          Expanded(
                            flex: 5,
                            child: type,
                          ),
                        const Spacer(),
                        if (tag != null)
                          Flexible(
                            flex: 3,
                            child: Container(
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
                          ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    if (createdAt != null) ...[
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            createdAt,
                            style: context.tt.labelSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Spacer(),
                          if (secondaryTag != null)
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                secondaryTag,
                                style: context.tt.labelMedium?.copyWith(
                                  color: context.cs.scrim,
                                ),
                              ),
                            ),
                          const SizedBox(width: 5),
                        ],
                      ),
                      const SizedBox(height: 5),
                    ],
                  ],
                ),
              ),
            ],
          ),
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
