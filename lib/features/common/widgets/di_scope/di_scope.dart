import 'package:flutter/material.dart';
import 'package:photostock/features/app/di/app_scope.dart';
import 'package:provider/provider.dart';

/// Factory that returns the dependency scope.
typedef ScopeFactory<T> = T Function();

/// Di container. T - return type(for example [AppScope]).
class DiScope<T> extends StatefulWidget {
  /// Factory that returns the dependency scope.
  final ScopeFactory<T> factory;

  /// The widget below this widget in the tree.
  final Widget child;

  /// Create an instance [DiScope].
  const DiScope({
    required this.factory,
    required this.child,
    super.key,
  });

  @override
  State<DiScope<T>> createState() => _DiScopeState<T>();
}

class _DiScopeState<T> extends State<DiScope<T>> {
  late T scope;

  @override
  void initState() {
    super.initState();
    scope = widget.factory();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedContainer<T>(
      child: widget.child,
      scope: scope,
    );
  }
}

/// DI using inherited widget.
class InheritedContainer<T> extends InheritedWidget {
  /// Default constructor.
  const InheritedContainer({
    required super.child,
    required this.scope,
    super.key,
  });

  /// Scope data.
  final T scope;

  /// Maybe of method.
  static T? maybeOf<T>(BuildContext context) {
    return context
        .getInheritedWidgetOfExactType<InheritedContainer<T>>()
        ?.scope;
  }

  /// Read method.
  static T read<T>(BuildContext context) {
    final result = maybeOf<T>(context);
    assert(result != null, 'No InheritedContainer found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(InheritedContainer<T> oldWidget) => false;
}
