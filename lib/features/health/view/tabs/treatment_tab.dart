import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/global/extensions/date_time_x.dart';
import 'package:bunny_sync/global/router/router.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/element_tile.dart';
import 'package:bunny_sync/global/widgets/texts/bordered_textual_widget.dart';
import 'package:flutter/material.dart';

abstract class TreatmentTabCallBacks {
  void onAddTap();
}

class TreatmentTab extends StatefulWidget {
  const TreatmentTab({super.key});

  @override
  State<TreatmentTab> createState() => _TreatmentTabState();
}

class _TreatmentTabState extends State<TreatmentTab>
    implements TreatmentTabCallBacks {
  @override
  void onAddTap() {
    context.router.push(const AddTreatmentRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: AppConstants.padding16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  //TODO : from cubit
                  return ElementTile(
                    leading: BorderedTextualWidget(
                      text: '${index + 1}',
                    ),
                    tag: 'Nux',
                    createdAt: DateTime.now().formatMMddYYYY,
                    title: Text(
                      strutStyle: const StrutStyle(height: 1.6),
                      "Can't walk",
                      style: context.tt.titleSmall?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    type: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.favorite_outline_outlined,
                          color: context.cs.onSurface,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Custom heart',
                          style: context.tt.labelSmall
                              ?.copyWith(color: context.cs.tertiary),
                        ),
                      ],
                    ),
                    note: 'Please check',
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
