import 'package:bunny_sync/features/settings/models/settings_tile_model.dart';
import 'package:bunny_sync/global/extensions/string_x.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/main_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.items,
    required this.title,
  });

  final List<SettingsTileModel> items;
  final String title;

  @override
  Widget build(BuildContext context) {
    return MainTile(
      padding: AppConstants.padding4,
      borderRadius: AppConstants.borderRadius16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 16),
            child: Text(
              title,
              style: context.tt.headlineSmall?.copyWith(
                fontFamily: GoogleFonts.manrope().fontFamily,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                dense: true,
                contentPadding: AppConstants.paddingH16,
                onTap: items[index].call,
                tileColor: context.cs.surface,
                leading: items[index].icon.svg(),
                title: Text(
                  items[index].title,
                  style: context.tt.labelLarge
                      ?.copyWith(color: context.cs.surfaceContainerHighest),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                thickness: 1,
                endIndent: 30,
                indent: 30,
                color: context.cs.onTertiaryFixed,
              );
            },
          ),
        ],
      ),
    );
  }
}
