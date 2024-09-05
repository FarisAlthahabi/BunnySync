import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/add_kit/cubit/add_kit_cubit.dart';
import 'package:bunny_sync/features/litter_details/model/kit_model/kit_model.dart';
import 'package:bunny_sync/global/blocs/kits_cubit/kits_cubit.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/mixins/mixins.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/utils/enums/gender_types_enum.dart';
import 'package:bunny_sync/global/widgets/buttons/main_action_button.dart';
import 'package:bunny_sync/global/widgets/loading_indicator.dart';
import 'package:bunny_sync/global/widgets/main_app_bar.dart';
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:bunny_sync/global/widgets/main_text_field.dart';
import 'package:bunny_sync/global/widgets/radio_selector_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AddKitViewCallbacks {
  void onTattoChanged(String tattoo);

  void onTattoSubmitted(String tattoo);

  void onPrefixChanged(String prefix);

  void onPrefixSubmitted(String prefix);

  void onNameChanged(String name);

  void onNameSubmitted(String name);

  void onColorChanged(String color);

  void onColorSubmitted(String color);

  void onBreedChanged(String breed);

  void onBreedSubmitted(String breed);

  void onCageChanged(String cage);

  void onCageSubmitted(String cage);

  void onGenderSelected(GenderTypes? gender);

  void onNoteChanged(String note);

  void onNoteSubmitted(String note);

  void onSave();
}

@RoutePage()
class AddKitView extends StatelessWidget {
  const AddKitView({
    super.key,
    required this.litterId,
    this.kitModel,
  });

  final int litterId;
  final KitModel? kitModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get<AddKitCubit>(),
      child: AddKitPage(
        litterId: litterId,
        kitModel: kitModel,
      ),
    );
  }
}

class AddKitPage extends StatefulWidget {
  const AddKitPage({
    super.key,
    required this.litterId,
    this.kitModel,
  });

  final int litterId;
  final KitModel? kitModel;

  @override
  State<AddKitPage> createState() => _AddKitPageState();
}

