import 'package:bunny_sync/features/breeder_details/view/widgets/show_kits_button.dart';
import 'package:bunny_sync/features/litter_details/view/widgets/litter_profile_info_widget.dart';
import 'package:bunny_sync/features/litters/cubit/litters_cubit.dart';
import 'package:bunny_sync/features/litters/models/litter_entry_model/litter_entry_model.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/animation/animated_switchers/animated_switchers.dart';
import 'package:bunny_sync/global/widgets/element_tile.dart';
import 'package:bunny_sync/global/widgets/loading_indicator.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:bunny_sync/global/widgets/main_tile.dart';
import 'package:bunny_sync/global/widgets/texts/bordered_textual_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BreederLitterTile extends StatefulWidget {
  const BreederLitterTile({
    super.key,
    required this.litter,
    required this.onTap,
    required this.index,
    required this.onMoreOptionsTap,
  });

  final LitterEntryModel litter;
  final ValueSetter<LitterEntryModel> onTap;
  final ValueChanged<LitterEntryModel> onMoreOptionsTap;
  final int index;

  @override
  State<BreederLitterTile> createState() => _BreederLitterTileState();
}

class _BreederLitterTileState extends State<BreederLitterTile> {
  late final LittersCubit littersCubit = context.read();
  void getKits(bool isShowKits) {
    if (isShowKits) {
      littersCubit.getKits(widget.litter.id);
    }
  }

  void onTryAgainTap() {
    littersCubit.getKits(widget.litter.id);
  }

  @override
  Widget build(BuildContext context) {
    final live = 'Live : ${widget.litter.live}          ';
    final dead = 'Died : ${widget.litter.dead}          ';
    final sold =
        'Sold : ${widget.litter.sold == '-' ? '0' : widget.litter.sold}';
    return MainTile(
      padding: AppConstants.paddingSB16,
      onTap: () => widget.onTap(widget.litter),
      child: Column(
        children: [
          Stack(
            children: [
              PositionedDirectional(
                top: 30,
                child: Skeleton.shade(
                  child: BorderedTextualWidget(
                    text: (widget.index + 1).toString(),
                  ),
                ),
              ),
              Padding(
                padding: AppConstants.paddingTE16,
                child: LitterProfileInfoWidget(
                  litter: widget.litter,
                ),
              ),
              PositionedDirectional(
                top: 0,
                end: 0,
                child: TextButton(
                  onPressed: () => widget.onMoreOptionsTap(widget.litter),
                  style: TextButton.styleFrom(
                    padding: AppConstants.padding4,
                    minimumSize: Size.zero,
                  ),
                  child: const Icon(Icons.more_vert_rounded),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Row(
                  children: [
                    Spacer(
                      flex: 15,
                    ),
                    Expanded(
                      flex: 70,
                      child: Skeleton.shade(child: Divider()),
                    ),
                    Spacer(
                      flex: 15,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Column(
                  children: [
                    ElementTile(
                      leading: ShowKitsButton(
                        onShowKitsTab: getKits,
                      ),
                      title: Text(
                        strutStyle: const StrutStyle(height: 1.6),
                        'Litter id : ${widget.litter.litterId}',
                        style: context.tt.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      tag: 'Age : ${widget.litter.age}',
                      type: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text('Kits : ${widget.litter.kits}'),
                      ),
                      note: live + dead + sold,
                      boxShadow: const [],
                    ),
                    BlocBuilder<LittersCubit, GeneralLittersState>(
                      buildWhen: (previous, current) => current is ShowKitsState,
                      builder: (context, state) {
                        if (state is ShowKitsSuccessState && state.showKits) {
                          return BlocBuilder<LittersCubit, GeneralLittersState>(
                            buildWhen: (previous, current) => current is KitsState,
                            builder: (context, innerState) {
                              Widget child;
                              if (innerState is KitsLoading) {
                                child = LoadingIndicator(
                                  color: context.cs.primary,
                                );
                              } else if (innerState is KitsSuccess) {
                                child = ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: innerState.kits.length,
                                  itemBuilder: (context, index) {
                                    final item = innerState.kits[index];
                                    return ElementTile(
                                      leading: BorderedTextualWidget(
                                        text: (index + 1).toString(),
                                      ),
                                      title: Text(item.code),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const Divider();
                                  },
                                );
                              } else if (innerState is KitsEmpty) {
                                child = MainErrorWidget(
                                  error: innerState.message,
                                );
                              } else if (innerState is KitsFail) {
                                child = MainErrorWidget(
                                  error: innerState.message,
                                  onTap: onTryAgainTap,
                                );
                              } else {
                                child = const SizedBox.shrink();
                              }
                              return AnimatedSwitcherWithSize(child: child);
                            },
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
