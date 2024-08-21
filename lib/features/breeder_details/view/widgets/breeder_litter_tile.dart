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
      littersCubit.emitShowKits(
        widget.litter.id,
        isShowKits,
      );
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
                BlocBuilder<LittersCubit, GeneralLittersState>(
                  builder: (context, state) {
                    Widget child;
                    if (state is KitsLoading) {
                      child = LoadingIndicator(
                        color: context.cs.primary,
                      );
                    } else if (state is KitsSuccess && state is ShowKitsState) {
                      child = Column(
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
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.kits.length,
                            itemBuilder: (context, index) {
                              final item = state.kits[index];
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
                          ),
                        ],
                      );
                    } else if (state is KitsEmpty) {
                      child = MainErrorWidget(error: state.message);
                    } else if (state is KitsFail) {
                      child = MainErrorWidget(
                        error: state.message,
                        onTap: onTryAgainTap,
                      );
                    } else {
                      child = ElementTile(
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
                      );
                    }
                    return AnimatedSwitcherWithSize(child: child);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
