import 'package:finder_app/src/core/utils/constant/route_constant.dart';
import 'package:finder_app/src/features/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteLiterals.homeScreen:
        return CupertinoPageRoute(
          builder: (_) => const HomeScreen(),
          settings: RouteSettings(name: settings.name),
        );
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
