import 'package:bunny_sync/global/models/rabbit_property_model.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/widgets/buttons/more_menu_button.dart';
import 'package:flutter/material.dart';

class LitterDetailsTile extends StatelessWidget {
  const LitterDetailsTile({
    super.key,
    required this.tileColor,
    required this.rabbitProperty,
    this.subTitle,
    this.onMoreMenu,
    this.onLongPress,
  });

  final Color tileColor;
  final RabbitPropertyModel rabbitProperty;
  final String? subTitle;
  final VoidCallback? onMoreMenu;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    final onMoreMenu = this.onMoreMenu;
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      tileColor: tileColor,
      leading: Image.asset(rabbitProperty.title),
      title: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          rabbitProperty.value,
          style: context.tt.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
      subtitle: subTitle != null
          ? Padding(
              padding: const EdgeInsets.only(
                top: 5,
                left: 10,
              ),
              child: Text(
                subTitle!,
                style: context.tt.bodySmall?.copyWith(
                  color: context.cs.surfaceContainerHighest,
                  height: 1.2,
                ),
              ),
            )
          : null,
      onLongPress: onLongPress,
      trailing: onMoreMenu != null
          ? MoreMenuButton(
              onTap: onMoreMenu,
              color: tileColor,
            )
          : null,
    );
  }
}
