import 'package:photostock/config/app_config.dart';
import 'package:photostock/config/environment/build_types.dart';
import 'package:photostock/config/environment/environment.dart';
import 'package:photostock/config/urls.dart';
import 'package:photostock/runner.dart';

/// Main entry point of app.
void main() {
  Environment.init(
    buildType: BuildType.release,
    config: AppConfig(
      url: Url.prodUrl,
    ),
  );

  run();
}
