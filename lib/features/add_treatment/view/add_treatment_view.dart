import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/add_treatment/cubit/add_treatment_cubit.dart';
import 'package:bunny_sync/features/add_treatment/model/dosage_per_types/dosage_per_types.dart';
import 'package:bunny_sync/features/add_treatment/model/dosage_types/dosage_types.dart';
import 'package:bunny_sync/features/add_treatment/model/period_types/period_types.dart';
import 'package:bunny_sync/features/breeders/cubit/breeders_cubit.dart';
import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';
import 'package:bunny_sync/features/health/cubit/health_cubit.dart';
import 'package:bunny_sync/features/health/model/ailment_model/ailment_model.dart';
import 'package:bunny_sync/features/health/model/treatment_model/treatment_model.dart';
import 'package:bunny_sync/features/litter_details/cubit/litter_details_cubit.dart';
import 'package:bunny_sync/features/litter_details/model/kit_model/kit_model.dart';
import 'package:bunny_sync/features/litters/cubit/litters_cubit.dart';
import 'package:bunny_sync/features/litters/models/litter_entry_model/litter_entry_model.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:bunny_sync/global/mixins/mixins.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/utils/enums/rabbit_types.dart';
import 'package:bunny_sync/global/widgets/animation/animated_switchers/animated_switchers.dart';
import 'package:bunny_sync/global/widgets/buttons/main_action_button.dart';
import 'package:bunny_sync/global/widgets/loading_indicator.dart';
import 'package:bunny_sync/global/widgets/main_app_bar.dart';
import 'package:bunny_sync/global/widgets/main_date_picker.dart';
import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:bunny_sync/global/widgets/main_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AddTreatmentViewCallBacks {
  void onTypeSelected(RabbitTypes? type);

  void onBreederSelected(BreederEntryModel? breeder);

  void onLitterSelected(LitterEntryModel? litter);

  void onKitSelected(KitModel? kit);

  void onAilmentSelected(AilmentModel? ailments);

  void onTitleChanged(String title);

  void onTitleSubmitted(String title);

  void onDateSelected(DateTime startDate, List<int> numbers);

  void onMedicationChanged(String medication);

  void onMedicationSubmitted(String medication);

  void onMethodChanged(String method);

  void onMethodSubmitted(String method);

  void onTypeChanged(String type);

  void onTypeSubmitted(String type);

  void onDosageCountChanged(String dosageCount);

  void onDosageCountSubmitted(String dosageCount);

  void onDosageTypeSelected(DosageTypes? dosageType);

  void onDosageCountPerChanged(String dosageCountPer);

  void onDosageCountPerSubmitted(String dosageCountPer);

  void onDosageTypePerSelected(DosagePerTypes? dosageTypePer);

  void onScheduleCountChanged(String scheduleCount);

  void onScheduleCountSubmitted(String scheduleCount);

  void onScheduleTypeSelected(PeriodTypes? scheduleType);

  void onWithDrawalCountChanged(String withDrawalCount);

  void onWithDrawalCountSubmitted(String withDrawalCount);

  void onWithDrawalTypeSelected(PeriodTypes? withDrawalType);

  void onNoteChanged(String note);

  void onNoteSubmitted(String note);

  void onSave();
}

@RoutePage()
class AddTreatmentView extends StatelessWidget {
  const AddTreatmentView({
    super.key,
    required this.healthCubit,
    this.treatmentModel,
  });

  final HealthCubit healthCubit;
  final TreatmentModel? treatmentModel;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: healthCubit,
        ),
        BlocProvider(
          create: (context) => get<AddTreatmentCubit>(),
        ),
        BlocProvider(
          create: (context) => get<BreedersCubit>(),
        ),
        BlocProvider(
          create: (context) => get<LittersCubit>(),
        ),
        BlocProvider(
          create: (context) => get<LitterDetailsCubit>(),
        ),
      ],
      child: AddTreatmentPage(
        treatmentModel: treatmentModel,
      ),
    );
  }
}

