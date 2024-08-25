import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/add_ledger/models/ledger_model/ledger_model.dart';
import 'package:bunny_sync/features/ledger/cubit/ledgers_cubit.dart';
import 'package:bunny_sync/features/ledger/models/ledger_types.dart';
import 'package:bunny_sync/features/ledger/view/widgets/ledger_types_widget.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/extensions/date_time_x.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/router/router.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
import 'package:bunny_sync/global/widgets/element_tile.dart';
import 'package:bunny_sync/global/widgets/list_suffix_empty_space_widget.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:bunny_sync/global/widgets/main_show_bottom_sheet.dart';
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:bunny_sync/global/widgets/texts/bordered_textual_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class LedgerViewCallBacks {
  void onAddTap();

  void onTryAgainTap();

  void onLedgerTap(LedgerModel ledgerModel);

  void onEditLedgerTap(LedgerModel ledgerModel);

  void onDeleteLedgerTap(LedgerModel ledgerModel);

  void onSelected(LedgerTypes ledgerType);
}

@RoutePage()
class LedgerView extends StatelessWidget {
  const LedgerView({
    super.key,
    this.addSuffixEmptySpace = false,
    this.breederId,
    this.litterId,
    this.controller,
  });

  final bool addSuffixEmptySpace;
  final int? breederId;
  final int? litterId;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get<LedgersCubit>(),
      child: LedgerPage(
        addSuffixEmptySpace: addSuffixEmptySpace,
        breederId: breederId,
        litterId: litterId,
        controler: controller,
      ),
    );
  }
}

class LedgerPage extends StatefulWidget {
  const LedgerPage({
    super.key,
    this.addSuffixEmptySpace = false,
    this.breederId,
    this.litterId,
    this.controler,
  });

  final bool addSuffixEmptySpace;
  final int? breederId;
  final int? litterId;
  final ScrollController? controler;

  @override
  State<LedgerPage> createState() => _LedgerPageState();
}

class _LedgerPageState extends State<LedgerPage>
    implements LedgerViewCallBacks {
  late final LedgersCubit ledgersCubit = context.read();
  @override
  void initState() {
    super.initState();
    if (widget.breederId == null && widget.breederId == null) {
      ledgersCubit.getLedgerStats();
    }
    ledgersCubit.getLedgers(
      breederId: widget.breederId,
      litterId: widget.litterId,
    );
  }

  @override
  void onDeleteLedgerTap(LedgerModel ledgerModel) {
    context.router.popForced();
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        title: 'are_you_sure_to_delete_ledger'.i18n,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {
                context.router.popForced();
                ledgersCubit.deleteLedger(ledgerModel.id);
              },
              child: Text('yes'.i18n),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onEditLedgerTap(LedgerModel ledgerModel) {
    Navigator.pop(context);
    context.router.push(
      AddLedgerRoute(
        ledgersCubit: ledgersCubit,
        ledger: ledgerModel,
      ),
    );
  }

  @override
  void onLedgerTap(LedgerModel ledgerModel) {
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        title: 'ledgers_options'.i18n,
        onEdit: onEditLedgerTap,
        onDelete: onDeleteLedgerTap,
        model: ledgerModel,
      ),
    );
  }

  @override
  void onSelected(LedgerTypes? ledgerType) {
    ledgersCubit.getLedgersByType(ledgerType);
  }

  @override
  void onAddTap() {
    context.router.push(
      AddLedgerRoute(ledgersCubit: ledgersCubit),
    );
  }

  @override
  void onTryAgainTap() {
    if (widget.breederId == null && widget.breederId == null) {
      ledgersCubit.getLedgerStats();
    }
    ledgersCubit.getLedgers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: widget.controler,
        slivers: [
          if (widget.breederId == null && widget.litterId == null)
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
                      BlocBuilder<LedgersCubit, GeneralLedgersState>(
                        buildWhen: (previous, current) =>
                            current is LedgerStatsState,
                        builder: (context, state) {
                          if (state is LedgerStatsFetch) {
                            return Skeletonizer(
                              enabled: state is LedgerStatsLoading,
                              child: LedgerTypesWidget(
                                ledgerStats: state.ledgerStats,
                                onSelect: onSelected,
                              ),
                            );
                          } else if (state is LedgerStatsFail) {
                            ledgersCubit.emitLedgersFail(state.message);
                            return MainErrorWidget(
                              error: state.message,
                              onTap: onTryAgainTap,
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          BlocConsumer<LedgersCubit, GeneralLedgersState>(
            listener: (context, state) {
              if (state is DeleteLedgerSuccess) {
                context.loaderOverlay.hide();
                MainSnackBar.showSuccessMessageBar(
                  context,
                  'ledger_delete'.i18n,
                );
              } else if (state is LedgersFail) {
                context.loaderOverlay.hide();
                MainSnackBar.showErrorMessageBar(
                  context,
                  state.message,
                );
              } else if (state is DeleteLedgerLoading) {
                context.loaderOverlay.show();
              } else if (state is DeleteLedgerFail) {
                context.loaderOverlay.hide();
                MainSnackBar.showErrorMessageBar(
                  context,
                  state.message,
                );
              }
            },
            buildWhen: (previous, current) => current is LedgersState,
            builder: (context, state) {
              if (state is LedgersFetch) {
                return Skeletonizer.sliver(
                  enabled: state is LedgersLoading,
                  child: SliverToBoxAdapter(
                    child: Column(
                      children: [
                        ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: AppConstants.padding16,
                          itemCount: state.ledgers.length,
                          itemBuilder: (context, index) {
                            final ledger = state.ledgers[index];
                            return ElementTile(
                              onTap: onLedgerTap,
                              model: ledger,
                              leading: Skeleton.shade(
                                child: BorderedTextualWidget(
                                  text: '${index + 1}',
                                ),
                              ),
                              title: Text(
                                strutStyle: const StrutStyle(height: 1.6),
                                ledger.name,
                                style: context.tt.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              tag: ledger.type.displayName,
                              type: Text(
                                ledger.amount.contains("\$")
                                    ? ledger.amount
                                    : '\$ ${ledger.amount}',
                              ),
                              secondaryTag: ledger.category.displayName,
                              createdAt: ledger.date.formatMMddYYYY,
                              note: ledger.notes,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 16,
                            );
                          },
                        ),
                        if (widget.addSuffixEmptySpace)
                          ListSuffixEmptySpaceWidget(
                            length: state.ledgers.length,
                          ),
                      ],
                    ),
                  ),
                );
              } else if (state is LedgersEmpty) {
                return SliverToBoxAdapter(
                  child: MainErrorWidget(
                    height: 0.4.sh,
                    error: state.message,
                  ),
                );
              } else if (state is LedgersFail) {
                return SliverToBoxAdapter(
                  child: MainErrorWidget(
                    height: 0.4.sh,
                    error: state.message,
                    onTap: onTryAgainTap,
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
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
