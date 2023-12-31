import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:photostock/features/app/app.dart';
import 'package:photostock/features/app/di/app_scope_register.dart';

/// App launch.
Future<void> run() async {
  /// It must be called so that the orientation does not fall.
  WidgetsFlutterBinding.ensureInitialized();

  /// Fix orientation.
  // PlatformDispatcher.instance.onError = (error, stack) {
  //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //
  //   return true;
  // };

  await _runApp();
}

Future<void> _runApp() async {
  final scopeRegister = AppScopeRegister();
  final scope = await scopeRegister.createScope();
  await scope.initTheme();
  runApp(App(scope));
}
