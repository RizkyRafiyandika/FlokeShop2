import 'package:flokemon/core/utils/size_utils.dart';
import 'package:flokemon/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLarge18 => theme.textTheme.bodyLarge!.copyWith(
        fontSize: 18.fSize,
      );
  static get bodyMedium13 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 13.fSize,
      );
  static get bodyMedium13_1 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 13.fSize,
      );
  static get bodyMediumAbhayaLibreBluegray400 =>
      theme.textTheme.bodyMedium!.abhayaLibre.copyWith(
        color: appTheme.blueGray400,
      );
  // Display text style
  static get displayMediumAmberA700 => theme.textTheme.displayMedium!.copyWith(
        color: appTheme.amberA700,
        fontWeight: FontWeight.w700,
      );
  static get displayMediumIndigo900 => theme.textTheme.displayMedium!.copyWith(
        color: appTheme.indigo900,
        fontWeight: FontWeight.w700,
      );
  static get displayMediumRed900 => theme.textTheme.displayMedium!.copyWith(
        color: appTheme.red900,
        fontWeight: FontWeight.w700,
      );
  static get displayMediumRed900bb => theme.textTheme.displayMedium!.copyWith(
        color: appTheme.red900Bb,
        fontWeight: FontWeight.w700,
      );
  static get displayMediumRedA70001 => theme.textTheme.displayMedium!.copyWith(
        color: appTheme.redA70001,
        fontWeight: FontWeight.w700,
      );
  static get displaySmallAmberA700 => theme.textTheme.displaySmall!.copyWith(
        color: appTheme.amberA700,
      );
  static get displaySmallIndigo900 => theme.textTheme.displaySmall!.copyWith(
        color: appTheme.indigo900,
      );
  static get displaySmallRed900 => theme.textTheme.displaySmall!.copyWith(
        color: appTheme.red900,
      );
  // Headline text style
  static get headlineSmallInterBlack90001 =>
      theme.textTheme.headlineSmall!.inter.copyWith(
        color: appTheme.black90001,
      );
  // Label text style
  static get labelLargeBlack90001 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black90001,
      );
  static get labelMediumBlack90001 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.black90001,
      );
  // Title text style
  static get titleLargeAbelBluegray900 =>
      theme.textTheme.titleLarge!.abel.copyWith(
        color: appTheme.blueGray900,
        fontWeight: FontWeight.w400,
      );
  static get titleLargeAmberA700 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.amberA700,
      );
  static get titleLargeBlack900 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w400,
      );
  static get titleLargeIndigo900 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.indigo900,
      );
  static get titleLargeInterWhiteA700 =>
      theme.textTheme.titleLarge!.inter.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w600,
      );
  static get titleLargeRed900 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.red900,
      );
  static get titleLargeRedA70001 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.redA70001,
      );
  static get titleLargeRegular => theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w400,
      );
  static get titleLargeRegular22 => theme.textTheme.titleLarge!.copyWith(
        fontSize: 22.fSize,
        fontWeight: FontWeight.w400,
      );
}

extension on TextStyle {
  TextStyle get asap {
    return copyWith(
      fontFamily: 'Asap',
    );
  }

  TextStyle get anonymousPro {
    return copyWith(
      fontFamily: 'Anonymous Pro',
    );
  }

  TextStyle get kumbhSans {
    return copyWith(
      fontFamily: 'Kumbh Sans',
    );
  }

  TextStyle get abel {
    return copyWith(
      fontFamily: 'Abel',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get abhayaLibre {
    return copyWith(
      fontFamily: 'Abhaya Libre',
    );
  }
}
