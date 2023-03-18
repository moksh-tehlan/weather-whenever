part of 'text_styles.dart';

extension TextStyleExtension on TextStyle {
  TextStyle withOpacity(double opacity) {
    return copyWith(color: color!.withOpacity(opacity));
  }

  TextStyle withColor(Color newColor) {
    return copyWith(color: newColor);
  }
}

// extension TextThemeExtension on BuildContext {
//   TextTheme get textTheme {
//     return Theme.of(this).textTheme;
//   }
// }

// extension FontFamily on TextStyle {
//   TextStyle get cabin {
//     return copyWith(fontFamily: 'Cabin');
//   }
// }

extension FontWeightExtension on TextStyle {
  TextStyle get bold {
    return copyWith(fontWeight: CustomFontWeights.bold);
  }

  TextStyle get semiBold {
    return copyWith(fontWeight: CustomFontWeights.semiBold);
  }

  TextStyle get regular {
    return copyWith(fontWeight: CustomFontWeights.regular);
  }

  TextStyle get light {
    return copyWith(fontWeight: CustomFontWeights.light);
  }

  TextStyle get medium {
    return copyWith(fontWeight: CustomFontWeights.medium);
  }
}

extension FontSizeExtension on TextStyle {
  TextStyle get size10 {
    return copyWith(fontSize: 10);
  }

  TextStyle get size11 {
    return copyWith(fontSize: 11);
  }

  TextStyle get size12 {
    return copyWith(fontSize: 12);
  }

  TextStyle get size13 {
    return copyWith(fontSize: 13);
  }

  TextStyle get size14 {
    return copyWith(fontSize: 14);
  }

  TextStyle get size16 {
    return copyWith(fontSize: 16);
  }

  TextStyle get size18 {
    return copyWith(fontSize: 18);
  }

  TextStyle get size19 {
    return copyWith(fontSize: 19);
  }

  TextStyle get size20 {
    return copyWith(fontSize: 20);
  }

  TextStyle get size22 {
    return copyWith(fontSize: 22);
  }

  TextStyle get size24 {
    return copyWith(fontSize: 24);
  }

  TextStyle get size25 {
    return copyWith(fontSize: 25);
  }

  TextStyle get size26 {
    return copyWith(fontSize: 25);
  }

  TextStyle get size28 {
    return copyWith(fontSize: 25);
  }

  TextStyle get size32 {
    return copyWith(fontSize: 32);
  }

  TextStyle get size30 {
    return copyWith(fontSize: 30);
  }

  TextStyle get size35 {
    return copyWith(fontSize: 35);
  }

  TextStyle get size40 {
    return copyWith(fontSize: 40);
  }

  TextStyle get size42 {
    return copyWith(fontSize: 42);
  }

}
