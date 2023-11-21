import 'package:flutter/material.dart';

/// Widget for a note form.
class NoteForm extends StatelessWidget {
  /// Create an instance of [NoteForm]
  const NoteForm({
    required this.formKey,
    required this.controller,
    required this.onSaveNote,
    required this.isEnabled,
    super.key,
  });

  /// [GlobalKey] for validation.
  final GlobalKey<FormState> formKey;

  /// [TextEditingController] for [NoteForm].
  final TextEditingController controller;

  /// Save note callback.
  final VoidCallback onSaveNote;

  /// Is [NoteForm] enabled.
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            enabled: isEnabled,
            controller: controller,
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'Please enter note';
              } else if (text == text.toLowerCase()) {
                return 'Please capitalize first letter';
              }

              return null;
            },
          ),
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: isEnabled
                  ? () {
                      if (formKey.currentState!.validate()) {
                        onSaveNote();
                      }
                    }
                  : null,
              // TODO(me): Remove hardcode.
              child: const Text(
                'Save',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
