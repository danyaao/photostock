import 'package:flutter/material.dart';

/// Widget for left align text.
class LeftAlignText extends StatelessWidget {
  /// Create instance of [LeftAlignText].
  const LeftAlignText({
    required this.text,
    required this.textStyle,
    super.key,
  });

  /// Text to show.
  final String text;

  /// Text style.
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
