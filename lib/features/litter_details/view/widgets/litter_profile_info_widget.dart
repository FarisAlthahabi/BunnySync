import 'package:bunny_sync/features/litters/models/litter_model.dart';
import 'package:bunny_sync/global/gen/assets.gen.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/widgets/breeder_image_widget.dart';
import 'package:flutter/material.dart';

class LitterProfileInfoWidget extends StatelessWidget {
  const LitterProfileInfoWidget({
    super.key,
    required this.litter,
    this.paddingTop,
  });

  final LitterModel litter;
  final double? paddingTop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop ?? 0 ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            flex: 5,
            child: SizedBox(),
          ),
          Column(
            children: [
              BreederImageWidget(
                image: litter.parents[0].image,
                maleOrFemale: true,
                size: 50,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                litter.parents[0].name,
                style: context.tt.titleSmall
                    ?.copyWith(fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 6),
              Text(
                '${'id'.i18n}: ${litter.parents[0].id} | ${'prefix'.i18n}: ${litter.parents[0].prefix}',
                style: context.tt.bodyMedium,
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Assets.icons.genders.svg(),
            ],
          ),
          Column(
            children: [
              BreederImageWidget(
                image: litter.parents[0].image,
                maleOrFemale: false,
                size: 50,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                litter.parents[0].name,
                style: context.tt.titleSmall
                    ?.copyWith(fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 6),
              Text(
                '${'id'.i18n}: ${litter.parents[0].id} | ${'prefix'.i18n}: ${litter.parents[0].prefix}',
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
