import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/global/extensions/date_time_x.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/router/router.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/element_tile.dart';
import 'package:bunny_sync/global/widgets/main_app_bar.dart';
import 'package:bunny_sync/global/widgets/texts/bordered_textual_widget.dart';
import 'package:flutter/material.dart';

abstract class CustomersViewCallBacks {
  void onAddTap();
}

@RoutePage()
class CustomersView extends StatelessWidget {
  const CustomersView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomersPage();
  }
}

class CustomersPage extends StatefulWidget {
  const CustomersPage({super.key});

  @override
  State<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage>
    implements CustomersViewCallBacks {
  @override
  void onAddTap() {
    context.router.push(const AddCustomerRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppConstants.padding16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'customers'.i18n,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 10),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  //TODO : from cubit
                  return ElementTile(
                    leading: BorderedTextualWidget(
                      text: '${index + 1}',
                    ),
                    createdAt: DateTime.now().formatMMddYYYY,
                    title: Text(
                      strutStyle: const StrutStyle(height: 1.6),
                      'Cupidatat consequat aute nostrud proident duis Lorem elit',
                      style: context.tt.titleSmall?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    type: Text('lead'.i18n),
                    tag: 'Company Name',
                    secondaryTag: '+961353633',
                    note:
                        "This is note designed specifically for writing important stuff about the customer. It's not mandatory",
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 16,
                  );
                },
                itemCount: 5,
              ),
              const SizedBox(height: 50),
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
    );
  }
}
