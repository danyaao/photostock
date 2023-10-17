import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:photostock/features/common/mixin/theme_mixin.dart';
import 'package:photostock/features/dash/screen/dash_screen.dart';
import 'package:photostock/features/dash/screen/dash_screen_model.dart';
import 'package:photostock/l10n/app_localizations_x.dart';

/// Factory for [DashScreenWidgetModel].
DashScreenWidgetModel dashScreenWmFactory(
  BuildContext context,
) {
  final model = DashScreenModel();
  return DashScreenWidgetModel(model);
}

/// Widget model for [DashScreen].
class DashScreenWidgetModel extends WidgetModel<DashScreen, DashScreenModel>
    with ThemeWMMixin
    implements IDashScreenWidgetModel {
  @override
  AppLocalizations get l10n => context.l10n;

  /// Create an instance [DashScreenWidgetModel].
  DashScreenWidgetModel(super._model);
}

/// Interface of [IDashScreenWidgetModel].
abstract class IDashScreenWidgetModel
    with ThemeIModelMixin
    implements IWidgetModel {
  /// Localization strings.
  AppLocalizations get l10n;
}
