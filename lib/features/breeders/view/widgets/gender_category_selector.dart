import 'package:bunny_sync/features/breeders/cubit/breeders_cubit.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderCategorySelector extends StatefulWidget {
  const GenderCategorySelector({
    super.key,
    this.onGenderCategorySelected,
    this.selectedGender,
  });

  final ValueChanged<String?>? onGenderCategorySelected;
  final String? selectedGender;

  @override
  State<GenderCategorySelector> createState() => _GenderCategorySelectorState();
}

class _GenderCategorySelectorState extends State<GenderCategorySelector> {
  late final BreedersCubit breedersCubit = context.read();

  final List<String> genderCategories = ['all', 'male', 'female'];
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        value: widget.selectedGender,
        hint: Text(
          'gender'.i18n,
          style: context.tt.titleSmall,
        ),
        items: genderCategories
            .map(
              (String item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: context.tt.titleSmall,
                ),
              ),
            )
            .toList(),
        onChanged: widget.onGenderCategorySelected ,
      ),
    );
  }
}
