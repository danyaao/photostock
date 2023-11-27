import 'package:flutter/material.dart';

/// Widget for arrow back button.
class ArrowBackButton extends StatelessWidget {
  /// Create an instance of [ArrowBackButton].
  const ArrowBackButton({
    required this.onBackButtonTap,
    super.key,
  });

  /// On tap callback.
  final VoidCallback onBackButtonTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          top: 30,
        ),
        child: TextButton(
          onPressed: onBackButtonTap,
          child: const Row(
            children: [
              Icon(
                Icons.arrow_back_ios,
                size: 10,
                color: Colors.white,
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                // TODO(me): Remove hardcode.
                'Back',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
