import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/add_attachment/cubit/add_attachment_cubit.dart';
import 'package:bunny_sync/features/breeder_details/cubit/breeder_details_cubit.dart';
import 'package:bunny_sync/features/breeder_details/models/attachment_model/attachment_model.dart';
import 'package:bunny_sync/global/blocs/upload_file_cubit/upload_file_cubit.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/buttons/main_action_button.dart';
import 'package:bunny_sync/global/widgets/loading_indicator.dart';
import 'package:bunny_sync/global/widgets/main_app_bar.dart';
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:bunny_sync/global/widgets/main_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AddAttachmentViewCallBack {
  void onTitleChanged(String title);

  void onTitleSubmitted(String title);

  Future<void> onFilePicked();

  void onSave();
}

@RoutePage()
class AddAttachmentView extends StatelessWidget {
  const AddAttachmentView({
    super.key,
    required this.breederId,
    required this.breederDetailsCubit,
    this.attachmentModel,
  });

  final int breederId;
  final BreederDetailsCubit breederDetailsCubit;
  final AttachmentModel? attachmentModel;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: breederDetailsCubit,
        ),
        BlocProvider(
          create: (context) => get<AddAttachmentCubit>(),
        ),
        BlocProvider(
          create: (context) => get<UploadFileCubit>(),
        ),
      ],
      child: AddAttachmentPage(
        breederId: breederId,
        attachmentModel: attachmentModel,
      ),
    );
  }
}

class AddAttachmentPage extends StatefulWidget {
  const AddAttachmentPage({
    super.key,
    required this.breederId,
    this.attachmentModel,
  });

  final int breederId;
  final AttachmentModel? attachmentModel;

  @override
  State<AddAttachmentPage> createState() => _AddAttachmentPageState();
}

class _AddAttachmentPageState extends State<AddAttachmentPage>
    implements AddAttachmentViewCallBack {
  late final AddAttachmentCubit addAttachmentCubit = context.read();

  late final BreederDetailsCubit breederDetailsCubit = context.read();

  late final UploadFileCubit uploadFileCubit = context.read();

  final titleFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    final attachment = widget.attachmentModel;
    if (attachment != null) {
      addAttachmentCubit.setTitle(attachment.title);
      addAttachmentCubit.setFile(attachment.path);
    }
  }

  @override
  void dispose() {
    super.dispose();
    titleFocusNode.dispose();
  }

  @override
  void onTitleChanged(String title) {
    addAttachmentCubit.setTitle(title);
  }

  @override
  void onTitleSubmitted(String title) {
    titleFocusNode.unfocus();
  }

  @override
  Future<void> onFilePicked() async {
    uploadFileCubit.uploadFile();
  }

  @override
  void onSave() {
    addAttachmentCubit.addAttachment(widget.breederId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: Text(
          'create_attachment'.i18n,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: AppConstants.paddingH16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    MainTextField(
                      initialValue: widget.attachmentModel?.title,
                      onSubmitted: onTitleSubmitted,
                      onChanged: onTitleChanged,
                      focusNode: titleFocusNode,
                      hintText: "title".i18n,
                      labelText: "title".i18n,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: onFilePicked,
                      child: Container(
                        padding: AppConstants.padding16,
                        decoration: BoxDecoration(
                          border: Border.all(color: context.cs.onSurface),
                          borderRadius: AppConstants.borderRadius12,
                        ),
                        child: BlocConsumer<UploadFileCubit,
                            GeneralUploadFileState>(
                          listener: (context, state) {
                            if (state is UploadFileSuccess) {
                              addAttachmentCubit.setFile(state.filePath);
                            } else if (state is UploadFileFail) {
                              MainSnackBar.showErrorMessageBar(
                                context,
                                state.message,
                              );
                              addAttachmentCubit.setFile(null);
                            }
                          },
                          builder: (context, state) {
                            String? filePath;
                            String? title;
                            if (state is UploadFileSuccess) {
                              filePath = state.fileName;
                            } else if (state is UploadFileFail) {
                              filePath = state.message;
                            } else {
                              title = 'choose_file'.i18n;
                              filePath = 'no_file_chosen'.i18n;
                            }
                            return Row(
                              children: [
                                if (title != null)
                                  Row(
                                    children: [
                                      Text(
                                        'choose_file'.i18n,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context).hintColor,
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                    ],
                                  ),
                                Expanded(
                                  child: Text(
                                    title == null
                                        ? 'chosen_file'.i18n + filePath
                                        : filePath,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: AppConstants.paddingH16,
                  child: SizedBox(
                    width: double.maxFinite,
                    child: BlocConsumer<AddAttachmentCubit,
                        GeneralAddAttachmentState>(
                      listener: (context, state) {
                        if (state is AddAttachmentSuccess) {
                          MainSnackBar.showSuccessMessageBar(
                            context,
                            "attachment_added".i18n,
                          );
                          context.router.maybePop();
                          breederDetailsCubit.addAttachment(
                            state.attachmentModel,
                          );
                        }
                        if (state is UpdateAttachmentSuccess) {
                          MainSnackBar.showSuccessMessageBar(
                            context,
                            "attachment_updated".i18n,
                          );
                          context.router.maybePop();
                          breederDetailsCubit.updateAttachment(
                            state.attachmentModel,
                          );
                        } else if (state is AddAttachmentFail) {
                          MainSnackBar.showErrorMessageBar(
                            context,
                            state.message,
                          );
                        }
                      },
                      builder: (context, state) {
                        var onTap = onSave;
                        Widget? child;
                        if (state is AddAttachmentLoading) {
                          onTap = () {};
                          child = const LoadingIndicator();
                        }
                        return MainActionButton(
                          onTap: onTap,
                          text: "save".i18n,
                          child: child,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
