import 'package:bunny_sync/features/breeder_details/cubit/breeder_details_cubit.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/images/app_image_widget.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class ImagesTabCallbacks {
  void onTryAgainTap();
}

class ImagesTab extends StatefulWidget {
  const ImagesTab({
    super.key,
    required this.breederId,
    this.controller,
  });

  final int breederId;
  final ScrollController? controller;

  @override
  State<ImagesTab> createState() => _ImagesTabState();
}

class _ImagesTabState extends State<ImagesTab> implements ImagesTabCallbacks {
  late final BreederDetailsCubit breederDetailsCubit = context.read();

  @override
  void initState() {
    super.initState();

    breederDetailsCubit.getBreederImages(widget.breederId);
  }

  @override
  void onTryAgainTap() {
    breederDetailsCubit.getBreederImages(widget.breederId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BreederDetailsCubit, GeneralBreederDetailsState>(
      buildWhen: (prev, curr) => curr is BreederImagesState,
      builder: (context, state) {
        if (state is BreederImagesFetch) {
          return Skeletonizer(
            enabled: state is BreederImagesLoading,
            child: Padding(
              padding: AppConstants.padding40,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: context.cs.onInverseSurface,
                  ),
                ),
                child: ListView.separated(
                  controller: widget.controller,
                  shrinkWrap: true,
                  itemCount: state.breederImages.length,
                  itemBuilder: (context, index) {
                    return AppImageWidget(url: state.breederImages[index].imageUrl);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 25,
                    );
                  },
                ),
              ),
            ),
          );
        } else if (state is BreederImagesEmpty) {
          return Center(
            child: Text(
              state.message,
              style: context.tt.bodyLarge,
            ),
          );
        } else if (state is BreederImagesFail) {
          return MainErrorWidget(
            error: state.message,
            onTap: onTryAgainTap,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
