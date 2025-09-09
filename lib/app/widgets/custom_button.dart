import 'package:flutter/material.dart';
import 'package:go_burble_new/app/data/app_colors.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget? childWidget;
  final EdgeInsetsGeometry? padding, margin;
  final Color? bgColor, borderColor;
  final BorderRadiusGeometry? borderRadius;
  final TextStyle? textStyle;

  const CustomButton({
    super.key,
    this.onPressed,
    this.childWidget,
    this.padding,
    this.margin,
    this.bgColor,
    this.borderColor,
    this.borderRadius,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            overlayColor: AppColors.whiteColor,
            padding: padding ?? const EdgeInsets.only(left: 20, right: 20),
            backgroundColor: bgColor ?? AppColors.buttonBackgroundColor,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: borderColor ?? Colors.transparent),
              borderRadius: borderRadius ?? BorderRadius.circular(5),
            ),
            textStyle: textStyle),
        onPressed: onPressed,
        child: childWidget,
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget? childWidget;
  final Widget? iconWidget;
  final IconData? iconData;
  final EdgeInsetsGeometry? padding, margin;
  final Color? bgColor, borderColor;
  final Color? iconColor;
  final double? size;
  final BorderRadiusGeometry? borderRadius;
  final TextStyle? textStyle;

  const CustomIconButton({
    super.key,
    this.onPressed,
    this.childWidget,
    this.iconWidget,
    this.iconData,
    this.padding,
    this.margin,
    this.bgColor,
    this.borderColor,
    this.iconColor,
    this.size,
    this.borderRadius,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            overlayColor: AppColors.whiteColor,
            padding: padding ?? const EdgeInsets.only(left: 20, right: 20),
            backgroundColor: bgColor ?? AppColors.appBackgroundColor,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: borderColor ?? Colors.transparent),
              borderRadius: borderRadius ?? BorderRadius.circular(5),
            ),
            textStyle: textStyle),
        onPressed: onPressed,
        icon: iconWidget ??
            Icon(
              iconData,
              color: iconColor ?? AppColors.appBackgroundColor,
              size: size ?? 25,
            ),
        label: childWidget!,
      ),
    );
  }
}
