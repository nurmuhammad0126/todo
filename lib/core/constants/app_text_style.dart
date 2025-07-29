import 'package:flutter/material.dart';
import 'package:todo/core/constants/app_colors.dart';

class AppTextStyles {
  AppTextStyles._(); // static class

  static const _fontFamily = 'Lato';

  static final TextStyle s10w400 = _style(10, FontWeight.w400);
  static final TextStyle s10w700 = _style(10, FontWeight.w700);
  static final TextStyle s10w800 = _style(10, FontWeight.w800);

  static final TextStyle s12w400 = _style(12, FontWeight.w400);
  static final TextStyle s12w700 = _style(12, FontWeight.w700);
  static final TextStyle s12w800 = _style(12, FontWeight.w800);

  static final TextStyle s14w400 = _style(14, FontWeight.w400);
  static final TextStyle s14w700 = _style(14, FontWeight.w700);
  static final TextStyle s14w800 = _style(14, FontWeight.w800);

  static final TextStyle s16w400 = _style(16, FontWeight.w400);
  static final TextStyle s16w700 = _style(16, FontWeight.w700);
  static final TextStyle s16w800 = _style(16, FontWeight.w800);

  static final TextStyle s18w400 = _style(18, FontWeight.w400);
  static final TextStyle s18w700 = _style(18, FontWeight.w700);
  static final TextStyle s18w800 = _style(18, FontWeight.w800);

  static final TextStyle s20w400 = _style(20, FontWeight.w400);
  static final TextStyle s20w700 = _style(20, FontWeight.w700);
  static final TextStyle s20w800 = _style(20, FontWeight.w800);

  static final TextStyle s22w400 = _style(22, FontWeight.w400);
  static final TextStyle s22w700 = _style(22, FontWeight.w700);
  static final TextStyle s22w800 = _style(22, FontWeight.w800);

  static final TextStyle s24w400 = _style(24, FontWeight.w400);
  static final TextStyle s24w700 = _style(24, FontWeight.w700);
  static final TextStyle s24w800 = _style(24, FontWeight.w800);

  static final TextStyle s26w400 = _style(26, FontWeight.w400);
  static final TextStyle s26w700 = _style(26, FontWeight.w700);
  static final TextStyle s26w800 = _style(26, FontWeight.w800);

  static TextStyle _style(int size, FontWeight weight) {
    return TextStyle(
      fontSize: size.toDouble(),
      fontWeight: weight,
      fontFamily: _fontFamily,
      color: AppColors.surface,
    );
  }
}