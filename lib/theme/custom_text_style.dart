import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension on TextStyle {
  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }
}

/// Collection of pre-defined text styles for customizing text appearance
/// Categorized by different font families and weights
class CustomTextStyle {
  /// Body text styles
  static TextStyle get bodyMediumOnPrimary =>
    theme.textTheme.bodyMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
  static TextStyle get bodySmallPrimary => theme.textTheme.bodySmall!.copyWith(
    color: theme.colorScheme.primary,
    fontSize: 10.fSize,
    );
  static TextStyle get bodySmallPrimary_1 => 
    theme.textTheme.bodySmall!.copyWith(
      color: theme.colorScheme.primary,
    );

  /// Title text styles
  static TextStyle get titleMedium18 => theme.textTheme.titleMedium!.copyWith(
    fontSize: 18.fSize,
  );
  static TextStyle get titleMediumWhiteA700 =>
    theme.textTheme.titleMedium!.copyWith(
      color: appTheme.whiteA700,
    );
}