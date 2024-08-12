import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/add_customer/cubit/add_customer_cubit.dart';
import 'package:bunny_sync/features/customers/cubit/customers_cubit.dart';
import 'package:bunny_sync/features/customers/model/customer_model/customer_model.dart';
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

abstract class AddCustomerViewCallBack {
  void onNameChanged(String name);

  void onNameSubmitted(String name);

  void onEmailChanged(String email);

  void onEmailSubmitted(String email);

  void onTypeChanged(String type);

  void onTypeSubmitted(String type);

  void onCompanyNameChanged(String companyName);

  void onCompanyNameSubmitted(String companyName);

  void onPhoneChanged(String phone);

  void onPhoneSubmitted(String phone);

  void onNoteChanged(String note);

  void onNoteSubmitted(String note);

  void onStreetChanged(String street);

  void onStreetSubmitted(String street);

  void onCityChanged(String city);

  void onCitySubmitted(String city);

  void onCountryChanged(String country);

  void onCountrySubmitted(String country);

  void onStateChanged(String state);

  void onStateSubmitted(String state);

  void onZipCodeChanged(String zipCode);

  void onZipCodeSubmitted(String zipCode);

  void onSave();
}

@RoutePage()
class AddCustomerView extends StatelessWidget {
  const AddCustomerView({
    super.key,
    required this.customersCubit,
    this.customerModel,
  });

  final CustomersCubit customersCubit;
  final CustomerModel? customerModel;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: customersCubit,
        ),
        BlocProvider(
          create: (context) => get<AddCustomerCubit>(),
        ),
      ],
      child: AddCustomerPage(customerModel: customerModel),
    );
  }
}

class AddCustomerPage extends StatefulWidget {
  const AddCustomerPage({
    super.key,
    this.customerModel,
  });

  final CustomerModel? customerModel;

  @override
  State<AddCustomerPage> createState() => _AddCustomerPageState();
}

