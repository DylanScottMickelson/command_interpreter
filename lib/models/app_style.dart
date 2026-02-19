import 'package:flutter/material.dart';

class AppStyle {
  static const ShapeBorder shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(13)),
  );

  static TextStyle getHintStyle({Color? textColor, double? size}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      color: textColor ?? Colors.black,
      fontSize: size ?? 13.369,
      height: 1,
      shadows: const [
        Shadow(
          color: Colors.black38,
          offset: Offset(-0.369, 0.1369),
          blurRadius: 1.369,
        ),
      ],
    );
  }

  static InputDecoration getDefaultInputDecoration(
    String hint, {
    Color? fillColor,
    Color? borderColor,
    Color? textColor,
  }) {
    return InputDecoration(
      hintText: hint,
      label: Text(hint),
      counterStyle: getHintStyle(textColor: textColor),
      floatingLabelStyle: getHintStyle(textColor: textColor),
      helperStyle: getHintStyle(textColor: textColor),
      hintStyle: getHintStyle(textColor: textColor),
      labelStyle: getHintStyle(textColor: textColor),
      prefixStyle: getHintStyle(textColor: textColor),
      errorStyle: getHintStyle(textColor: textColor),
      suffixStyle: getHintStyle(textColor: textColor),
      filled: true,
      fillColor: fillColor ?? Colors.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9.369),
        borderSide: BorderSide(width: 1, color: borderColor ?? Colors.black),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9.369),
        borderSide: const BorderSide(width: 2, color: Colors.red),
      ),
    );
  }
}
