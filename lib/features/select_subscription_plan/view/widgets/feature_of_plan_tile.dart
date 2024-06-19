import 'package:bunny_sync/features/select_subscription_plan/models/feature_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeatureOfPlanTile extends StatelessWidget {
  const FeatureOfPlanTile({super.key, required this.feature});

  final FeatureModel feature;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        children: [
          Text(
            feature.text,
            style: TextStyle(
              fontFamily: GoogleFonts.manrope().fontFamily,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(23, 26, 31, 1),
            ),
          ),
          const Spacer(),
          if (feature.isSelected)
            const Icon(
              Icons.check_circle_outline,
              color: Color.fromRGBO(29, 215, 91, 1),
            ),
        ],
      ),
    );
  }
}
