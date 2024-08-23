import 'package:bunny_sync/features/litter_details/view/widgets/litter_profile_info_widget.dart';
import 'package:bunny_sync/features/litters/cubit/litters_cubit.dart';
import 'package:bunny_sync/features/litters/models/litter_entry_model/litter_entry_model.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/animation/animated_switchers/animated_switchers.dart';
import 'package:bunny_sync/global/widgets/element_tile.dart';
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
  bool isShowKits = false;

  @override
  Widget build(BuildContext context) {
    final live = 'Live : ${widget.litter.live}          ';
    final dead = 'Died : ${widget.litter.dead}          ';
    final sold =
        'Sold : ${widget.litter.sold == '-' ? '0' : widget.litter.sold}';
    return MainTile(
      padding: AppConstants.paddingSB16,
      onTap: () => widget.onTap(widget.litter),
      onLongPress: () {
        setState(() {
          isShowKits = !isShowKits;
        });
      },
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
                      leading: InkWell(
                        onTap: () {
                          setState(() {
                            isShowKits = !isShowKits;
                          });
                        },
                        child: Skeleton.shade(
                          child: Container(
                            padding: AppConstants.padding3,
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.greyShade,
                                width: 1.5,
                              ),
                            ),
                            child: CircleAvatar(
                              backgroundColor: isShowKits
                                  ? AppColors.red
                                  : AppColors.greenShade,
                              child: Icon(
                                isShowKits ? Icons.remove : Icons.add,
                                color: context.cs.onSecondary,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
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
                    AnimatedSwitcherWithSize(
                      child: isShowKits
                          ? widget.litter.kits == 0
                              ? Center(child: Text("kits_empty".i18n))
                              : ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: widget.litter.allKits.length,
                                  itemBuilder: (context, index) {
                                    final item = widget.litter.allKits[index];
                                    final kitCode =
                                        '${"code".i18n} :  ${item.code}';
                                    final kitName =
                                        '${"name".i18n} :  ${item.kitName ?? '-'}';
                                    final kitColor =
                                        '${"color".i18n} : ${item.color ?? '-'}';
                                    final kitGender =
                                        '${"gender".i18n} : ${item.gender?.displayName ?? '-'}';
                                    final kitWeight =
                                        '${"weight".i18n} : ${item.status?.weight ?? '-'}';
                                    return ElementTile(
                                      leading: BorderedTextualWidget(
                                        text: (index + 1).toString(),
                                      ),
                                      title: Text(kitCode),
                                      type: Padding(
                                        padding: AppConstants.paddingT10,
                                        child: Text(
                                          kitName,
                                        ),
                                      ),
                                      createdAt: kitWeight,
                                      tag: kitColor,
                                      secondaryTag: kitGender,
                                      boxShadow: const [],
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return Divider(
                                      thickness: 1,
                                      color: context.cs.tertiaryContainer,
                                      indent: 12,
                                      endIndent: 12,
                                    );
                                  },
                                )
                          : null,
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
