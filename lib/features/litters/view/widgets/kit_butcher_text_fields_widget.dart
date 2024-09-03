import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:bunny_sync/features/litter_details/model/kit_model/kit_model.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/widgets/buttons/rotating_arrow_buttom.dart';
import 'package:bunny_sync/global/widgets/main_text_field.dart';
import 'package:flutter/material.dart';

class LitterButcherTextFieldsWidget extends StatefulWidget {
  const LitterButcherTextFieldsWidget({
    super.key,
    required this.index,
    required this.kit,
    required this.onWeightChanged,
    required this.onPreWeightChanged,
    required this.onPriceChanged,
    required this.onWeightsSubmitted,
    required this.onPreWeightsSubmitted,
    required this.onPricesSubmitted,
    required this.weightFocusNode,
    required this.preWeightFocusNode,
    required this.priceFocusNode,
  });

  final int index;
  final KitModel kit;
  final Function(String, {int? kitId}) onWeightChanged;
  final Function(String, {int? kitId}) onPreWeightChanged;
  final Function(String, {int? kitId}) onPriceChanged;
  final Function(String, int) onWeightsSubmitted;
  final Function(String, int) onPreWeightsSubmitted;
  final Function(String, int) onPricesSubmitted;
  final FocusNode weightFocusNode;
  final FocusNode preWeightFocusNode;
  final FocusNode priceFocusNode;

  @override
  State<LitterButcherTextFieldsWidget> createState() =>
      _LitterButcherTextFieldsWidgetState();
}

class _LitterButcherTextFieldsWidgetState
    extends State<LitterButcherTextFieldsWidget> {
  late bool isShowTextFields = widget.index == 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.kit.displayName,
              style: context.tt.bodyLarge?.copyWith(
                fontWeight: FontWeight.w700,
                color: context.cs.surfaceContainerHighest,
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                setState(() {
                  isShowTextFields = !isShowTextFields;
                });
              },
              child: RotatingArrowButton(
              isExpanded: isShowTextFields,
            ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        AnimatedHeightAndFade(
          child: isShowTextFields
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainTextField(
                      onSubmitted: (weight) {
                        widget.onWeightsSubmitted(weight, widget.index);
                      },
                      onChanged: (weight) {
                        widget.onWeightChanged(weight, kitId: widget.kit.id);
                      },
                      focusNode: widget.weightFocusNode,
                      keyboardType: TextInputType.number,
                      hintText: "weight".i18n,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MainTextField(
                      onSubmitted: (weight) {
                        widget.onPreWeightsSubmitted(weight, widget.index);
                      },
                      onChanged: (weight) {
                        widget.onPreWeightChanged(
                          weight,
                          kitId: widget.kit.id,
                        );
                      },
                      focusNode: widget.preWeightFocusNode,
                      keyboardType: TextInputType.number,
                      hintText: "preWeight".i18n,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MainTextField(
                      onSubmitted: (price) {
                        widget.onPricesSubmitted(price, widget.index);
                      },
                      onChanged: (price) {
                        widget.onPriceChanged(price, kitId: widget.kit.id);
                      },
                      focusNode: widget.priceFocusNode,
                      keyboardType: TextInputType.number,
                      hintText: "price".i18n,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                )
              : null,
        ),
      ],
    );
  }
}