class _AddCustomerPageState extends State<AddCustomerPage>
    implements AddCustomerViewCallBack {
  late final AddCustomerCubit addCustomerCubit = context.read();

  late final CustomersCubit customersCubit = context.read();

  final focusNode = List.generate(11, (index) => FocusNode());

  List<String?> initialValue = List.generate(11, (_) => null);

  @override
  void dispose() {
    for (final element in focusNode) {
      element.dispose();
    }

    super.dispose();
  }

  @override
  void onNameChanged(String name) {
    addCustomerCubit.setName(name);
  }

  @override
  void onNameSubmitted(String name) {
    focusNode[1].requestFocus();
  }

  @override
  void onEmailChanged(String email) {
    addCustomerCubit.setEmail(email);
  }

  @override
  void onEmailSubmitted(String email) {
    focusNode[2].requestFocus();
  }

  @override
  void onCityChanged(String city) {
    addCustomerCubit.setCity(city);
  }

  @override
  void onCitySubmitted(String city) {
    focusNode[8].requestFocus();
  }

  @override
  void onCompanyNameChanged(String companyName) {
    addCustomerCubit.setCompanyName(companyName);
  }

  @override
  void onCompanyNameSubmitted(String companyName) {
    focusNode[4].requestFocus();
  }

  @override
  void onCountryChanged(String country) {
    addCustomerCubit.setCountry(country);
  }

  @override
  void onCountrySubmitted(String country) {
    focusNode[9].requestFocus();
  }

  @override
  void onNoteChanged(String note) {
    addCustomerCubit.setNote(note);
  }

  @override
  void onNoteSubmitted(String note) {
    focusNode[6].requestFocus();
  }

  @override
  void onPhoneChanged(String phone) {
    addCustomerCubit.setPhone(phone);
  }

  @override
  void onPhoneSubmitted(String phone) {
    focusNode[5].requestFocus();
  }

  @override
  void onStateChanged(String state) {
    addCustomerCubit.setState(state);
  }

  @override
  void onStateSubmitted(String state) {
    focusNode[10].requestFocus();
  }

  @override
  void onStreetChanged(String street) {
    addCustomerCubit.setStreet(street);
  }

  @override
  void onStreetSubmitted(String street) {
    focusNode[7].requestFocus();
  }

  @override
  void onTypeChanged(String type) {
    addCustomerCubit.setType(type);
  }

  @override
  void onTypeSubmitted(String type) {
    focusNode[3].requestFocus();
  }

  @override
  void onZipCodeChanged(String zipCode) {
    addCustomerCubit.setZipCode(zipCode);
  }

  @override
  void onZipCodeSubmitted(String zipCode) {
    onSave();
  }

  @override
  void onSave() {
    final customer = widget.customerModel;
    if (customer == null) {
      addCustomerCubit.addCustomer();
    } else {
      addCustomerCubit.updateCustomer(customer.id);
    }
  }

  late final List<ValueSetter<String>> onPropertyChanged = [
    onNameChanged,
    onEmailChanged,
    onTypeChanged,
    onCompanyNameChanged,
    onPhoneChanged,
    onNoteChanged,
    onStreetChanged,
    onCityChanged,
    onCountryChanged,
    onStateChanged,
    onZipCodeChanged,
  ];

  late final List<ValueSetter<String>> onPropertySubmitted = [
    onNameSubmitted,
    onEmailSubmitted,
    onTypeSubmitted,
    onCompanyNameSubmitted,
    onPhoneSubmitted,
    onNoteSubmitted,
    onStreetSubmitted,
    onCitySubmitted,
    onCountrySubmitted,
    onStateSubmitted,
    onZipCodeSubmitted,
  ];

  final List<String> propertyLabelText = [
    '${"name".i18n} *',
    '${"email".i18n} *',
    "type".i18n,
    "company_name".i18n,
    "phone".i18n,
    "note".i18n,
    "street".i18n,
    "city".i18n,
    "country".i18n,
    "state".i18n,
    "zip_code".i18n,
  ];

  final propertyHintText = [
    "name".i18n,
    "email".i18n,
    "type".i18n,
    "company_name".i18n,
    "phone".i18n,
    "note".i18n,
    "street".i18n,
    "city".i18n,
    "country".i18n,
    "state".i18n,
    "zip_code".i18n,
  ];

  @override
  void initState() {
    final customer = widget.customerModel;
    if (customer != null) {
      addCustomerCubit.setName(customer.name);
      addCustomerCubit.setEmail(customer.email);
      addCustomerCubit.setType(customer.type);
      addCustomerCubit.setCompanyName(customer.companyName);
      addCustomerCubit.setPhone(customer.phone);
      addCustomerCubit.setNote(customer.note);
      addCustomerCubit.setStreet(customer.street);
      addCustomerCubit.setCity(customer.city);
      addCustomerCubit.setCountry(customer.country);
      addCustomerCubit.setState(customer.state);
      addCustomerCubit.setZipCode(customer.zipCode);
      initialValue = [
        customer.name,
        customer.email,
        customer.type,
        customer.companyName,
        customer.phone,
        customer.note,
        customer.street,
        customer.city,
        customer.country,
        customer.state,
        customer.zipCode,
      ];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: Text(
          'new_customer'.i18n,
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
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: propertyLabelText.length,
                      itemBuilder: (context, index) {
                        return MainTextField(
                          initialValue: initialValue[index],
                          onSubmitted: onPropertySubmitted[index],
                          onChanged: onPropertyChanged[index],
                          focusNode: focusNode[index],
                          hintText: propertyHintText[index],
                          labelText: propertyLabelText[index],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 25,
                        );
                      },
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
                        BlocConsumer<AddCustomerCubit, GeneralAddCustomerState>(
                      listener: (context, state) {
                        if (state is CustomerNamePostInvalid) {
                          MainSnackBar.showErrorMessageBar(
                            context,
                            state.message,
                          );
                        }
                        if (state is CustomerEmailPostInvalid) {
                          MainSnackBar.showErrorMessageBar(
                            context,
                            state.message,
                          );
                        }
                        if (state is AddCustomerSuccess) {
                          MainSnackBar.showSuccessMessageBar(
                            context,
                            "customer_added".i18n,
                          );
                          context.router.maybePop();
                          customersCubit.addCustomer(
                            state.customer,
                          );
                        } else if (state is UpdateCustomerSuccess) {
                          MainSnackBar.showSuccessMessageBar(
                            context,
                            "customer_update".i18n,
                          );
                          context.router.maybePop();
                          customersCubit.updateCustomer(
                            state.customer,
                          );
                        } else if (state is AddCustomerFail) {
                          MainSnackBar.showErrorMessageBar(
                            context,
                            state.message,
                          );
                        }
                      },
                      builder: (context, state) {
                        var onTap = onSave;
                        Widget? child;
                        if (state is AddCustomerLoading) {
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
