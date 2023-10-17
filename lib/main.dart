import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:photostock/api/unsplash_api/unsplash_api.dart';
import 'package:photostock/config/app_config.dart';
import 'package:photostock/config/environment/build_types.dart';
import 'package:photostock/config/environment/environment.dart';
import 'package:photostock/config/urls.dart';
import 'package:photostock/runner.dart';

/// Main entry point of app.
void main() {
  // Проверка, что работает
  final logger = Logger();
  final dio = Dio();
  final service = UnsplashService(dio);
  const clientId =
      '896d4f52c589547b2134bd75ed48742db637fa51810b49b607e37e46ab2c0043';
  service
      .getPhotos(
    clientId: clientId,
  )
      .then((value) {
    logger
      ..i(value.first.user.username)
      ..i(value.length);
  }, onError: (e) {
    logger.i(e);
  });

  Environment.init(
    buildType: BuildType.debug,
    config: AppConfig(
      url: Url.testUrl,
    ),
  );

  run();
}
