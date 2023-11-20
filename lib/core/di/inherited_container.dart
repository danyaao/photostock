import 'package:flutter/material.dart';

/// DI container as inherited widget.
class InheritedContainer<T> extends InheritedWidget {
  /// Default constructor.
  const InheritedContainer({
    required super.child,
    required this.scope,
    super.key,
  });

  /// Scope to provide.
  final T scope;

  /// Maybe read method to get [T] or [Null].
  static T? maybeRead<T>(BuildContext context) {
    return context
        .getInheritedWidgetOfExactType<InheritedContainer<T>>()
        ?.scope;
  }

  /// Read method to get [T] or [Exception].
  static T read<T>(BuildContext context) {
    final result = maybeRead<T>(context);
    assert(result != null, 'No InheritedContainer<$T> found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(InheritedContainer<T> oldWidget) => false;
}
