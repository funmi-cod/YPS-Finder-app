import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      default:
        return CupertinoPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route specified for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
