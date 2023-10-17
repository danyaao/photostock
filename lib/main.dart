import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:photostock/api/unsplash_api/unsplash_api.dart';
import 'package:photostock/config/app_config.dart';
import 'package:photostock/config/environment/build_types.dart';
import 'package:photostock/config/environment/environment.dart';
import 'package:photostock/config/urls.dart';
import 'package:photostock/features/common/repositories/photo_repository/photo_repository.dart';
import 'package:photostock/features/common/repositories/photo_repository/photo_repository_impl.dart';
import 'package:photostock/runner.dart';

/// Main entry point of app.
void main() async {
  // Проверка, что работает
  final logger = Logger();
  final dio = Dio();
  final service = UnsplashService(dio);
  final IPhotoRepository photoRepository =
      PhotoRepository(unsplashService: service);
  final photos = await photoRepository.getPhotosFromNetwork();

  logger
    ..i(photos.first.username)
    ..i(photos.length);

  Environment.init(
    buildType: BuildType.debug,
    config: AppConfig(
      url: Url.testUrl,
    ),
  );

  run();
}
