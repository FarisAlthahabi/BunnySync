import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/breeder_details/cubit/breeder_details_cubit.dart';
import 'package:bunny_sync/features/breeder_details/models/breeder_image_model/breeder_image_model.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
import 'package:bunny_sync/global/widgets/images/app_image_widget.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:bunny_sync/global/widgets/main_show_bottom_sheet.dart';
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class ImagesTabCallbacks {
  void onTryAgainTap();

  Future<void> onAddTap();

  void onImageTap(BreederImageModel breederImageModel);

  void onDeleteTap(BreederImageModel breederImageModel);

  Future<void> pickGalleryImage();

  Future<void> pickCameraImage();
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
  Future<void> pickCameraImage() async {
    context.router.popForced();
    final storageStatus = await Permission.storage.status;
    if (!storageStatus.isGranted) {
      await Permission.storage.request();
    }
    final XFile? image;
    if (storageStatus.isGranted) {
      final ImagePicker imagePicker = ImagePicker();
      image = await imagePicker.pickImage(source: ImageSource.camera);
      if (image != null) {
        breederDetailsCubit.addBreederImage(
          widget.breederId,
          image,
        );
      }
    }
  }

  @override
  Future<void> pickGalleryImage() async {
    context.router.popForced();
    final storageStatus = await Permission.storage.status;
    if (!storageStatus.isGranted) {
      await Permission.storage.request();
    }
    final XFile? image;
    if (storageStatus.isGranted) {
      final ImagePicker imagePicker = ImagePicker();
      image = await imagePicker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        breederDetailsCubit.addBreederImage(
          widget.breederId,
          image,
        );
      }
    }
  }

  @override
  Future<void> onAddTap() async {
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        title: 'choose_image_source'.i18n,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed:pickGalleryImage,
              child: Text('gallery'.i18n),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: pickCameraImage,
              child: Text('camera'.i18n),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onImageTap(BreederImageModel breederImageModel) {
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        title: 'image_options'.i18n,
        model: breederImageModel,
        onDelete: onDeleteTap,
      ),
    );
  }

  @override
  void onDeleteTap(BreederImageModel breederImageModel) {
    context.router.popForced();
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        title: 'are_you_sure_to_delete_image'.i18n,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {
                context.router.popForced();
                breederDetailsCubit.deleteBreederImage(
                  widget.breederId,
                  breederImageModel.id,
                );
              },
              child: Text('yes'.i18n),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<BreederDetailsCubit, GeneralBreederDetailsState>(
        listener: (context, state) {
          if (state is BreederImageAddSuccess) {
            MainSnackBar.showSuccessMessageBar(context, "image_added".i18n);
          } else if (state is BreederImageAddFail) {
            MainSnackBar.showErrorMessageBar(context, state.message);
          } else if (state is BreederImageDeleteSuccess) {
            MainSnackBar.showSuccessMessageBar(context, "image_deleted".i18n);
          } else if (state is BreederImageDeleteFail) {
            MainSnackBar.showErrorMessageBar(context, state.message);
          }
        },
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
                      return InkWell(
                        onTap: () => onImageTap(state.breederImages[index]),
                        child: AppImageWidget(
                          url: state.breederImages[index].imageUrl,
                        ),
                      );
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onAddTap,
        shape: RoundedRectangleBorder(
          borderRadius: AppConstants.circularBorderRadius,
        ),
        backgroundColor: context.cs.secondaryContainer,
        child: const Icon(Icons.add),
      ),
    );
  }
}
