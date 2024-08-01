import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/ledger/view/widgets/ledger_types_widget.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/router/router.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/element_tile.dart';
import 'package:bunny_sync/global/widgets/texts/bordered_textual_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class LedgerViewCallBacks {
  void onAddTap();
}

@RoutePage()
class LedgerView extends StatelessWidget {
  const LedgerView({super.key});

  @override
  Widget build(BuildContext context) {
    return const LedgerPage();
  }
}

class LedgerPage extends StatefulWidget {
  const LedgerPage({super.key});

  @override
  State<LedgerPage> createState() => _LedgerPageState();
}

class _LedgerPageState extends State<LedgerPage>
    implements LedgerViewCallBacks {
  @override
  void onAddTap() {
    context.router.push(const AddLedgerRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 0.55.sh,
            snap: true,
            pinned: true,
            floating: true,
            shadowColor: context.cs.shadow,
            forceElevated: true,
            shape: const RoundedRectangleBorder(
              borderRadius: AppConstants.bottomCornersBorderRadius,
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: AppConstants.padding16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).padding.top),
                    const SizedBox(height: 30),
                    Text(
                      'ledger'.i18n,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(height: 10),
                    LedgerTypesWidget(onSelect: (_) {}),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: AppConstants.padding16,
              itemBuilder: (context, index) {
                return ElementTile(
                  leading: BorderedTextualWidget(text: '$index'),
                  title: Text(
                    strutStyle: const StrutStyle(height: 1.6),
                    'Cupidatat consequat aute nostrud proident duis Lorem elit',
                    style: context.tt.titleSmall?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 16,
                );
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: AppConstants.padding16,
        child: FloatingActionButton(
          onPressed: onAddTap,
          shape: RoundedRectangleBorder(
            borderRadius: AppConstants.circularBorderRadius,
          ),
          backgroundColor: context.cs.secondaryContainer,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
