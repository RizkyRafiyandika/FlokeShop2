import 'package:flokemon/core/utils/size_utils.dart';
import 'package:flokemon/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flokemon/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlueGray => BoxDecoration(
        color: appTheme.blueGray200,
      );
  static BoxDecoration get fillBlueGrayF => BoxDecoration(
        color: appTheme.blueGray200F9,
      );
  static BoxDecoration get fillDeepOrange => BoxDecoration(
        color: appTheme.deepOrange700.withOpacity(0.98),
      );
  static BoxDecoration get fillLime => BoxDecoration(
        color: appTheme.lime20001,
      );
  static BoxDecoration get fillLime20002 => BoxDecoration(
        color: appTheme.lime20002,
      );
  static BoxDecoration get fillRedF => BoxDecoration(
        color: appTheme.red400F9,
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
      );
  static BoxDecoration get fillYellowF => BoxDecoration(
        color: appTheme.yellow500F9,
      );

  // Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration();
  static BoxDecoration get outlineGray9000c => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: appTheme.gray9000c,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              2,
              30,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineGrayC => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: appTheme.gray9000c,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              30,
            ),
          ),
        ],
      );
}

class BorderRadiusStyle {
  // Rounded borders
  static BorderRadius get roundedBorder16 => BorderRadius.circular(
        16.h,
      );
  static BorderRadius get roundedBorder3 => BorderRadius.circular(
        3.h,
      );
  static BorderRadius get roundedBorder9 => BorderRadius.circular(
        9.h,
      );
}

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;

// StrokeAlign get strokeAlignCenter => StrokeAlign.center;

// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;
