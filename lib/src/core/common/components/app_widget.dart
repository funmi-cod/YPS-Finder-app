import 'package:flutter/material.dart';

class AppWidget {
  static Widget loadingIndicator({double? radius, Color? color}) {
    return SizedBox(
      height: radius ?? 25,
      width: radius ?? 25,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        backgroundColor: color ?? Colors.transparent,
      ),
    );
  }
}
