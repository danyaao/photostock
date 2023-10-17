import 'package:flutter/material.dart';
import 'package:photostock/assets/colors/color_scheme.dart';
import 'package:photostock/assets/text/text_extension.dart';

extension ThemeDataExt on ThemeData {
  AppColorScheme get colorScheme =>
      extension<AppColorScheme>() ?? (throw Exception('no AppColorScheme'));

  AppTextTheme get textTheme =>
      extension<AppTextTheme>() ?? (throw Exception('no AppTextTheme'));
}
