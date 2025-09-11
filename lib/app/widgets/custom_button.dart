import 'package:flutter/material.dart';
import 'package:go_burble_new/app/data/app_colors.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget? childWidget;

  final Color? bgColor, borderColor;
  final BorderRadiusGeometry? borderRadius;


  final double? height;
  final double? width;

  const CustomButton({
    super.key,
    this.onPressed,
    this.childWidget,

    this.bgColor,
    this.borderColor,
    this.borderRadius,

    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          height: height,
          width:width ,
          decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: bgColor,


          ),
          child: childWidget),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget? childWidget;

  final Color? bgColor, borderColor;

  final BorderRadiusGeometry? borderRadius;

  final double? height;
  final double? width;

  const CustomIconButton({
    super.key,
    this.onPressed,
    this.childWidget,

    this.bgColor,
    this.borderColor,

    this.borderRadius,

    this.height,
    this.width
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
      height: height,
        width:width ,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: bgColor,
          border: Border.all(color: borderColor!)

        ),
        child: childWidget),
    );
  }
}
