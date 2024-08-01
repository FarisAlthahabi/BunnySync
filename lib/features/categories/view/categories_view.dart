import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/categories/cubit/categories_cubit.dart';
import 'package:bunny_sync/features/categories/model/category_model.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/router/router.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
import 'package:bunny_sync/global/widgets/element_tile.dart';
import 'package:bunny_sync/global/widgets/main_app_bar.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:bunny_sync/global/widgets/main_show_bottom_sheet.dart';
import 'package:bunny_sync/global/widgets/texts/bordered_textual_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class CategoriesViewCallBacks {
  void onAddTap();

  void onCategoryTap(CategoryModel categoryModel);

  void onUpdateCategoryTap(CategoryModel categoryModel);

  void onDeleteCategoryTap(CategoryModel categoryModel);

  void onTryAgainTap();
}

@RoutePage()
class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get<CategoriesCubit>(),
      child: const CategoriesPage(),
    );
  }
}

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage>
    implements CategoriesViewCallBacks {
  late final CategoriesCubit categoriesCubit = context.read();

  @override
  void initState() {
    categoriesCubit.getCategories();
    super.initState();
  }

  @override
  void onAddTap() {
    context.router.push(
      AddCategoryRoute(
        categoriesCubit: categoriesCubit,
      ),
    );
  }

  @override
  void onCategoryTap(CategoryModel categoryModel) {
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        title: "category_options".i18n,
        model: categoryModel,
        onEdit: onUpdateCategoryTap,
        onDelete: onDeleteCategoryTap,
      ),
    );
  }

  @override
  void onDeleteCategoryTap(CategoryModel categoryModel) {
    context.router.popForced();
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        title: 'are_you_sure_to_delete_category'.i18n,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {
                context.router.popForced();
                //TODO
                //categoriesCubit.deleteCategory(categoryModel.id);
              },
              child: Text('yes'.i18n),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onUpdateCategoryTap(CategoryModel categoryModel) {
    context.router.popForced();
    context.router.push(
      AddCategoryRoute(
        categoriesCubit: categoriesCubit,
        categoryModel: categoryModel,
      ),
    );
  }

  @override
  void onTryAgainTap() {
    categoriesCubit.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: BlocBuilder<CategoriesCubit, GeneralCategoriesState>(
        builder: (context, state) {
          if (state is CategoriesFetch) {
            return Skeletonizer(
              enabled: state is CategoriesLoading,
              child: SingleChildScrollView(
                child: Padding(
                  padding: AppConstants.padding16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'categories'.i18n,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      const SizedBox(height: 10),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.categories.length,
                        itemBuilder: (context, index) {
                          final item = state.categories[index];
                          return ElementTile(
                            categoryModel: item,
                            onTap: onCategoryTap,
                            leading: Skeleton.shade(
                              child: BorderedTextualWidget(
                                text: item.id.toString(),
                              ),
                            ),
                            title: Text(
                              strutStyle: const StrutStyle(height: 1.6),
                              item.description ?? 'description'.i18n,
                              style: context.tt.titleSmall?.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            type: Text(
                              '${item.transactions?.toInt() ?? 0}: ${'transactions'.i18n}',
                              style: context.tt.labelSmall
                                  ?.copyWith(color: context.cs.tertiary),
                            ),
                            tag: item.name,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 16,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is CategoriesEmpty) {
            return MainErrorWidget(error: state.message);
          } else if (state is CategoriesFail) {
            return MainErrorWidget(
              error: state.message,
              onTap: onTryAgainTap,
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
      floatingActionButton: Padding(
        padding: AppConstants.padding16,
        child: FloatingActionButton(
          onPressed: onAddTap,
          shape: RoundedRectangleBorder(
            borderRadius: AppConstants.circularBorderRadius,
          ),
          backgroundColor: context.cs.secondaryContainer,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
