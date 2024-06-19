import 'package:bunny_sync/features/select_subscription_plan/models/plan_model.dart';
import 'package:bunny_sync/global/extensions/string_x.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/widgets/animated_switchers/animated_switchers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanTile extends StatelessWidget {
  const PlanTile({
    super.key,
    required this.plan,
    required this.isSelected,
    this.onSelect,
  });

  final PlanModel plan;
  final bool isSelected;
  final ValueSetter<PlanModel>? onSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: context.cs.surfaceTint,
        border: Border.all(
          width: 3,
          color: plan.colorHex.color,
        ),
        boxShadow: const [
          BoxShadow(),
        ],
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: () {
            onSelect?.call(plan);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: plan.colorHex.color,
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.white,
                      child: plan.icon.svg(
                        width: 15,
                        height: 15,
                        color: plan.colorHex.color,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      plan.title,
                      style: TextStyle(
                        fontFamily: GoogleFonts.lexend().fontFamily,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      style: TextStyle(
                        fontFamily: GoogleFonts.lexend().fontFamily,
                        fontSize: 12,
                      ),
                      TextSpan(
                        text: '\$',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: plan.colorHex.color,
                        ),
                        children: [
                          TextSpan(
                            text: plan.yearlyPrice.toString(),
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              color: plan.colorHex.color,
                            ),
                          ),
                          const TextSpan(
                            text: '/ year',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(111, 119, 135, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Text(
                          '\$ ${plan.price} / month',
                          style: TextStyle(
                            fontFamily: GoogleFonts.manrope().fontFamily,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(111, 119, 135, 1),
                          ),
                        ),
                        const Spacer(),
                        AnimatedSwitcherWithScale(
                          child: isSelected
                              ? const Icon(Icons.check_circle)
                              : const SizedBox(width: 24, height: 24),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
