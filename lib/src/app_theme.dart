import 'package:flutter/material.dart';
import 'package:house_of_electricity/src/core/presentation/app_colors.dart';
import 'package:house_of_electricity/src/core/presentation/fonts_manager.dart';
import 'package:house_of_electricity/src/core/presentation/sizes.dart';

final ThemeData appTheme = ThemeData(
  appBarTheme: AppBarThemeData(
    foregroundColor: AppColors.mainGreen,
    titleTextStyle: IBMBold(fontSize: Sizes.s24, color: AppColors.mainGreen),
  ),
);
