import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:photostock/features/common/service/theme/theme_service.dart';
import 'package:photostock/features/common/service/theme/theme_service_impl.dart';
import 'package:photostock/features/navigation/service/router.dart';
import 'package:photostock/persistence/storage/photo_storage/photo_storage.dart';
import 'package:photostock/persistence/storage/theme_storage/theme_storage.dart';
import 'package:photostock/persistence/storage/theme_storage/theme_storage_impl.dart';
import 'package:photostock/util/error_handler/default_error_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Scope of dependencies which need through all app's life.
class AppScope implements IAppScope {
  static const _themeByDefault = ThemeMode.system;

  final SharedPreferences _sharedPreferences;

  late final Dio _dio;
  late final PhotoStorage _photoStorage;
  late final ErrorHandler _errorHandler;
  late final AppRouter _router;
  late final IThemeService _themeService;

  @override
  late VoidCallback applicationRebuilder;

  @override
  Dio get dio => _dio;

  @override
  PhotoStorage get photoStorage => _photoStorage;

  @override
  ErrorHandler get errorHandler => _errorHandler;

  @override
  AppRouter get router => _router;

  @override
  IThemeService get themeService => _themeService;

  @override
  SharedPreferences get sharedPreferences => _sharedPreferences;

  late IThemeModeStorage _themeModeStorage;

  /// Create an instance [AppScope].
  AppScope(this._sharedPreferences) {
    /// List interceptor. Fill in as needed.
    final additionalInterceptors = <Interceptor>[];

    _dio = _initDio(additionalInterceptors);
    _photoStorage = PhotoStorage();
    _errorHandler = DefaultErrorHandler();
    _router = AppRouter.instance();
    _themeModeStorage = ThemeModeStorageImpl(_sharedPreferences);
  }

  @override
  Future<void> initTheme() async {
    final theme =
        await ThemeModeStorageImpl(_sharedPreferences).getThemeMode() ??
            _themeByDefault;
    _themeService = ThemeServiceImpl(theme);
    _themeService.addListener(_onThemeModeChanged);
  }

  Dio _initDio(Iterable<Interceptor> additionalInterceptors) {
    final dio = Dio();

    dio.options.baseUrl = 'https://api.unsplash.com/';

    return dio;
  }

  Future<void> _onThemeModeChanged() async {
    await _themeModeStorage.saveThemeMode(mode: _themeService.currentThemeMode);
  }
}

/// App dependencies.
abstract class IAppScope {
  /// Http client.
  Dio get dio;

  /// Photo storage.
  PhotoStorage get photoStorage;

  /// Interface for handle error in business logic.
  ErrorHandler get errorHandler;

  /// Callback to rebuild the whole application.
  VoidCallback get applicationRebuilder;

  /// Class that coordinates navigation for the whole app.
  AppRouter get router;

  /// A service that stores and retrieves app theme mode.
  IThemeService get themeService;

  /// Init theme service with theme from storage or default value.
  Future<void> initTheme();

  /// Shared preferences.
  SharedPreferences get sharedPreferences;
}
