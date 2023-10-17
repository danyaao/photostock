import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:photostock/features/common/mixin/theme_mixin.dart';
import 'package:photostock/features/info/screen/info_screen.dart';
import 'package:photostock/features/info/screen/info_screen_model.dart';

/// Factory for [InfoScreenWidgetModel].
InfoScreenWidgetModel infoScreenWmFactory(
  BuildContext context,
) {
  final model = InfoScreenModel();
  return InfoScreenWidgetModel(model);
}

/// Widget model for [InfoScreen].
class InfoScreenWidgetModel extends WidgetModel<InfoScreen, InfoScreenModel>
    with ThemeWMMixin
    implements IInfoScreenWidgetModel {
  /// Create an instance [InfoScreenWidgetModel].
  InfoScreenWidgetModel(super._model);
}

/// Interface of [InfoScreenWidgetModel].
abstract class IInfoScreenWidgetModel
    with ThemeIModelMixin
    implements IWidgetModel {}
