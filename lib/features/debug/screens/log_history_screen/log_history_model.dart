import 'package:elementary/elementary.dart';
import 'package:photostock/features/common/service/log_history/log_history_service_impl.dart';
import 'package:photostock/features/debug/screens/log_history_screen/log_history_screen.dart';

/// Model for [LogHistoryScreen].
class LogHistoryModel extends ElementaryModel {
  /// Remove all content from logs history file.
  Future<void> clearLogHistory() async {
    await const LogHistoryServiceImpl().clearLogHistory();
  }

  /// Upload logs history file.
  Future<String> loadFile() async {
    return const LogHistoryServiceImpl().loadFile();
  }
}
