import 'package:bunny_sync/global/models/rabbit_property_model.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:flutter/material.dart';

class LitterDetailsTile extends StatelessWidget {
  const LitterDetailsTile({
    super.key,
    required this.tileColor,
    required this.rabbitProperty,
    this.subTitle,
  });

  final Color tileColor;
  final RabbitPropertyModel rabbitProperty;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
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
                  color: AppColors.greyShade7,
                  height: 1.2,
                ),
              ),
            )
          : null,
    );
    // Container(
    //   decoration: BoxDecoration(color: tileColor),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
    //         child: Text(
    //           rabbitProperty.title,
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.only(right: 15),
    //         child: Text(
    //           rabbitProperty.value,
    //           style: TextStyle(color: context.cs.primary),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
