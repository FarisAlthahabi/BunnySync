import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/add_category/cubit/add_category_cubit.dart';
import 'package:bunny_sync/features/categories/cubit/categories_cubit.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/buttons/main_action_button.dart';
import 'package:bunny_sync/global/widgets/loading_indicator.dart';
import 'package:bunny_sync/global/widgets/main_app_bar.dart';
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:bunny_sync/global/widgets/main_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AddCategoryViewCallBack {
  void onNameChanged(String name);

  void onNameSubmitted(String name);

  void onDescriptionChanged(String description);

  void onDescriptionSubmitted(String description);

  void onSave();
}

@RoutePage()
class AddCategoryView extends StatelessWidget {
  const AddCategoryView({
    super.key,
    required this.categoriesCubit,
  });

  final CategoriesCubit categoriesCubit;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => get<AddCategoryCubit>(),
        ),
        BlocProvider.value(value: categoriesCubit),
      ],
      child: const AddCategoryPage(),
    );
  }
}

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({
    super.key,
  });

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage>
    implements AddCategoryViewCallBack {
  late final AddCategoryCubit addCategoryCubit = context.read();

  late final CategoriesCubit categoriesCubit = context.read();

  final nameFocusNode = FocusNode();

  final descriptionFocusNode = FocusNode();

  @override
  void onDescriptionChanged(String description) {
    addCategoryCubit.setDescription(description);
  }

  @override
  void onDescriptionSubmitted(String description) {
    onSave();
  }

  @override
  void onNameChanged(String name) {
    addCategoryCubit.setTitle(name);
  }

  @override
  void onNameSubmitted(String name) {
    descriptionFocusNode.requestFocus();
  }

  @override
  void onSave() {
    addCategoryCubit.addCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: Text(
          'create_ledger_category'.i18n,
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
                      hintText: "name".i18n,
                      labelText: "name".i18n,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MainTextField(
                      onSubmitted: onDescriptionSubmitted,
                      onChanged: onDescriptionChanged,
                      focusNode: descriptionFocusNode,
                      hintText: "description".i18n,
                      labelText: "description".i18n,
                      maxLines: 7,
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
                        BlocConsumer<AddCategoryCubit, GeneralAddCategoryState>(
                      listener: (context, state) {
                        if (state is AddCategorySuccess) {
                          MainSnackBar.showSuccessMessageBar(
                            context,
                            "category_added".i18n,
                          );
                          context.router.maybePop();
                          categoriesCubit.addCategory(
                            state.categoryModel,
                          );
                        } else if (state is AddCategoryFail) {
                          MainSnackBar.showErrorMessageBar(
                            context,
                            state.message,
                          );
                        }
                      },
                      builder: (context, state) {
                        var onTap = onSave;
                        Widget? child;
                        if (state is AddCategoryLoading) {
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
