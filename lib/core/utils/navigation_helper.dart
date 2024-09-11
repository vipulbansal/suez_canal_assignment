import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName, {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  Future<dynamic> push(newRoute) {
    return Navigator.push(this, newRoute);
  }

  Future<dynamic> pushAndRemoveUntil(newRoute, predicate) {
    return Navigator.pushAndRemoveUntil(this, newRoute, predicate);
  }

  void pop() => Navigator.of(this).pop();
}
