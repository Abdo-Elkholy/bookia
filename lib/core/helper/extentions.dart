import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<Object?> pushNamed(String route) {
    return Navigator.of(this).pushNamed(route);
  }

  Future<Object?> pushNamedAndRemove(String newRoute) {
    return Navigator.of(this).pushReplacementNamed(newRoute);
  }

  Future<Object?> pushNamedAndRemoveAll(String newRoute) {
    return Navigator.of(this).pushNamedAndRemoveUntil(newRoute, (_) => false);
  }
}
