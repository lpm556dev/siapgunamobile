import 'package:flutter/material.dart';
import 'package:ssg_app/utils/app_colors.dart';
import 'package:ssg_app/utils/app_text_style.dart';

class AppButton {
  final String text;
  final dynamic onPressedButton;
  final bool fullWidth;
  final bool roundedFull;
  final bool bordered;
  final Color? bgColor;
  final Color? fgColor;
  final Color? sideColor;
  final IconData? isIcon;
  final double? xPadding;
  final double? yPadding;
  final double? fnSize;

  const AppButton({
    required this.text,
    required this.onPressedButton,
    this.fullWidth = false,
    this.roundedFull = false,
    this.bordered = false,
    this.bgColor,
    this.fgColor,
    this.isIcon,
    this.sideColor,
    this.xPadding,
    this.yPadding,
    this.fnSize
  });

  Widget _paddingButton(Widget child) {
    return Padding(
      padding: EdgeInsets.only(
        left: xPadding ?? 35.0,
        right: xPadding ?? 35.0,
        top: yPadding ?? 10.0,
        bottom: yPadding ?? 10.0,
      ),
      child: child,
    );
  }

  Widget build() {
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize:
            fullWidth ? const Size(double.infinity, 50) : const Size(100, 50),
        backgroundColor: bgColor ?? AppColors.primaryColor,
        foregroundColor: fgColor ?? AppColors.lightColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(roundedFull ? 50 : 20),
          side:
              bordered
                  ? BorderSide(
                    color: sideColor ?? AppColors.primaryColor,
                    width: 1.0,
                  )
                  : BorderSide.none,
        ),
      ),
      onPressed: onPressedButton,
      child: _paddingButton(
        Text(
          text,
          style: AppTextStyle.buttonText.copyWith(
            fontSize: fnSize,
            color: fgColor ?? AppColors.lightColor,
          ),
        ),
      ),
    );
  }

  Widget withIcon() {
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize:
            fullWidth ? const Size(double.infinity, 50) : const Size(100, 50),
        backgroundColor: bgColor,
        foregroundColor: fgColor,
        side:
            bordered
                ? BorderSide(
                  color: sideColor ?? AppColors.primaryColor,
                  width: 1.0,
                )
                : BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(roundedFull ? 50 : 20),
        ),
      ),
      onPressed: onPressedButton,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(isIcon),
          Padding(
            padding: const EdgeInsets.only(
              left: 30.0,
              right: 25.0,
              top: 10.0,
              bottom: 10.0,
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: AppTextStyle.buttonText.copyWith(color: fgColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget menu() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Column(
        children: [
          IconButton.filled(
            iconSize: 30,
            style: IconButton.styleFrom(
              foregroundColor: AppColors.secondaryColor,
              backgroundColor: AppColors.milkFrothColor
            ),
            onPressed: onPressedButton, icon: Icon(isIcon),
          ),
          Text(text, style: AppTextStyle.label.copyWith(color: AppColors.darkColor, fontWeight: FontWeight.w600),),
        ],
      ),
    );
  }
}
