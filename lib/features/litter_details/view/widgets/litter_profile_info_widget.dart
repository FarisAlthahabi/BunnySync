import 'package:bunny_sync/features/litters/models/litter_entry_model/litter_entry_model.dart';
import 'package:bunny_sync/global/gen/assets.gen.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/enums/gender_types_enum.dart';
import 'package:bunny_sync/global/widgets/breeder_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LitterProfileInfoWidget extends StatelessWidget {
  const LitterProfileInfoWidget({
    super.key,
    required this.litter,
    this.paddingTop,
  });

  final LitterEntryModel litter;
  final double? paddingTop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop ?? 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            flex: 5,
            child: SizedBox(),
          ),
          Column(
            children: [
              const Skeleton.shade(
                child: BreederImageWidget(
                  gender: GenderTypes.male,
                  size: 50,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                litter.buck,
                style: context.tt.titleSmall
                    ?.copyWith(fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 6),
              Text(
                '${'id'.i18n}: ${litter.id} | ${'prefix'.i18n}: ${litter.prefix}',
                style: context.tt.bodyMedium,
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Skeleton.shade(
                child: Assets.icons.family.svg(),
              ),
            ],
          ),
          Column(
            children: [
              const Skeleton.shade(
                child: BreederImageWidget(
                  gender: GenderTypes.female,
                  size: 50,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                litter.doe,
                style: context.tt.titleSmall
                    ?.copyWith(fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 6),
              Text(
                '${'id'.i18n}: ${litter.id} | ${'prefix'.i18n}: ${litter.prefix}',
                style: context.tt.bodyMedium,
              ),
            ],
          ),
          const Expanded(
            flex: 5,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
