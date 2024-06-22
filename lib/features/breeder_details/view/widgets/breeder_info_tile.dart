import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:flutter/material.dart';

class BreederInfoTile extends StatelessWidget {
  const BreederInfoTile({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 137,
      height: 82,
      padding: AppConstants.padding12,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: context.cs.primary,
          width: 1.3,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.tt.headlineSmall?.copyWith(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 2),
          const Spacer(),
          Text(
            value,
            style: context.tt.bodyMedium,
          ),
        ],
      ),
    );
  }
}
