import 'package:flutter/material.dart';

import '../data/app_colors.dart';

class CustomDropDownFormField extends StatelessWidget {
  final InputBorder? focusedBorder, enabledBorder, errorBorder;
  final InputDecoration? decoration;
  final Widget? prefixIcon, suffixIcon;
  final String? hintText;
  final Color? fillColor, cursorColor, borderColor;
  final bool? filled, obscureText, readOnly;
  final TextStyle? textStyle, hintStyle;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function(PointerDownEvent)? onTapOutside;
  final ValueChanged<Object?>? onChanged;
  final FormFieldValidator<Object?>? validator;
  final FormFieldSetter<Object?>? onSaved;
  final Function(String)? onFieldSubmitted;
  final Function()? onEditingComplete;
  final AutovalidateMode? autoValidateMode;
  final int? maxLines;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final BorderRadius? borderRadiusAll;
  final EdgeInsets? contentPadding;
  final ContentInsertionConfiguration? contentInsertionConfiguration;
  final double? width;
  final double? height;
  final List<DropdownMenuItem<dynamic>>? items;
  const CustomDropDownFormField(
      {super.key,
      this.hintText,
       this.controller,
      this.focusNode,
      this.onTapOutside,
      this.onChanged,
      this.prefixIcon,
      this.suffixIcon,
      this.focusedBorder,
      this.enabledBorder,
      this.errorBorder,
      this.decoration,
      this.fillColor,
      this.filled,
      this.cursorColor,
      this.borderColor,
      this.textStyle,
      this.hintStyle,
      this.obscureText,
      this.keyboardType,
      this.validator,
      this.onSaved,
      this.onFieldSubmitted,
      this.onEditingComplete,
      this.autoValidateMode,
      this.maxLines,
      this.maxLength,
      this.textInputAction,
      this.borderRadiusAll,
      this.contentInsertionConfiguration,
      this.contentPadding,
      this.width,
      this.readOnly,
      this.items,
      this.height
      });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: DropdownButtonFormField<dynamic>(
        focusNode: focusNode,
        onChanged: onChanged,
        onSaved: onSaved,
        validator: validator,

        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: AppColors.blackColor,
        ),

        style: textStyle ??
            const TextStyle(
              color: AppColors.subtitleColor,
              decoration: TextDecoration.none,
              decorationThickness: 0,
            ),

        autovalidateMode: autoValidateMode,

        // Allow unlimited number of lines for multiline input
        decoration: decoration ??
            InputDecoration(
              // contentPadding: EdgeInsets.all(8.0),

              enabledBorder: enabledBorder ??
                  OutlineInputBorder(
                    borderRadius: borderRadiusAll ??
                        const BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                        color: borderColor ?? AppColors.buttonBackgroundColor,
                        width: 2),
                  ),
              focusedBorder: focusedBorder ??
                  OutlineInputBorder(
                    borderRadius: borderRadiusAll ??
                        const BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                        color: borderColor ?? AppColors.buttonBackgroundColor,
                        width: 2),
                  ),
              errorBorder: errorBorder ??
                  OutlineInputBorder(
                    borderRadius: borderRadiusAll ??
                        const BorderRadius.all(Radius.circular(20)),
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                  ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: borderRadiusAll ??
                    const BorderRadius.all(Radius.circular(20)),
                borderSide:
                    BorderSide(color: borderColor ?? Colors.red, width: 1),
              ),
              border: OutlineInputBorder(
                borderRadius: borderRadiusAll ??
                    const BorderRadius.all(Radius.circular(20)),
                borderSide:
                    BorderSide(color: borderColor ?? Colors.red, width: 1),
              ),
              errorMaxLines: 2,
              errorStyle: const TextStyle(
                  color: Colors.red, fontSize: 12, fontWeight: FontWeight.bold),

              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,

              // errorStyle: poppinsTextStyle.copyWith(fontSize: 10, color: AppColors.errorColor),
              hintText: hintText,
              hintStyle:
                  hintStyle ?? const TextStyle(color: AppColors.subtitleColor),
              fillColor: fillColor,
              filled: filled ?? true,
            ),
        items: items,
      ),
    );
  }
}
