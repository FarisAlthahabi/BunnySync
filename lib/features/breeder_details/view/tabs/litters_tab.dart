import 'package:bunny_sync/features/breeder_details/view/widgets/litter_row.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/widgets/buttons/main_action_button.dart';
import 'package:bunny_sync/global/widgets/search_text_field.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

abstract class LittersTabCallbacks {
  void onTryAgainTap();

  void onAddLitterTab();

  void onShowKitsTab();

  void onEditTab();

  void onDeleteTab();

  void onChanged(String value);
}

class LittersTab extends StatefulWidget {
  const LittersTab({
    super.key,
    required this.breederId,
    this.controller,
  });

  final int breederId;
  final ScrollController? controller;

  @override
  State<LittersTab> createState() => _LittersTabState();
}

class _LittersTabState extends State<LittersTab>
    implements LittersTabCallbacks {
  @override
  void onAddLitterTab() {
    // TODO: implement onAddLitterTab
  }

  @override
  void onTryAgainTap() {
    // TODO: implement onTryAgainTap
  }

  @override
  void onDeleteTab() {
    // TODO: implement onDeleteTab
  }

  @override
  void onEditTab() {
    // TODO: implement onEditTab
  }

  @override
  void onShowKitsTab() {
    // TODO: implement onShowKitsTab
  }
  @override
  void onChanged(String value) {
    // TODO: implement onChaned
  }
  @override
  Widget build(BuildContext context) {
    final List<String> columnsTitles = [
      '',
      "number".i18n,
      "litter_id".i18n,
      "buck".i18n,
      "doe".i18n,
      "age".i18n,
      '#${"kits".i18n}',
      '#${"live".i18n}',
      '#${"died".i18n}',
      '#${"sold".i18n}',
      "action".i18n,
    ];
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            const Expanded(
              flex: 2,
              child: SizedBox(),
            ),
            Expanded(
              flex: 4,
              child: SearchTextField(
                onChanged: onChanged,
                hintText: 'Search..',
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 3,
              child: MainActionButton(
                text: 'Add New Litter',
                onTap: onAddLitterTab,
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.add),
                    Text('Add New Litter'),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: DataTable2(
              dataTextStyle: context.tt.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.greyShade,
              ),
              dataRowHeight: 60,
              columnSpacing: 12,
              horizontalMargin: 12,
              minWidth: 960,
              columns: List<DataColumn>.generate(
                columnsTitles.length,
                (index) {
                  double fixedWidth = 80;
                  Widget label = Center(
                    child: Text(
                      columnsTitles[index],
                      style: context.tt.titleMedium?.copyWith(
                        color: AppColors.greyShade,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  );
                  if (index == 0) {
                    fixedWidth = 40;
                    label = const SizedBox();
                  }
                  return DataColumn2(
                    fixedWidth: fixedWidth,
                    label: label,
                  );
                },
              ),
              rows: List<DataRow>.generate(
                12,
                (index) => litterRow(
                  context: context,
                  index: index,
                  onShowKitsTab: onShowKitsTab,
                  onEditTab: onEditTab,
                  onDeleteTab: onDeleteTab,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
