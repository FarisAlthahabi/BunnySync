import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/breeders/view/widgets/tab_header.dart';
import 'package:bunny_sync/features/profile/cubit/profile_cubit.dart';
import 'package:bunny_sync/features/profile/view/tabs/billing_tab.dart';
import 'package:bunny_sync/features/profile/view/tabs/info_tab.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/widgets/custom_app_bar.dart';
import 'package:bunny_sync/global/widgets/main_app_bar.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class ProfileViewCallBacks {
  void onEditTap();

  void onTryAgainTap();
}

@RoutePage()
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get<ProfileCubit>(),
      child: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    implements ProfileViewCallBacks {
  late final ProfileCubit profileCubit = context.read();

  @override
  void initState() {
    profileCubit.getprofile();
    super.initState();
  }

  @override
  void onEditTap() {
    // TODO: implement onEdit
  }

  @override
  void onTryAgainTap() {
    profileCubit.getprofile();
  }

  @override
  Widget build(BuildContext context) {
    final tabs = <TabModel>[
      TabModel(
        title: 'info'.i18n,
      ),
      TabModel(
        title: 'billing'.i18n,
      ),
    ];
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: MainAppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              'profile'.i18n,
              style: context.tt.headlineMedium,
            ),
          ),
          toolbarHeight: 120,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: TabBar(
              tabs: tabs
                  .map(
                    (tab) => TabHeader(
                      text: tab.title,
                      indicatorValue: tab.indicatorValue,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        body: SafeArea(
          top: false,
          child: BlocBuilder<ProfileCubit, GeneralProfileState>(
            buildWhen: (previous, current) => current is ProfileState,
            builder: (context, state) {
              if (state is ProfileFetch) {
                return Skeletonizer(
                  enabled: state is ProfileLoading,
                  child: TabBarView(
                    children: [
                      InfoTab(user: state.userModel),
                      BillingTab(plan: state.userModel.plan),
                    ],
                  ),
                );
              } else if (state is ProfileFail) {
                return MainErrorWidget(
                  error: state.message,
                  onTap: onTryAgainTap,
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}