class AddTreatmentPage extends StatefulWidget {
  const AddTreatmentPage({
    super.key,
    this.treatmentModel,
  });

  final TreatmentModel? treatmentModel;

  @override
  State<AddTreatmentPage> createState() => _AddTreatmentPageState();
}

class _AddTreatmentPageState extends State<AddTreatmentPage>
    with PostFrameMixin
    implements AddTreatmentViewCallBacks {
  late final HealthCubit healthCubit = context.read();

  late final BreedersCubit breedersCubit = context.read();

  late final LittersCubit littersCubit = context.read();

  late final LitterDetailsCubit litterDetailsCubit = context.read();

  late final AddTreatmentCubit addTreatmentCubit = context.read();

  final titleFocusNode = FocusNode();

  final medicationFocusNode = FocusNode();

  final methodFocusNode = FocusNode();

  final typeFocusNode = FocusNode();

  final dosageCountFocusNode = FocusNode();

  final dosageCountPerFocusNode = FocusNode();

  final scheduleCountFocusNode = FocusNode();

  final withDrawalCountFocusNode = FocusNode();

  final noteFocusNode = FocusNode();

  @override
  void dispose() {
    titleFocusNode.dispose();
    medicationFocusNode.dispose();
    methodFocusNode.dispose();
    typeFocusNode.dispose();
    dosageCountFocusNode.dispose();
    dosageCountPerFocusNode.dispose();
    scheduleCountFocusNode.dispose();
    withDrawalCountFocusNode.dispose();
    noteFocusNode.dispose();

    super.dispose();
  }

  @override
  void onBreederSelected(BreederEntryModel? breeder) {
    addTreatmentCubit.setBreederId(breeder?.id);
  }

  @override
  void onLitterSelected(LitterEntryModel? litter) {
    final litterModel = litter;
    if (litterModel != null) {
      addTreatmentCubit.setLitter(
        litterModel.id,
        onSuccess: () {
          litterDetailsCubit.getLitterDetails(
            litterModel.id,
          );
        },
      );
    }
  }

  @override
  void onKitSelected(KitModel? kit) {
    addTreatmentCubit.setKitId(kit?.id);
  }

  @override
  void onAilmentSelected(AilmentModel? ailment) {
    addTreatmentCubit.setAilmentId(ailment?.id);
  }

  @override
  void onDateSelected(DateTime startDate, List<int> numbers) {
    addTreatmentCubit.setStartDate(startDate);
  }

  @override
  void onDosageCountChanged(String dosageCount) {
    addTreatmentCubit.setDosageCount(dosageCount);
  }

  @override
  void onDosageCountPerChanged(String dosageCountPer) {
    addTreatmentCubit.setDosageCountPer(dosageCountPer);
  }

  @override
  void onDosageCountPerSubmitted(String dosageCountPer) {
    scheduleCountFocusNode.requestFocus();
  }

  @override
  void onDosageCountSubmitted(String dosageCount) {
    dosageCountPerFocusNode.requestFocus();
  }

  @override
  void onDosageTypePerSelected(DosagePerTypes? dosageTypePer) {
    addTreatmentCubit.setDosageTypePer(dosageTypePer);
  }

  @override
  void onDosageTypeSelected(DosageTypes? dosageType) {
    addTreatmentCubit.setDosageType(dosageType);
  }

  @override
  void onMedicationChanged(String medication) {
    addTreatmentCubit.setMedication(medication);
  }

  @override
  void onMedicationSubmitted(String medication) {
    methodFocusNode.requestFocus();
  }

  @override
  void onMethodChanged(String method) {
    addTreatmentCubit.setMethod(method);
  }

  @override
  void onMethodSubmitted(String method) {
    typeFocusNode.requestFocus();
  }

  @override
  void onNoteChanged(String note) {
    addTreatmentCubit.setNote(note);
  }

  @override
  void onNoteSubmitted(String note) {
    onSave();
  }

  @override
  void onScheduleCountChanged(String scheduleCount) {
    addTreatmentCubit.setScheduleCount(scheduleCount);
  }

  @override
  void onScheduleCountSubmitted(String scheduleCount) {
    withDrawalCountFocusNode.requestFocus();
  }

  @override
  void onScheduleTypeSelected(PeriodTypes? scheduleType) {
    addTreatmentCubit.setScheduleType(scheduleType);
  }

  @override
  void onTitleChanged(String title) {
    addTreatmentCubit.setTitle(title);
  }

  @override
  void onTitleSubmitted(String title) {
    medicationFocusNode.requestFocus();
  }

  @override
  void onTypeChanged(String type) {
    addTreatmentCubit.setType(type);
  }

  @override
  void onTypeSubmitted(String type) {
    dosageCountFocusNode.requestFocus();
  }

  @override
  void onWithDrawalCountChanged(String withDrawalCount) {
    addTreatmentCubit.setWithDrawalCount(withDrawalCount);
  }

  @override
  void onWithDrawalCountSubmitted(String withDrawalCount) {
    noteFocusNode.requestFocus();
  }

  @override
  void onWithDrawalTypeSelected(PeriodTypes? withDrawalType) {
    addTreatmentCubit.setWithDrawalType(withDrawalType);
  }

  @override
  void onTypeSelected(RabbitTypes? type) {
    addTreatmentCubit.setRabbitType(type);
  }

  @override
  void onSave() {
    final treatmentModel = widget.treatmentModel;
    if (treatmentModel != null) {
      addTreatmentCubit.updateTreatment(treatmentModel.id);
    } else {
      addTreatmentCubit.addTreatment();
    }
  }

  @override
  void onPostFrame() {
    final treatmentModel = widget.treatmentModel;
    if (treatmentModel != null) {
      if (treatmentModel.breederId != null) {
        addTreatmentCubit.setRabbitType(RabbitTypes.breeder);
        addTreatmentCubit.setBreederId(treatmentModel.breederId);
      } else if (treatmentModel.kitId != null) {
        addTreatmentCubit.setRabbitType(RabbitTypes.litter);
        addTreatmentCubit.setKitId(treatmentModel.kitId);
      }

      addTreatmentCubit.setAilmentId(treatmentModel.ailmentId);
      addTreatmentCubit.setTitle(treatmentModel.name);
      addTreatmentCubit.setStartDate(treatmentModel.startDate);
      addTreatmentCubit.setMedication(treatmentModel.medication);
      addTreatmentCubit.setMethod(treatmentModel.method);
      addTreatmentCubit.setType(treatmentModel.type);
      addTreatmentCubit.setDosageCount(treatmentModel.dosageCount.toString());
      addTreatmentCubit.setDosageType(treatmentModel.dosageType);
      addTreatmentCubit
          .setDosageCountPer(treatmentModel.dosageCountPer.toString());
      addTreatmentCubit.setDosageTypePer(treatmentModel.dosageTypePer);
      addTreatmentCubit
          .setScheduleCount(treatmentModel.scheduleCount.toString());
      addTreatmentCubit.setScheduleType(treatmentModel.scheduleType);
      addTreatmentCubit
          .setWithDrawalCount(treatmentModel.withDrawalCount.toString());
      addTreatmentCubit.setWithDrawalType(treatmentModel.withDrawalType);
      addTreatmentCubit.setNote(treatmentModel.note);
    } else {
      addTreatmentCubit.setStartDate(DateTime.now());
    }

    breedersCubit.getBreeders();
    littersCubit.getLitters();
    healthCubit.getAilments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: Text(
          widget.treatmentModel == null
              ? 'create_treatment'.i18n
              : 'update_treatment'.i18n,
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
                    Text(
                      'rabbit_type'.i18n,
                      style: context.tt.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: context.cs.surfaceContainerHighest,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    BlocBuilder<AddTreatmentCubit, GeneralAddTreatmentState>(
                      buildWhen: (previous, current) =>
                          current is ShowRabbitTypeState,
                      builder: (context, state) {
                        return MainDropDownWidget<RabbitTypes>(
                          items: RabbitTypes.values,
                          text: 'select_type'.i18n,
                          onChanged: onTypeSelected,
                          selectedValue: state is ShowRabbitTypeState
                              ? state.rabbitType
                              : null,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    BlocBuilder<AddTreatmentCubit, GeneralAddTreatmentState>(
                      buildWhen: (previous, current) =>
                          current is ShowRabbitTypeState,
                      builder: (context, state) {
                        if (state is ShowRabbitTypeState) {
                          if (state.rabbitType.isBreeder) {
                            return BlocBuilder<BreedersCubit,
                                GeneralBreedersState>(
                              builder: (context, state) {
                                if (state is BreedersLoading) {
                                  return Center(
                                    child: LoadingIndicator(
                                      color: context.cs.primary,
                                    ),
                                  );
                                } else if (state is BreedersSuccess) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'breeders'.i18n,
                                        style: context.tt.bodyLarge?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: context
                                              .cs.surfaceContainerHighest,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      MainDropDownWidget<BreederEntryModel>(
                                        items: state.breedersStatusModel.all,
                                        text: 'select_breeder'.i18n,
                                        onChanged: onBreederSelected,
                                        selectedValue: addTreatmentCubit
                                            .getSelectedBreeder(
                                          state.breedersStatusModel.all,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                    ],
                                  );
                                } else if (state is BreedersFail) {
                                  return MainErrorWidget(error: state.message);
                                } else {
                                  return const SizedBox.shrink();
                                }
                              },
                            );
                          } else if (state.rabbitType.isLitter) {
                            return BlocConsumer<LittersCubit,
                                GeneralLittersState>(
                              listener: (context, state) {
                                if (state is LittersSuccess) {
                                  final selectedLitter =
                                      addTreatmentCubit.getSelectedLitter(
                                    state.littersStatusModel.all,
                                  );

                                  if (selectedLitter != null) {
                                    addTreatmentCubit.setLitter(
                                      selectedLitter.id,
                                      onSuccess: () {
                                        litterDetailsCubit.getLitterDetails(
                                          selectedLitter.id,
                                        );
                                      },
                                    );
                                  }
                                }
                              },
                              builder: (context, state) {
                                if (state is LittersSuccess) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'litters'.i18n,
                                        style: context.tt.bodyLarge?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: context
                                              .cs.surfaceContainerHighest,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      MainDropDownWidget<LitterEntryModel>(
                                        items: state.littersStatusModel.all,
                                        text: 'select_litter'.i18n,
                                        onChanged: onLitterSelected,
                                        selectedValue:
                                            addTreatmentCubit.getSelectedLitter(
                                          state.littersStatusModel.all,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                    ],
                                  );
                                } else if (state is LittersLoading) {
                                  return LoadingIndicator(
                                    color: context.cs.primary,
                                  );
                                } else if (state is LittersFail) {
                                  return MainErrorWidget(error: state.message);
                                } else {
                                  return const SizedBox.shrink();
                                }
                              },
                            );
                          }
                        }

                        return const SizedBox();
                      },
                    ),
                    BlocBuilder<AddTreatmentCubit, GeneralAddTreatmentState>(
                      buildWhen: (previous, current) =>
                          current is ShowSelectKitState,
                      builder: (context, state) {
                        return state is ShowSelectKitState &&
                                state.showSelectKit
                            ? BlocBuilder<LitterDetailsCubit,
                                GeneralLitterDetailsState>(
                                builder: (context, innerState) {
                                  Widget child;
                                  if (innerState is LitterDetailsSuccess) {
                                    child = Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'kits'.i18n,
                                          style: context.tt.bodyLarge?.copyWith(
                                            fontWeight: FontWeight.w700,
                                            color: context
                                                .cs.surfaceContainerHighest,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        MainDropDownWidget<KitModel>(
                                          items: innerState
                                              .litterDetailsResponseModel
                                              .litter
                                              .kits,
                                          text: 'select_kit'.i18n,
                                          onChanged: onKitSelected,
                                          selectedValue:
                                              addTreatmentCubit.getSelectedKit(
                                            innerState
                                                .litterDetailsResponseModel
                                                .litter
                                                .kits,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 25,
                                        ),
                                      ],
                                    );
                                  } else if (innerState
                                      is LitterDetailsLoading) {
                                    child = LoadingIndicator(
                                      color: context.cs.primary,
                                    );
                                  } else if (innerState is LitterDetailsFail) {
                                    child = MainErrorWidget(
                                      error: innerState.message,
                                      onTap: () {
                                        final litterId = state.litterId;

                                        if (litterId != null) {
                                          litterDetailsCubit.getLitterDetails(
                                            litterId,
                                          );
                                        }
                                      },
                                    );
                                  } else {
                                    child = const SizedBox();
                                  }

                                  return AnimatedSwitcherWithSize(
                                    child: child,
                                  );
                                },
                              )
                            : const SizedBox();
                      },
                    ),
                    BlocBuilder<HealthCubit, GeneralHealthState>(
                      builder: (context, state) {
                        Widget child;
                        if (state is AilmentsLoading) {
                          child = Center(
                            child: LoadingIndicator(
                              color: context.cs.primary,
                            ),
                          );
                        } else if (state is AilmentsSuccess) {
                          child = Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ailments'.i18n,
                                style: context.tt.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: context.cs.surfaceContainerHighest,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              MainDropDownWidget<AilmentModel>(
                                items: state.ailments,
                                text: 'select_ailment'.i18n,
                                onChanged: onAilmentSelected,
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                            ],
                          );
                        } else if (state is AilmentsEmpty) {
                          child = MainErrorWidget(error: state.message);
                        } else if (state is AilmentsFail) {
                          child = MainErrorWidget(error: state.message);
                        } else {
                          child = const SizedBox.shrink();
                        }

                        return AnimatedSwitcherWithSize(
                          child: child,
                        );
                      },
                    ),
                    MainTextField(
                      initialValue: widget.treatmentModel?.name,
                      onSubmitted: onTitleSubmitted,
                      onChanged: onTitleChanged,
                      focusNode: titleFocusNode,
                      hintText: 'treatment'.i18n,
                      labelText: 'treatment'.i18n,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "date".i18n,
                      style: context.tt.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: context.cs.primaryFixed,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: MainDatePicker(
                        onChange: onDateSelected,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MainTextField(
                      initialValue: widget.treatmentModel?.medication,
                      onSubmitted: onMedicationSubmitted,
                      onChanged: onMedicationChanged,
                      focusNode: medicationFocusNode,
                      hintText: 'medication'.i18n,
                      labelText: 'medication'.i18n,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MainTextField(
                      initialValue: widget.treatmentModel?.method,
                      onSubmitted: onMethodSubmitted,
                      onChanged: onMethodChanged,
                      focusNode: methodFocusNode,
                      hintText: 'method'.i18n,
                      labelText: 'method'.i18n,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MainTextField(
                      initialValue: widget.treatmentModel?.type,
                      onSubmitted: onTypeSubmitted,
                      onChanged: onTypeChanged,
                      focusNode: typeFocusNode,
                      hintText: 'type'.i18n,
                      labelText: 'type'.i18n,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: SizedBox(
                            child: MainTextField(
                              initialValue:
                                  widget.treatmentModel?.dosageCount.toString(),
                              onSubmitted: onDosageCountSubmitted,
                              onChanged: onDosageCountChanged,
                              focusNode: dosageCountFocusNode,
                              hintText: 'dosageCount'.i18n,
                              labelText: 'dosageCount'.i18n,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'dosage'.i18n,
                                style: context.tt.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: context.cs.surfaceContainerHighest,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              MainDropDownWidget<DosageTypes>(
                                items: DosageTypes.values,
                                text: 'select_Dosage'.i18n,
                                onChanged: onDosageTypeSelected,
                                selectedValue:
                                    widget.treatmentModel?.dosageType,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: MainTextField(
                            initialValue:
                                widget.treatmentModel?.dosageCount.toString(),
                            onSubmitted: onDosageCountPerSubmitted,
                            onChanged: onDosageCountPerChanged,
                            focusNode: dosageCountPerFocusNode,
                            hintText: 'dosage_count_per'.i18n,
                            labelText: 'dosage_count_per'.i18n,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'dosage_type_per'.i18n,
                                style: context.tt.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: context.cs.surfaceContainerHighest,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              MainDropDownWidget<DosagePerTypes>(
                                items: DosagePerTypes.values,
                                text: 'select_dosage_type_per'.i18n,
                                onChanged: onDosageTypePerSelected,
                                selectedValue:
                                    widget.treatmentModel?.dosageTypePer,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: MainTextField(
                            initialValue:
                                widget.treatmentModel?.scheduleCount.toString(),
                            onSubmitted: onScheduleCountSubmitted,
                            onChanged: onScheduleCountChanged,
                            focusNode: scheduleCountFocusNode,
                            hintText: 'schedule_count'.i18n,
                            labelText: 'schedule_count'.i18n,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'schedule'.i18n,
                                style: context.tt.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: context.cs.surfaceContainerHighest,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              MainDropDownWidget<PeriodTypes>(
                                items: PeriodTypes.values,
                                text: 'select_schedule'.i18n,
                                onChanged: onScheduleTypeSelected,
                                selectedValue:
                                    widget.treatmentModel?.scheduleType,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: MainTextField(
                            initialValue: widget.treatmentModel?.withDrawalCount
                                .toString(),
                            onSubmitted: onWithDrawalCountSubmitted,
                            onChanged: onWithDrawalCountChanged,
                            focusNode: withDrawalCountFocusNode,
                            hintText: 'with_drawal_count'.i18n,
                            labelText: 'with_drawal_count'.i18n,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'with_drawal'.i18n,
                                style: context.tt.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: context.cs.surfaceContainerHighest,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              MainDropDownWidget<PeriodTypes>(
                                items: PeriodTypes.values,
                                text: 'select_with_drawal'.i18n,
                                onChanged: onWithDrawalTypeSelected,
                                selectedValue:
                                    widget.treatmentModel?.withDrawalType,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MainTextField(
                      initialValue: widget.treatmentModel?.note,
                      onSubmitted: onNoteSubmitted,
                      onChanged: onNoteChanged,
                      focusNode: noteFocusNode,
                      hintText: 'note'.i18n,
                      labelText: 'note'.i18n,
                      maxLines: 4,
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
                    child: BlocConsumer<AddTreatmentCubit,
                        GeneralAddTreatmentState>(
                      listener: (context, state) {
                        if (state is AddTreatmentSuccess) {
                          MainSnackBar.showSuccessMessageBar(
                            context,
                            "treatment_added".i18n,
                          );
                          context.router.maybePop();
                          healthCubit.addTreatment(
                            state.treatment,
                          );
                        } else if (state is UpdateTreatmentSuccess) {
                          MainSnackBar.showSuccessMessageBar(
                            context,
                            "treatment_updated".i18n,
                          );
                          context.router.maybePop();
                          healthCubit.updateTreatment(
                            state.treatment,
                          );
                        } else if (state is AddTreatmentFail) {
                          MainSnackBar.showErrorMessageBar(
                            context,
                            state.message,
                          );
                        }
                      },
                      builder: (context, state) {
                        var onTap = onSave;
                        Widget? child;
                        if (state is AddTreatmentLoading) {
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
