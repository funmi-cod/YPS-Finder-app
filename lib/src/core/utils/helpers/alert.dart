import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void showInSnackBar({
  required String value,
  required BuildContext context,
  Color? color,
  Duration? duration,
  void Function(Flushbar flushbar)? onTap,
}) {
  if (value.isEmpty) return;
  Flushbar(
    message: value,
    flushbarPosition: FlushbarPosition.BOTTOM,
    backgroundColor: color ?? Colors.red,
    isDismissible: true,
    duration: duration ?? Duration(seconds: 2),

    onTap: onTap,
  ).show(context);
}

showAlertMessage(
  BuildContext context, {
  required String message,
  Color? backgroundColor,
}) {
  showInSnackBar(value: message, context: context, color: backgroundColor);
}
