import 'package:bunny_sync/features/litters/cubit/litters_cubit.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ShowKitsButton extends StatefulWidget {
  const ShowKitsButton({
    super.key,
    required this.onShowKitsTab,
  });

  final ValueSetter<bool> onShowKitsTab;

  @override
  State<ShowKitsButton> createState() => _ShowKitsButtonState();
}

class _ShowKitsButtonState extends State<ShowKitsButton> {
  late final LittersCubit littersCubit = context.read();
  late bool isShowKits = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isShowKits = !isShowKits;
          
        });
        littersCubit.emitShowKits(
            // widget.litter.id,
            isShowKits,
          );
        widget.onShowKitsTab(isShowKits);
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
            backgroundColor: isShowKits ? AppColors.red : AppColors.greenShade,
            child: Icon(
              isShowKits ? Icons.remove : Icons.add,
              color: context.cs.onSecondary,
              size: 16,
            ),
          ),
        ),
      ),
    );
  }
}
