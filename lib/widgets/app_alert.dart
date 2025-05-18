import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ssg_app/utils/app_colors.dart';
import 'package:ssg_app/utils/app_text_style.dart';

class AppAlert {
  static void snakBarShow(BuildContext context, String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content, style: AppTextStyle.caption),
        duration: Duration(seconds: 3),
        dismissDirection: DismissDirection.horizontal,
        showCloseIcon: true,
        backgroundColor: AppColors.primaryColor,
        closeIconColor: AppColors.lightColor,
      ),
    );
  }

  static void popUp(BuildContext ctx, List<Widget> content) {
    showDialog(
      context: ctx,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: content.map((widget) {
                  if (widget is QrImageView) {
                    return SizedBox(
                      width: 200,
                      height: 200,
                      child: widget,
                    );
                  }
                  return widget;
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }

  static void showAlertDialog(
    BuildContext context,
    String title,
    String message,
    String button, [
    String? button2,
    void Function()? onPressed,
    void Function()? onPressed2,
    fgBtnColor = AppColors.lightColor,
    bgBtnColor = AppColors.primaryColor,
    fgSecondBtnColor = AppColors.lightColor,
    bgSecondBtnColor = AppColors.dangerColor,
    MainAxisAlignment actionsAlignment = MainAxisAlignment.spaceBetween,
  ]) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            contentPadding: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: AppColors.lightColor,
            title: Text(
              title,
              style: AppTextStyle.title2,
              textAlign: TextAlign.center,
            ),
            content: Container(
              margin: EdgeInsets.all(12),
              child: Text(message, style: AppTextStyle.caption),
            ),
            actionsAlignment: actionsAlignment,
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: bgBtnColor,
                  foregroundColor: fgBtnColor,
                ),
                onPressed:
                    () =>
                        onPressed != null
                            ? onPressed()
                            : Navigator.of(context).pop(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 1,
                  ),
                  child: Text(button, style: AppTextStyle.buttonText),
                ),
              ),
              if (button2 != null)
                TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    backgroundColor: bgSecondBtnColor,
                    foregroundColor: fgSecondBtnColor,
                  ),
                  onPressed:
                      () =>
                          onPressed2 != null
                              ? onPressed2()
                              : Navigator.of(context).pop(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 1,
                    ),
                    child: Text(button2, style: AppTextStyle.buttonText),
                  ),
                ),
            ],
          ),
    );
  }
}
