import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/customers/cubit/customers_cubit.dart';
import 'package:bunny_sync/features/customers/model/customer_model/customer_model.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/extensions/date_time_x.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/router/router.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
import 'package:bunny_sync/global/widgets/element_tile.dart';
import 'package:bunny_sync/global/widgets/main_app_bar.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:bunny_sync/global/widgets/main_show_bottom_sheet.dart';
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:bunny_sync/global/widgets/texts/bordered_textual_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class CustomersViewCallBacks {
  void onAddTap();

  void onTryAgainTap();

  void onCustomerTap(CustomerModel customerModel);

  void onEditTap(CustomerModel customerModel);

  void onDeleteTap(CustomerModel customerModel);
}

@RoutePage()
class CustomersView extends StatelessWidget {
  const CustomersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get<CustomersCubit>(),
      child: const CustomersPage(),
    );
  }
}

class CustomersPage extends StatefulWidget {
  const CustomersPage({super.key});

  @override
  State<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage>
    implements CustomersViewCallBacks {
  late final CustomersCubit customersCubit = context.read();

  @override
  void initState() {
    customersCubit.getCustomers();
    super.initState();
  }

  @override
  void onCustomerTap(CustomerModel customerModel) {
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        title: 'customers_options'.i18n,
        onEdit: onEditTap,
        onDelete: onDeleteTap,
        model: customerModel,
      ),
    );
  }

  @override
  void onDeleteTap(CustomerModel customerModel) {
    context.router.popForced();
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        title: 'are_you_sure_to_delete_breeder'.i18n,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {
                context.router.popForced();
                customersCubit.deleteCustomer(customerModel.id);
              },
              child: Text('yes'.i18n),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onEditTap(CustomerModel customerModel) {
    Navigator.pop(context);
    context.router.push(
      AddCustomerRoute(
        customersCubit: customersCubit,
        customerModel: customerModel,
      ),
    );
  }

  @override
  void onTryAgainTap() {
    customersCubit.getCustomers();
  }

  @override
  void onAddTap() {
    context.router.push(AddCustomerRoute(customersCubit: customersCubit));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: BlocConsumer<CustomersCubit, GeneralCustomersState>(
        listener: (context, state) {
          if (state is DeleteCustomerSuccess) {
            context.loaderOverlay.hide();
            MainSnackBar.showSuccessMessageBar(
              context,
              'customer_delete'.i18n,
            );
          } else if (state is CustomersFail) {
            context.loaderOverlay.hide();
            MainSnackBar.showErrorMessageBar(
              context,
              state.message,
            );
          } else if (state is DeleteCustomerLoading) {
            context.loaderOverlay.show();
          } else if (state is DeleteCustomerFail) {
            context.loaderOverlay.hide();
            MainSnackBar.showErrorMessageBar(
              context,
              state.message,
            );
          }
        },
        buildWhen: (prev, curr) => curr is CustomersState,
        builder: (context, state) {
          if (state is CustomersFetch) {
            return Skeletonizer(
              enabled: state is CustomersLoading,
              child: SingleChildScrollView(
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
                        itemCount: state.customers.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final item = state.customers[index];
                          return ElementTile(
                            model: item,
                            onTap: onCustomerTap,
                            leading: Skeleton.shade(
                              child: BorderedTextualWidget(
                                text: (index + 1).toString(),
                              ),
                            ),
                            createdAt: item.date?.formatMMMMMDoYYYY,
                            title: Text(
                              strutStyle: const StrutStyle(height: 1.6),
                              item.name,
                              style: context.tt.titleMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            type: Text(item.type.displayName),
                            tag: item.companyName,
                            secondaryTag: item.phone,
                            note: item.note,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 16,
                          );
                        },
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is CustomersEmpty) {
            return MainErrorWidget(error: state.message);
          } else if (state is CustomersFail) {
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
