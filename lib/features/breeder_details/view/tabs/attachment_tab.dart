import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/breeder_details/cubit/breeder_details_cubit.dart';
import 'package:bunny_sync/features/breeder_details/models/attachment_model/attachment_model.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/router/router.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/utils/utils.dart';
import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
import 'package:bunny_sync/global/widgets/element_tile.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:bunny_sync/global/widgets/main_show_bottom_sheet.dart';
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:bunny_sync/global/widgets/texts/bordered_textual_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:path/path.dart' as path;
import 'package:skeletonizer/skeletonizer.dart';

abstract class AttachmentTabCallBacks {
  void onAddTap();

  void onAttachmentTap(AttachmentModel attachmentModel);

  void onEditAttachmentTap(AttachmentModel attachmentModel);

  void onDeleteAttachmentTap(AttachmentModel attachmentModel);

  void onTryAgainTap();

  Future<void> launchFile(String imageUrl);
}

class AttachmentTab extends StatefulWidget {
  const AttachmentTab({
    super.key,
    required this.breederId,
    this.controller,
  });

  final int breederId;
  final ScrollController? controller;

  @override
  State<AttachmentTab> createState() => _AttachmentTabState();
}

class _AttachmentTabState extends State<AttachmentTab>
    implements AttachmentTabCallBacks {
  late final BreederDetailsCubit breederDetailsCubit = context.read();

  @override
  void initState() {
    super.initState();
    breederDetailsCubit.getAttachments(widget.breederId);
  }

  @override
  void onAttachmentTap(AttachmentModel attachmentModel) {
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        title: 'attachment_options'.i18n,
        onEdit: onEditAttachmentTap,
        onDelete: onDeleteAttachmentTap,
        model: attachmentModel,
      ),
    );
  }

  @override
  void onDeleteAttachmentTap(AttachmentModel attachmentModel) {
    context.router.popForced();
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        title: 'are_you_sure_to_delete_attachment'.i18n,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {
                context.router.popForced();
                breederDetailsCubit.deleteAttachment(attachmentModel.id);
              },
              child: Text('yes'.i18n),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onEditAttachmentTap(AttachmentModel attachmentModel) {
    context.router.popForced();
    context.router.push(
      AddAttachmentRoute(
        breederDetailsCubit: breederDetailsCubit,
        breederId: widget.breederId,
        attachmentModel: attachmentModel,
      ),
    );
  }

  @override
  Future<void> launchFile(String url) async {
    Utils.openUrl(
      url,
      onError: () {
        MainSnackBar.showErrorMessageBar(
          context,
          'could_not_open_file'.i18n,
        );
      },
    );
  }

  @override
  void onTryAgainTap() {
    breederDetailsCubit.getAttachments(widget.breederId);
  }

  @override
  void onAddTap() {
    context.router.push(
      AddAttachmentRoute(
        breederDetailsCubit: breederDetailsCubit,
        breederId: widget.breederId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<BreederDetailsCubit, GeneralBreederDetailsState>(
        listener: (context, state) {
          if (state is DeleteBreederAttachmentSuccess) {
            MainSnackBar.showSuccessMessageBar(
              context,
              "attachment_deleted".i18n,
            );
            context.loaderOverlay.hide();
          } else if (state is DeleteBreederAttachmentFail) {
            MainSnackBar.showErrorMessageBar(context, state.message);
            context.loaderOverlay.hide();
          } else if (state is DeleteBreederAttachmentLoading) {
            context.loaderOverlay.show();
          }
        },
        buildWhen: (prev, curr) => curr is BreederAttachmentsState,
        builder: (context, state) {
          if (state is BreederAttachmentsFetch) {
            return Skeletonizer(
              enabled: state is BreederAttachmentsLoading,
              child: SingleChildScrollView(
                controller: widget.controller,
                child: Padding(
                  padding: AppConstants.padding16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.breederAttachments.length,
                        itemBuilder: (context, index) {
                          final item = state.breederAttachments[index];
                          return ElementTile(
                            model: item,
                            onTap: onAttachmentTap,
                            leading: Skeleton.shade(
                              child: BorderedTextualWidget(
                                text: (index + 1).toString(),
                              ),
                            ),
                            title: Text(
                              strutStyle: const StrutStyle(height: 1.6),
                              item.title,
                              style: context.tt.titleMedium?.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            type: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      '${"name".i18n} :${path.basename(item.url)}',
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  InkWell(
                                    onTap: () => launchFile(item.url),
                                    child: const Icon(Icons.open_in_browser),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 16,
                          );
                        },
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is BreederAttachmentsEmpty) {
            return MainErrorWidget(error: state.message);
          } else if (state is BreederAttachmentsFail) {
            return MainErrorWidget(
              error: state.message,
              onTap: onTryAgainTap,
            );
          } else {
            return const SizedBox.shrink();
          }
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
