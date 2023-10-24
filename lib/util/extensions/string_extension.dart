import 'dart:ui';

/// String extension.
extension StringExtension on String {
  /// Color from String.
  ///
  /// Try parse Hex String to Color, return [Color] or null
  Color? toColor() {
    final parsedString = int.tryParse(substring(1, 7), radix: 16);
    if (parsedString == null) {
      return null;
    }
    final color = Color(parsedString + 0xFF000000);

    return color;
  }
}
