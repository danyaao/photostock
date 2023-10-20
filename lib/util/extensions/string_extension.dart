import 'dart:ui';

/// String extension.
extension StringExtension on String {
  /// Color from String.
  Color toColor() {
    final color = Color(int.parse(substring(1, 7), radix: 16) + 0xFF000000);
    return color;
  }
}
