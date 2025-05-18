import 'package:flutter/material.dart';
import 'package:ssg_app/utils/app_text_style.dart';

class AppInput {
  final String label;
  final String hint;
  final String? secondHint;
  final double xPadding;
  final double yPadding;
  final bool isPassword;
  final bool required;
  final TextEditingController? controller;
  final TextEditingController? secondController;
  final TextInputType? keyboardType;
  final TextInputType? secondKeyboardType;
  final IconData? icon;
  final void Function()? onIconPressed;
  final bool roundedFull;
  final bool readOnly;
  final String? secondLabel;
  final dynamic onChange;
  final dynamic onChangeSecond;

  const AppInput({
    required this.label,
    required this.hint,
    this.secondHint,
    this.controller,
    this.secondController,
    this.keyboardType,
    this.secondKeyboardType,
    this.xPadding = 0.0,
    this.yPadding = 0.0,
    this.isPassword = false,
    this.required = false,
    this.icon,
    this.onIconPressed,
    this.roundedFull = false,
    this.readOnly = false,
    this.secondLabel,
    this.onChange,
    this.onChangeSecond,
  });
  Widget _inputPadding(Widget child, String textLabel) {
    return Padding(
      padding: EdgeInsets.only(
        left: xPadding,
        right: xPadding,
        top: yPadding,
        bottom: yPadding,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    textLabel,
                    style: AppTextStyle.label,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (required)
                  Text(
                    ' *',
                    style: AppTextStyle.label.copyWith(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  ),
              ],
            ),
          ),
          child,
        ],
      ),
    );
  }

  Widget input() {
    return _inputPadding(
      TextField(
        showCursor: true,
        onChanged: onChange,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(roundedFull ? 50 : 20),
            ),
          ),
          suffixIcon:
              icon != null
                  ? IconButton(
                    icon: Icon(icon),
                    onPressed: onIconPressed ?? () {},
                  )
                  : null,
        ),
      ),
      label,
    );
  }

  Widget dualInput([bool sticky = false, bool secondReadOnly = false]) {
    return secondLabel == null
        ? _inputPadding(
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: keyboardType ?? TextInputType.text,
                  readOnly: readOnly,
                  onChanged: onChange,
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: hint,
                    border: OutlineInputBorder(
                      borderRadius:
                          sticky
                              ? BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              )
                              : BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
              ),
              sticky ? SizedBox.shrink() : SizedBox(width: 20),
              Expanded(
                child: TextField(
                  keyboardType: secondKeyboardType ?? TextInputType.text,
                  readOnly: secondReadOnly,
                  controller: secondController,
                  onChanged: onChangeSecond,
                  decoration: InputDecoration(
                    hintText: secondHint ?? hint,
                    suffixIcon:
                        icon != null
                            ? IconButton(
                              icon: Icon(icon),
                              onPressed: onIconPressed ?? () {},
                            )
                            : null,
                    border: OutlineInputBorder(
                      borderRadius:
                          sticky
                              ? BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              )
                              : BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          label,
        )
        : Row(
          children: [
            Expanded(
              child: _inputPadding(
                TextField(
                  keyboardType: keyboardType ?? TextInputType.text,
                  onChanged: onChange,
                  readOnly: readOnly,
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: hint,
                    border: OutlineInputBorder(
                      borderRadius:
                          sticky
                              ? BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              )
                              : BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
                label,
              ),
            ),
            sticky ? SizedBox.shrink() : SizedBox(width: 20),
            Expanded(
              child: _inputPadding(
                TextField(
                  keyboardType: secondKeyboardType ?? TextInputType.text,
                  onChanged: onChangeSecond,
                  readOnly: secondReadOnly,
                  controller: secondController,
                  decoration: InputDecoration(
                    hintText: secondHint ?? hint,
                    suffixIcon:
                        icon != null
                            ? IconButton(
                              icon: Icon(icon),
                              onPressed: onIconPressed ?? () {},
                            )
                            : null,
                    border: OutlineInputBorder(
                      borderRadius:
                          sticky
                              ? BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              )
                              : BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
                secondLabel!,
              ),
            ),
          ],
        );
  }
}