class _AddKitPageState extends State<AddKitPage>
    with PostFrameMixin
    implements AddKitViewCallbacks {
  late final KitsCubit kitsCubit = context.read();

  late final AddKitCubit addKitCubit = context.read();

  late final FocusNode tattooFocusNode = FocusNode();

  late final FocusNode prefixFocusNode = FocusNode();

  late final FocusNode nameFocusNode = FocusNode();

  late final FocusNode colorFocusNode = FocusNode();

  late final FocusNode breedFocusNode = FocusNode();

  late final FocusNode cageFocusNode = FocusNode();

  late final FocusNode noteFocusNode = FocusNode();

  @override
  void dispose() {
    tattooFocusNode.dispose();
    prefixFocusNode.dispose();
    nameFocusNode.dispose();
    colorFocusNode.dispose();
    breedFocusNode.dispose();
    cageFocusNode.dispose();
    noteFocusNode.dispose();

    super.dispose();
  }

  @override
  void onTattoChanged(String tattoo) {
    addKitCubit.setTatto(tattoo);
  }

  @override
  void onTattoSubmitted(String tattoo) {
    addKitCubit.setTatto(tattoo);
  }

  @override
  void onPrefixChanged(String prefix) {
    addKitCubit.setPrefix(prefix);
  }

  @override
  void onPrefixSubmitted(String prefix) {
    addKitCubit.setPrefix(prefix);
  }

  @override
  void onNameChanged(String name) {
    addKitCubit.setName(name);
  }

  @override
  void onNameSubmitted(String name) {
    addKitCubit.setName(name);
  }

  @override
  void onColorChanged(String color) {
    addKitCubit.setColor(color);
  }

  @override
  void onColorSubmitted(String color) {
    addKitCubit.setColor(color);
  }

  @override
  void onBreedChanged(String breed) {
    addKitCubit.setBreed(breed);
  }

  @override
  void onBreedSubmitted(String breed) {
    addKitCubit.setBreed(breed);
  }

  @override
  void onCageChanged(String cage) {
    addKitCubit.setCage(cage);
  }

  @override
  void onCageSubmitted(String cage) {
    addKitCubit.setCage(cage);
  }

  @override
  void onGenderSelected(GenderTypes? gender) {
    addKitCubit.setGender(gender);
  }

  @override
  void onNoteChanged(String note) {
    addKitCubit.setNote(note);
  }

  @override
  void onNoteSubmitted(String note) {
    addKitCubit.setNote(note);
  }

  @override
  void onSave() {
    final kit = widget.kitModel;
    if (kit != null) {
      addKitCubit.updateKit(litterId: widget.litterId, kitId: kit.id);
    } else {
      addKitCubit.addKit(widget.litterId);
    }
  }

  @override
  void onPostFrame() {
    if (widget.kitModel != null) {
      addKitCubit.setKitModel(widget.kitModel!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: Text(
          widget.kitModel != null ? "update_kit".i18n : "add_kit".i18n,
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
                      // initialValue: widget.kitModel?.tatto,
                      onSubmitted: onTattoSubmitted,
                      onChanged: onTattoChanged,
                      focusNode: tattooFocusNode,
                      hintText: "tatto".i18n,
                      labelText: "tatto".i18n,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MainTextField(
                      initialValue: widget.kitModel?.prefix,
                      onSubmitted: onPrefixSubmitted,
                      onChanged: onPrefixChanged,
                      focusNode: prefixFocusNode,
                      hintText: "prefix".i18n,
                      labelText: "prefix".i18n,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MainTextField(
                      initialValue: widget.kitModel?.kitName,
                      onSubmitted: onNameSubmitted,
                      onChanged: onNameChanged,
                      focusNode: nameFocusNode,
                      hintText: "name".i18n,
                      labelText: "name".i18n,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MainTextField(
                      initialValue: widget.kitModel?.color,
                      onSubmitted: onColorSubmitted,
                      onChanged: onColorChanged,
                      focusNode: colorFocusNode,
                      hintText: "color".i18n,
                      labelText: "color".i18n,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MainTextField(
                      initialValue: widget.kitModel?.breed,
                      onSubmitted: onBreedSubmitted,
                      onChanged: onBreedChanged,
                      focusNode: breedFocusNode,
                      hintText: "breed".i18n,
                      labelText: "breed".i18n,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MainTextField(
                      initialValue: widget.kitModel?.cage,
                      onSubmitted: onCageSubmitted,
                      onChanged: onCageChanged,
                      focusNode: cageFocusNode,
                      hintText: "cage".i18n,
                      labelText: "cage".i18n,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: AppConstants.paddingH5,
                          child: Text(
                            "gender".i18n,
                            style: context.tt.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: context.cs.primaryFixed,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        RadioSelectorWidget<GenderTypes>(
                          items: GenderTypes.values,
                          selected: widget.kitModel?.gender,
                          onSelected: onGenderSelected,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MainTextField(
                      initialValue: widget.kitModel?.note,
                      onSubmitted: onNoteSubmitted,
                      onChanged: onNoteChanged,
                      focusNode: noteFocusNode,
                      hintText: "note".i18n,
                      labelText: "note".i18n,
                      maxLines: 5,
                    ),
                    const SizedBox(
                      height: 100,
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
                    child: BlocConsumer<AddKitCubit, GeneralAddKitState>(
                      listener: (context, state) {
                        if (state is AddKitSuccess) {
                          MainSnackBar.showSuccessMessageBar(
                            context,
                            "kit_added".i18n,
                          );
                          context.router.maybePop();
                          kitsCubit.addKit(state.kit, widget.litterId);
                        } else if (state is UpdateKitSuccess) {
                          MainSnackBar.showSuccessMessageBar(
                            context,
                            "kit_updated".i18n,
                          );
                          context.router.maybePop();
                          kitsCubit.updateKit(state.kit);
                        } else if (state is AddKitError) {
                          MainSnackBar.showErrorMessageBar(
                            context,
                            state.error,
                          );
                        }
                      },
                      builder: (context, state) {
                        var onTap = onSave;
                        Widget? child;
                        if (state is AddKitLoading) {
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
