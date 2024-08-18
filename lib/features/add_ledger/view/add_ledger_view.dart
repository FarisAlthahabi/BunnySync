import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/add_ledger/cubit/add_ledger_cubit.dart';
import 'package:bunny_sync/features/add_ledger/models/ledger_model/ledger_model.dart';
import 'package:bunny_sync/features/add_ledger/models/ledger_types/ledger_types.dart';
import 'package:bunny_sync/features/add_task/model/task_types/task_types.dart';
import 'package:bunny_sync/features/breeders/cubit/breeders_cubit.dart';
import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';
import 'package:bunny_sync/features/categories/cubit/categories_cubit.dart';
import 'package:bunny_sync/features/categories/model/category_model.dart';
import 'package:bunny_sync/features/customers/cubit/customers_cubit.dart';
import 'package:bunny_sync/features/customers/model/customer_model/customer_model.dart';
import 'package:bunny_sync/features/litters/cubit/litters_cubit.dart';
import 'package:bunny_sync/features/litters/models/litter_entry_model/litter_entry_model.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/mixins/mixins.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/animation/animated_switchers/animated_switchers.dart';
import 'package:bunny_sync/global/widgets/buttons/main_action_button.dart';
import 'package:bunny_sync/global/widgets/loading_indicator.dart';
import 'package:bunny_sync/global/widgets/main_app_bar.dart';
import 'package:bunny_sync/global/widgets/main_date_picker.dart';
import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:bunny_sync/global/widgets/main_text_field.dart';
import 'package:bunny_sync/global/widgets/radio_selector_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AddLedgerViewCallBacks {
  void onNameChanged(String name);

  void onNameSubmitted(String name);

  void onAmountChanged(String amount);

  void onAmountSubmitted(String amount);

  void onTypeSelected(LedgerTypes? type);

  void onCategorySelected(TaskTypes? category);

  void onContactSelected(CustomerModel? contact);

  void onCategoryIdSelected(CategoryModel? categoryId);

  void onDateSelected(DateTime date, List<int> numbers);

  void onNoteChanged(String note);

  void onNoteSubmitted(String note);

  Future<void> onFilePicked();

  void onSave();
}

@RoutePage()
class AddLedgerView extends StatelessWidget {
  const AddLedgerView({super.key, this.ledger});

  final LedgerModel? ledger;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => get<AddLedgerCubit>(),
        ),
        BlocProvider(
          create: (context) => get<CustomersCubit>(),
        ),
        BlocProvider(
          create: (context) => get<CategoriesCubit>(),
        ),
        BlocProvider(
          create: (context) => get<BreedersCubit>(),
        ),
        BlocProvider(
          create: (context) => get<LittersCubit>(),
        ),
      ],
      child: AddLedgerPage(ledger: ledger),
    );
  }
}

class AddLedgerPage extends StatefulWidget {
  const AddLedgerPage({super.key, this.ledger});

  final LedgerModel? ledger;

  @override
  State<AddLedgerPage> createState() => _AddLedgerPageState();
}

