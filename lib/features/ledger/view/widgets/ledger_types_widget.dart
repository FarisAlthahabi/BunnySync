import 'package:auto_size_text/auto_size_text.dart';
import 'package:bunny_sync/features/ledger/models/ledger_stats_model/ledger_stats_model.dart';
import 'package:bunny_sync/features/ledger/models/ledger_types.dart';
import 'package:bunny_sync/features/ledger/view/widgets/ledger_tile.dart';
import 'package:bunny_sync/global/extensions/currency_display_x.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/widgets/icons/boxed_icon_widget.dart';
import 'package:flutter/material.dart';

class LedgerTypesWidget extends StatefulWidget {
  const LedgerTypesWidget({
    super.key,
    required this.onSelect,
    required this.ledgerStats,
  });

  final ValueChanged<LedgerTypes?> onSelect;
  final LedgerStatsModel ledgerStats;

  @override
  State<LedgerTypesWidget> createState() => _LedgerTypesWidgetState();
}

class _LedgerTypesWidgetState extends State<LedgerTypesWidget> {
  LedgerTypes? selectedType;

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.4,
      ),
      children: LedgerTypes.values.map(
        (e) {
          return LedgerTile(
            onTap: () {
              setState(() {
                selectedType = selectedType == e ? null : e;
              });
              widget.onSelect(selectedType);
            },
            leading: BoxedIconWidget(
              icon: e.icon,
              color: e.color(context),
              iconColor: e.iconColor(context),
            ),
            title: AutoSizeText(
              strutStyle: const StrutStyle(height: 1.6),
              e.title,
              maxLines: e.textMaxLines,
              style: context.tt.titleLarge?.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            subtitle: e.getLedgerTypeValue(widget.ledgerStats).showAsCurrency(),
            border: selectedType == e
                ? Border.all(
                    color: context.cs.primary,
                    width: 4,
                  )
                : null,
            color: selectedType == e ? context.cs.onTertiaryFixedVariant : null,
          );
        },
      ).toList(),
    );
  }
}
