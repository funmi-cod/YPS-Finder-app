import 'package:finder_app/src/core/common/components/app_widget.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final bool enabled;
  final String text;
  final Function()? onPressed;
  final backgroundColor;
  final fontColor;
  final fontWeight;
  final borderColor;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final mainAxisAlignment;
  final BorderRadiusGeometry? borderRadius;
  final double? height;

  final double? width;
  final bool isLoading;
  AppButton({
    required this.text,
    this.enabled = false,
    this.fontWeight,
    this.onPressed,
    this.backgroundColor,
    this.fontColor,
    this.borderColor,
    this.fontSize,
    this.padding,
    this.margin,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.height,
    this.borderRadius,
    this.isLoading = false,
    this.width,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height ?? 45,
      width: width,
      child: TextButton(
        onPressed: enabled ? onPressed : null,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            padding ?? EdgeInsets.symmetric(horizontal: 16),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              side:
                  enabled
                      ? BorderSide(
                        color:
                            borderColor ??
                            backgroundColor ??
                            Theme.of(context).primaryColor,
                      )
                      : BorderSide(color: Colors.grey.withOpacity(.6)),
              borderRadius: borderRadius ?? BorderRadius.circular(10.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            enabled ? backgroundColor : Colors.grey.withOpacity(.6),
          ),
        ),
        child:
            isLoading
                ? Center(child: AppWidget.loadingIndicator(color: Colors.white))
                : FittedBox(
                  child: Row(
                    mainAxisAlignment: mainAxisAlignment,
                    children: [
                      SizedBox(width: 8),
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          text,
                          style: TextStyle(
                            color:
                                enabled
                                    ? fontColor ?? Colors.black
                                    : Colors.white,
                            fontSize:
                                fontSize ??
                                13 * MediaQuery.of(context).textScaleFactor,
                            fontWeight: fontWeight ?? FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
      ),
    );
  }
}