class _AddLedgerPageState extends State<AddLedgerPage>
    with PostFrameMixin
    implements AddLedgerViewCallBacks {
  late final AddLedgerCubit addLedgerCubit = context.read();

  late final CustomersCubit customersCubit = context.read();

  late final CategoriesCubit categoriesCubit = context.read();

  late final BreedersCubit breedersCubit = context.read();

  late final LittersCubit littersCubit = context.read();

  final nameFocusNode = FocusNode();

  final amountFocusNode = FocusNode();

  final noteFocusNode = FocusNode();

  @override
  void dispose() {
    nameFocusNode.dispose();
    amountFocusNode.dispose();
    noteFocusNode.dispose();

    super.dispose();
  }

  @override
  void onNameChanged(String name) {
    addLedgerCubit.setTitle(name);
  }

  @override
  void onNameSubmitted(String name) {
    amountFocusNode.requestFocus();
  }

  @override
  void onAmountChanged(String amount) {
    addLedgerCubit.setAmount(amount);
  }

  @override
  void onAmountSubmitted(String amount) {}

  @override
  void onTypeSelected(LedgerTypes? type) {
    addLedgerCubit.setType(type);
  }

  @override
  void onCategorySelected(TaskTypes? category) {
    addLedgerCubit.setTaskType(category);
  }

  @override
  void onContactSelected(CustomerModel? contact) {
    addLedgerCubit.setCustomerId(contact?.id);
  }

  @override
  void onCategoryIdSelected(CategoryModel? category) {
    addLedgerCubit.setCategoryId(category?.id);
  }

  @override
  void onDateSelected(DateTime date, List<int> numbers) {
    addLedgerCubit.setDate(date);
  }

  @override
  void onNoteChanged(String note) {
    addLedgerCubit.setNote(note);
  }

  @override
  void onNoteSubmitted(String note) {}

  @override
  Future<void> onFilePicked() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles();
    final path = result?.files.single.path;
    if (result != null && path != null) {
      final File file = File(path);
    }
    // TODO: implement onFilePicked
  }

  @override
  void onSave() {
    final ledgerModel = widget.ledger;
    if (ledgerModel == null) {
      addLedgerCubit.addLedger();
    } else {
      addLedgerCubit.updateLedger(ledgerModel.id);
    }
  }

  @override
  void onPostFrame() {
    final ledger = widget.ledger;
    if (ledger != null) {
      addLedgerCubit.setTitle(ledger.name);
      addLedgerCubit.setAmount(ledger.amount);
      addLedgerCubit.setType(ledger.type);
      addLedgerCubit.setTaskType(ledger.category);
      addLedgerCubit.setDate(ledger.date);
      addLedgerCubit.setNote(ledger.notes ?? '');
      addLedgerCubit.setCustomerId(ledger.customerId);
      addLedgerCubit.setCategoryId(ledger.categoryId);

      if (ledger.breederId != null) {
        addLedgerCubit.setWho(ledger.breederId);
        addLedgerCubit.setTaskType(TaskTypes.breeder);
      } else if (ledger.litterId != null) {
        addLedgerCubit.setWho(ledger.litterId);
        addLedgerCubit.setTaskType(TaskTypes.litter);
      }
    } else {
      addLedgerCubit.setDate(DateTime.now());
    }

    customersCubit.getCustomers();
    categoriesCubit.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: Text(
          widget.ledger == null ? 'create_ledger'.i18n : 'update_ledger'.i18n,
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
                      onSubmitted: onNameSubmitted,
                      onChanged: onNameChanged,
                      focusNode: nameFocusNode,
                      hintText: 'name'.i18n,
                      labelText: 'name'.i18n,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MainTextField(
                      onSubmitted: onAmountSubmitted,
                      onChanged: onAmountChanged,
                      focusNode: amountFocusNode,
                      hintText: 'amount'.i18n,
                      labelText: 'amount'.i18n,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      'type'.i18n,
                      style: context.tt.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: context.cs.surfaceContainerHighest,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    RadioSelectorWidget<LedgerTypes>(
                      items: LedgerTypes.values,
                      onSelected: onTypeSelected,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      'category'.i18n,
                      style: context.tt.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: context.cs.surfaceContainerHighest,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    MainDropDownWidget<TaskTypes>(
                      items: TaskTypes.values,
                      text: 'select_category'.i18n,
                      onChanged: onCategorySelected,
                      selectedValue: widget.ledger?.category,
                    ),
                    BlocListener<AddLedgerCubit, GeneralAddLedgerState>(
                      listener: (context, state) {
                        if (state is SetTaskTypeState) {
                          if (state.taskType.isBreeder) {
                            breedersCubit.getBreeders();
                          } else if (state.taskType.isLitter) {
                            littersCubit.getLitters();
                          }
                        }
                      },
                      child: const SizedBox(),
                    ),
                    BlocBuilder<AddLedgerCubit, GeneralAddLedgerState>(
                      buildWhen: (previous, current) {
                        return current is SetTaskTypeState;
                      },
                      builder: (context, state) {
                        if (state is SetTaskTypeState) {
                          if (state.taskType.isBreeder) {
                            return Column(
                              children: [
                                const SizedBox(height: 25),
                                BlocBuilder<BreedersCubit,
                                    GeneralBreedersState>(
                                  builder: (context, state) {
                                    Widget child;
                                    if (state is BreedersSuccess) {
                                      child = Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'breeder'.i18n,
                                            style:
                                                context.tt.bodyLarge?.copyWith(
                                              fontWeight: FontWeight.w700,
                                              color: context
                                                  .cs.surfaceContainerHighest,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          MainDropDownWidget<BreederEntryModel>(
                                            items:
                                                state.breedersStatusModel.all,
                                            text: 'select_breeder'.i18n,
                                            onChanged: (breeder) {
                                              addLedgerCubit
                                                  .setWho(breeder?.id);
                                            },
                                          ),
                                        ],
                                      );
                                    } else if (state is BreedersLoading) {
                                      child = Center(
                                        child: LoadingIndicator(
                                          color: context.cs.primary,
                                        ),
                                      );
                                    } else if (state is BreedersFail) {
                                      child = MainErrorWidget(
                                        error: state.message,
                                        onTap: () {
                                          context
                                              .read<BreedersCubit>()
                                              .getBreeders();
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
                              ],
                            );
                          } else if (state.taskType.isLitter) {
                            return Column(
                              children: [
                                const SizedBox(height: 25),
                                BlocBuilder<LittersCubit, GeneralLittersState>(
                                  builder: (context, state) {
                                    Widget child;
                                    if (state is LittersSuccess) {
                                      child = Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'litter'.i18n,
                                            style:
                                                context.tt.bodyLarge?.copyWith(
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
                                            onChanged: (litter) {
                                              addLedgerCubit.setWho(litter?.id);
                                            },
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
                                          context
                                              .read<LittersCubit>()
                                              .getLitters();
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
                              ],
                            );
                          }
                        }

                        return const SizedBox();
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      'contact'.i18n,
                      style: context.tt.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: context.cs.surfaceContainerHighest,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    BlocBuilder<CustomersCubit, GeneralCustomersState>(
                      builder: (context, state) {
                        Widget child;

                        if (state is CustomersSuccess) {
                          child = MainDropDownWidget<CustomerModel>(
                            items: state.customers,
                            text: 'select_contact'.i18n,
                            onChanged: onContactSelected,
                          );
                        } else if (state is CustomersLoading) {
                          child = Center(
                            child: LoadingIndicator(
                              color: context.cs.primary,
                            ),
                          );
                        } else if (state is CustomersFail) {
                          child = MainErrorWidget(
                            error: state.message,
                            onTap: () {
                              customersCubit.getCustomers();
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
                      'ledger_category'.i18n,
                      style: context.tt.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: context.cs.surfaceContainerHighest,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    BlocBuilder<CategoriesCubit, GeneralCategoriesState>(
                      builder: (context, state) {
                        Widget child;

                        if (state is CategoriesSuccess) {
                          child = Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MainDropDownWidget<CategoryModel>(
                                items: state.categories,
                                text: 'select_ledger_category'.i18n,
                                onChanged: onCategoryIdSelected,
                              ),
                            ],
                          );
                        } else if (state is CategoriesLoading) {
                          child = Center(
                            child: LoadingIndicator(
                              color: context.cs.primary,
                            ),
                          );
                        } else if (state is CategoriesFail) {
                          child = MainErrorWidget(
                            error: state.message,
                            onTap: () {
                              categoriesCubit.getCategories();
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
                      height: 10,
                    ),
                    MainTextField(
                      onSubmitted: onNoteSubmitted,
                      onChanged: onNoteChanged,
                      focusNode: noteFocusNode,
                      hintText: 'note'.i18n,
                      labelText: 'note'.i18n,
                      maxLines: 4,
                    ),
                    const SizedBox(height: 25),
                    Text(
                      'attach_receipt'.i18n,
                      style: context.tt.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: context.cs.surfaceContainerHighest,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    InkWell(
                      onTap: onFilePicked,
                      child: Container(
                        padding: AppConstants.padding16,
                        decoration: BoxDecoration(
                          border: Border.all(color: context.cs.onSurface),
                          borderRadius: AppConstants.borderRadius12,
                        ),
                        child: Row(
                          children: [
                            Text(
                              'choose_file'.i18n,
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Text(
                                //TODO: To be handled.
                                true ? 'no_file_chosen'.i18n : '',
                              ),
                            ),
                          ],
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
                    child: BlocConsumer<AddLedgerCubit, GeneralAddLedgerState>(
                      listener: (context, state) {
                        if (state is AddLedgerSuccess) {
                          MainSnackBar.showSuccessMessageBar(
                            context,
                            "ledger_added".i18n,
                          );
                          context.router.maybePop();
                          //TODO: Add ledger to ledgers cubit.
                        } else if (state is UpdateLedgerSuccess) {
                          MainSnackBar.showSuccessMessageBar(
                            context,
                            "ledger_update".i18n,
                          );
                          context.router.maybePop();
                          //TODO: update ledger to ledgers cubit.
                        } else if (state is AddLedgerError) {
                          MainSnackBar.showErrorMessageBar(
                            context,
                            state.message,
                          );
                        }
                      },
                      buildWhen: (previous, current) {
                        return current is AddLedgerState;
                      },
                      builder: (context, state) {
                        var onTap = onSave;
                        Widget? child;
                        if (state is AddLedgerLoading) {
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
