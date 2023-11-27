import 'package:flutter/material.dart';
import 'package:photostock/core/di/inherited_container.dart';

/// Factory that returns the dependency scope.
typedef ScopeFactory<T> = T Function();

/// Di container, T - return type.
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
