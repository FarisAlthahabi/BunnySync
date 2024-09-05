import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/breeders/cubit/breeders_cubit.dart';
import 'package:bunny_sync/features/litter_details/model/breeder_pair_model/breeder_pair_model.dart';
import 'package:bunny_sync/features/litters/cubit/litters_cubit.dart';
import 'package:bunny_sync/features/litters/models/litter_entry_model/litter_entry_model.dart';
import 'package:bunny_sync/global/blocs/rabbit_concerns_cubit/rabbit_concerns_cubit.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/animation/animated_switchers/animated_switchers.dart';
import 'package:bunny_sync/global/widgets/buttons/main_action_button.dart';
import 'package:bunny_sync/global/widgets/loading_indicator.dart';
import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:bunny_sync/global/widgets/main_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SaveBirthViewCallBacks {
  void onBreederPairIdSelected(BreederPairModel? breederPairModel);

  void onLitterIdSelected(LitterEntryModel? litterEntryModel);

  void onLiveKitsCountChanged(String liveKitsCount);

  void onLiveKitsCountSubmitted(String liveKitsCount);

  void onDeadKitsCountChanged(String deadKitsCount);

  void onDeadKitsCountSubmitted(String deadKitsCount);

  void onSave();
}

class SaveBirthView extends StatelessWidget {
  const SaveBirthView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => get<LittersCubit>(),
        ),
        BlocProvider(
          create: (context) => get<BreedersCubit>(),
        ),
      ],
      child: const SaveBirthPage(),
    );
  }
}

class SaveBirthPage extends StatefulWidget {
  const SaveBirthPage({super.key});

  @override
  State<SaveBirthPage> createState() => _SaveBirthPageState();
}

class _SaveBirthPageState extends State<SaveBirthPage>
    implements SaveBirthViewCallBacks {
  late final RabbitConcernsCubit rabbitConcernsCubit = context.read();

  late final LittersCubit littersCubit = context.read();

  late final BreedersCubit breedersCubit = context.read();

  final FocusNode liveKitsCountFocusNode = FocusNode();
  final FocusNode deadKitsCountFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    breedersCubit.getBreederPairs();
    littersCubit.getLitters();
  }

  @override
  void dispose() {
    liveKitsCountFocusNode.dispose();
    deadKitsCountFocusNode.dispose();
    super.dispose();
  }

  @override
  void onBreederPairIdSelected(BreederPairModel? breederPairModel) {
    rabbitConcernsCubit.setBirthBreederPairId(breederPairModel?.id);
  }

  @override
  void onDeadKitsCountChanged(String deadKitsCount) {
    rabbitConcernsCubit.setBirthDeadKits(deadKitsCount);
  }

  @override
  void onDeadKitsCountSubmitted(String deadKitsCount) {
    deadKitsCountFocusNode.unfocus();
  }

  @override
  void onLitterIdSelected(LitterEntryModel? litterEntryModel) {
    rabbitConcernsCubit.setBirthLitterId(litterEntryModel?.litterId);
  }

  @override
  void onLiveKitsCountChanged(String liveKitsCount) {
    rabbitConcernsCubit.setBirthLiveKits(liveKitsCount);
  }

  @override
  void onLiveKitsCountSubmitted(String liveKitsCount) {
    deadKitsCountFocusNode.requestFocus();
  }

  @override
  void onSave() {
    rabbitConcernsCubit.saveBirth();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConstants.paddingH16,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                'breeder_pair'.i18n,
                style: context.tt.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: context.cs.surfaceContainerHighest,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              BlocBuilder<BreedersCubit, GeneralBreedersState>(
                builder: (context, state) {
                  Widget child;
                  if (state is BreederPairsSuccess) {
                    child = Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MainDropDownWidget<BreederPairModel>(
                          items: state.breederPairs,
                          text: 'select_breeder_pair'.i18n,
                          onChanged: onBreederPairIdSelected,
                        ),
                      ],
                    );
                  } else if (state is BreederPairsLoading) {
                    child = Center(
                      child: LoadingIndicator(
                        color: context.cs.primary,
                      ),
                    );
                  } else if (state is BreederPairsEmpty) {
                    child = MainErrorWidget(
                      error: state.message,
                    );
                  } else if (state is BreederPairsFail) {
                    child = MainErrorWidget(
                      error: state.message,
                      onTap: () {
                        breedersCubit.getBreederPairs();
                      },
                    );
                  } else {
                    child = const SizedBox();
                  }
                  return AnimatedSwitcherWithSize(
                    child: child,
                  );
                },
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'litter'.i18n,
                style: context.tt.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: context.cs.surfaceContainerHighest,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              BlocBuilder<LittersCubit, GeneralLittersState>(
                builder: (context, state) {
                  Widget child;
                  if (state is LittersSuccess) {
                    child = Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MainDropDownWidget<LitterEntryModel>(
                          items: state.littersStatusModel.all,
                          text: 'select_litter'.i18n,
                          onChanged: onLitterIdSelected,
                        ),
                      ],
                    );
                  } else if (state is LittersLoading) {
                    child = Center(
                      child: LoadingIndicator(
                        color: context.cs.primary,
                      ),
                    );
                  } else if (state is LittersFail) {
                    child = MainErrorWidget(
                      error: state.message,
                      onTap: () {
                        littersCubit.getLitters();
                      },
                    );
                  } else {
                    child = const SizedBox();
                  }

                  return AnimatedSwitcherWithSize(
                    child: child,
                  );
                },
              ),
              const SizedBox(
                height: 25,
              ),
              MainTextField(
                onSubmitted: onLiveKitsCountSubmitted,
                onChanged: onLiveKitsCountChanged,
                focusNode: liveKitsCountFocusNode,
                keyboardType: TextInputType.number,
                hintText: "live_kits_count".i18n,
                labelText: "live_kits_count".i18n,
              ),
              const SizedBox(
                height: 25,
              ),
              MainTextField(
                onSubmitted: onDeadKitsCountSubmitted,
                onChanged: onDeadKitsCountChanged,
                focusNode: deadKitsCountFocusNode,
                keyboardType: TextInputType.number,
                hintText: "dead_kits_count".i18n,
                labelText: "dead_kits_count".i18n,
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: double.maxFinite,
                child: BlocConsumer<RabbitConcernsCubit,
                    GeneralRabbitConcernsState>(
                  listener: (context, state) {
                    if (state is SaveBirthSuccess) {
                      MainSnackBar.showSuccessMessageBar(
                        context,
                        "breeder_birth".i18n,
                      );
                      context.router.maybePop();
                    } else if (state is SaveBirthFail) {
                      MainSnackBar.showErrorMessageBar(
                        context,
                        state.message,
                      );
                    }
                  },
                  builder: (context, state) {
                    var onTap = onSave;
                    Widget? child;
                    if (state is SaveBirthLoading) {
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
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
