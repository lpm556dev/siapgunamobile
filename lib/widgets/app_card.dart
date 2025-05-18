import 'package:flutter/material.dart';
import 'package:ssg_app/utils/app_colors.dart';

class AppCard {
  static Widget bordered(Widget child, [Color color = Colors.white, double radius = 10]) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
        side: BorderSide(width: 1.0, color: AppColors.tangledColor),
      ),
      shadowColor: AppColors.darkColor,
      child: child,
    );
  }

  static Widget fill(Widget child, [Color color = Colors.white, double radius = 10]) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      shadowColor: AppColors.darkColor,
      child: child,
    );
  }
}
