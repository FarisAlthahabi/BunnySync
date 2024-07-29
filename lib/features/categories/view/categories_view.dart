import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/categories/model/category_model.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/element_tile.dart';
import 'package:bunny_sync/global/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';

abstract class CategoriesViewCallBacks {
  void onAddTap();
}

@RoutePage()
class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CategoriesPage();
  }
}

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage>
    implements CategoriesViewCallBacks {
  //TODO: fetch from cubit
  final List<CategoryModel> categories = List.generate(
    6,
    (index) => CategoryModel(
      id: index + 1,
      name: 'general'.i18n,
      transactions: 0,
      description: 'Cupidatat consequat aute nostrud proident duis Lorem elit',
    ),
  );
 
  @override
  void onAddTap() {
    // TODO: implement onAddTap
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const MainAppBar(),
        body: SingleChildScrollView(
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
                  itemBuilder: (context, index) {
                    final item = categories[index];
                    return ElementTile(
                      no: item.id.toString(),
                      description: item.description,
                      subtitle: item.transactions.toInt().toString(),
                      numTitle: 'transactions'.i18n,
                      tag: item.name,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 16,
                    );
                  },
                  itemCount: categories.length,
                ),
              ],
            ),
          ),
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
      ),
    );
  }
}
