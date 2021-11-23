import 'package:flutter/material.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:shopping_store/app/config/constants/app_constant.dart';
import 'package:shopping_store/app/config/themes/app_theme.dart';

class PickerGender extends StatelessWidget {
  final Function(Gender?)? onChanged;
  const PickerGender({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GenderPickerWithImage(
      onChanged: onChanged,
      selectedGender: null,
      verticalAlignedText: true,
      showOtherGender: true,
      padding: EdgeInsets.zero,
      animationDuration: AppConstant.durationGender,
      size: 50,
      maleText: "Male",
      femaleText: "Female",
      otherGenderText: "Others",
      selectedGenderTextStyle: TextStyle(
        color: AppTheme.mainColor,
        fontWeight: FontWeight.w900,
      ),
      unSelectedGenderTextStyle: TextStyle(
        color: AppTheme.primaryTextColor,
        fontWeight: FontWeight.w500,
      ),
      linearGradient: LinearGradient(
        colors: [AppTheme.mainColor, AppTheme.mainColor.withOpacity(.5)],
      ),
    );
  }
}
