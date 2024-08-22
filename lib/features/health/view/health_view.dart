import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/breeders/view/widgets/tab_header.dart';
import 'package:bunny_sync/features/health/cubit/health_cubit.dart';
import 'package:bunny_sync/features/health/view/tabs/ailments_tab.dart';
import 'package:bunny_sync/features/health/view/tabs/treatment_tab.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/widgets/custom_app_bar.dart';
import 'package:bunny_sync/global/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HealthView extends StatelessWidget {
  const HealthView({
    super.key,
    this.breederId,
  });

  final int? breederId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get<HealthCubit>(),
      child: HealthPage(
        breederId: breederId,
      ),
    );
  }
}

class HealthPage extends StatefulWidget {
  const HealthPage({
    super.key,
    this.breederId,
  });

  final int? breederId;

  @override
  State<HealthPage> createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  @override
  Widget build(BuildContext context) {
    final tabs = <TabModel>[
      TabModel(
        title: 'ailments'.i18n,
      ),
      TabModel(
        title: 'treatments'.i18n,
      ),
    ];
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: MainAppBar(
          automaticallyImplyLeading: widget.breederId == null,
          title: widget.breederId == null ? Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text('health'.i18n, style: context.tt.displayLarge),
          ) : null ,
          toolbarHeight:widget.breederId == null ? 120 : 50,
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
          child: TabBarView(
            children: [
              AilmentsTab(
                breederId: widget.breederId,
              ),
              TreatmentTab(
                breederId: widget.breederId,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
