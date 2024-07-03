import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/add_breeder/cubit/add_breeder_cubit.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/localization/localization.dart';
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
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AddBreederViewCallBack {
  void onNameChanged(String name);

  void onNameSubmitted(String name);

  void onPrefixChanged(String prefix);

  void onPrefixSubmitted(String prefix);

  void onCageChanged(String cage);

  void onCageSubmitted(String cage);

  void onColorChanged(String color);

  void onColorSubmitted(String color);

  void onTattoChanged(String tatto);

  void onTattoSubmitted(String tatto);

  void onWeightChanged(String weight);

  void onWeightSubmitted(String weight);

  void onSave();

  void onGenderSelected(GenderTypes gender);

  void onDatePicked(DateTime date, List<int> numbers);
}

@RoutePage()
class AddBreederView extends StatelessWidget {
  const AddBreederView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get<AddBreederCubit>(),
      child: const AddBreederPage(),
    );
  }
}

class AddBreederPage extends StatefulWidget {
  const AddBreederPage({super.key});

  @override
  State<AddBreederPage> createState() => _AddBreederPageState();
}

class _AddBreederPageState extends State<AddBreederPage>
    implements AddBreederViewCallBack {
  DateTime selectedDate = DateTime.now();

  late final AddBreederCubit addBreederCubit = context.read();

  final nameFocusNode = FocusNode();

  final prefixFocusNode = FocusNode();

  final cageFocusNode = FocusNode();

  final colorFocusNode = FocusNode();

  final tattoFocusNode = FocusNode();

  final weightFocusNode = FocusNode();

  @override
  void onCageChanged(String cage) {
    addBreederCubit.setCage(cage);
  }

  @override
  void onCageSubmitted(String cage) {
    colorFocusNode.requestFocus();
  }

  @override
  void onColorChanged(String color) {
    addBreederCubit.setColor(color);
  }

  @override
  void onColorSubmitted(String color) {
    tattoFocusNode.requestFocus();
  }

  @override
  void onNameChanged(String name) {
    addBreederCubit.setName(name);
  }

  @override
  void onNameSubmitted(String name) {
    prefixFocusNode.requestFocus();
  }

  @override
  void onPrefixChanged(String prefix) {
    addBreederCubit.setPrefix(prefix);
  }

  @override
  void onPrefixSubmitted(String prefix) {
    cageFocusNode.requestFocus();
  }

  @override
  void onTattoChanged(String tatto) {
    addBreederCubit.setTatto(tatto);
  }

  @override
  void onTattoSubmitted(String tatto) {
    weightFocusNode.requestFocus();
  }

  @override
  void onWeightChanged(String weight) {
    addBreederCubit.setWeight(weight);
  }

  @override
  void onWeightSubmitted(String weight) {}

  @override
  void initState() {
    super.initState();
  }

  @override
  void onDatePicked(DateTime date, List<int> numbers) {
    setState(() {
      selectedDate = date;
    });
    addBreederCubit.setDate(date);
  }

  @override
  void onGenderSelected(GenderTypes gender) {
    addBreederCubit.setGender(gender);
  }

  @override
  void onSave() {
    addBreederCubit.addBreeder();
  }

  @override
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: Text('new_breeder'.i18n),
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
                      onSubmitted: onNameSubmitted,
                      onChanged: onNameChanged,
                      focusNode: nameFocusNode,
                      hintText: "name".i18n,
                      labelText: '${"name".i18n} *',
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MainTextField(
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
                              color: AppColors.darkGrey,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        RadioSelectorWidget<GenderTypes>(
                          items: GenderTypes.values,
                          onSelected: onGenderSelected,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MainTextField(
                      onSubmitted: onColorSubmitted,
                      onChanged: onColorChanged,
                      focusNode: colorFocusNode,
                      hintText: "hex".i18n,
                      labelText: "color".i18n,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MainTextField(
                      onSubmitted: onTattoSubmitted,
                      onChanged: onTattoChanged,
                      focusNode: tattoFocusNode,
                      hintText: "tatto".i18n,
                      labelText: "tatto".i18n,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MainTextField(
                      onSubmitted: onWeightSubmitted,
                      onChanged: onWeightChanged,
                      focusNode: weightFocusNode,
                      hintText: "35",
                      labelText: "weight".i18n,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "set_date".i18n,
                      style: context.tt.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.darkGrey,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: SizedBox(
                        width: 0.7.sw,
                        child: DatePickerWidget(
                          initialDate: DateTime.now(),
                          looping: true,
                          dateFormat: "dd/MMM/yyyy",
                          onChange: onDatePicked,
                          pickerTheme: DateTimePickerTheme(
                            itemTextStyle: context.tt.bodyLarge?.copyWith(
                                  fontSize: 18,
                                  color: context.cs.secondaryContainer,
                                  fontWeight: FontWeight.w700,
                                ) ??
                                const TextStyle(),
                            dividerColor: context.cs.secondaryContainer,
                          ),
                        ),
                      ),
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
                    child:
                        BlocConsumer<AddBreederCubit, GeneralAddBreederState>(
                      listener: (context, state) {
                        if (state is BreederNamePostInvalid) {
                          MainSnackBar.showErrorMessageBar(
                            context,
                            state.message,
                          );
                        } else if (state is AddBreederSuccess) {
                          MainSnackBar.showSuccessMessageBar(
                            context,
                            "breeder_added".i18n,
                          );
                          context.router.maybePop();
                        } else if (state is AddBreederFail) {
                          MainSnackBar.showErrorMessageBar(
                            context,
                            state.message,
                          );
                        }
                      },
                      builder: (context, state) {
                        var onTap = onSave;
                        Widget? child;
                        if (state is AddBreederLoading) {
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