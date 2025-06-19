import 'package:flutter/material.dart';
import 'package:eccomerce_app/core/theming/styles_manager.dart';
import 'color_manager.dart';

ThemeData appTheme() {
  return ThemeData.light().copyWith(
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    textTheme: TextTheme(
      bodyMedium: Styles.medium20White,
      headlineLarge: Styles.semi24White,
      headlineMedium: Styles.semi20Primary,
      headlineSmall: Styles.regular12Text,
      bodyLarge: Styles.semi16TextWhite,
      labelSmall: Styles.medium14Category,
      displayLarge: Styles.medium18White,
      displayMedium: Styles.medium18Header

    ),
    primaryColor: ColorManager.whiteColor,
    cardColor: ColorManager.orangeColor,
    scaffoldBackgroundColor: ColorManager.whiteColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorManager.whiteColor,
      elevation: 0,
      iconTheme: IconThemeData(color: ColorManager.primaryColor),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        showUnselectedLabels: false, showSelectedLabels: false, elevation: 0),
  );
}

// ThemeData darkTheme() {
//   return ThemeData.dark().copyWith(
//     checkboxTheme: CheckboxThemeData(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//     ),
//     textTheme: TextTheme(
//         bodyMedium: Styles.medium20White,
//         headlineLarge: Styles.semi24White,
//         headlineMedium: Styles.semi20Primary,
//         headlineSmall: Styles.regular12Text,
//         bodyLarge: Styles.semi16TextWhite,
//         labelSmall: Styles.medium14Category,
//         displayLarge: Styles.medium18White,
//         displayMedium: Styles.medium18Header
//     ),
//     primaryColor: ColorManager.whiteColor,
//     cardColor: ColorManager.orangeColor,
//     scaffoldBackgroundColor: ColorManager.blackColor,
//     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//       selectedIconTheme: IconThemeData(size: 24),
//       unselectedIconTheme: IconThemeData(size: 24),
//       showUnselectedLabels: true,
//       selectedItemColor: ColorManager.primaryColor,
//       unselectedItemColor: Colors.white,
//       elevation: 0,
//       backgroundColor: ColorManager.primaryColor,
//     ),
//     appBarTheme: const AppBarTheme(
//       backgroundColor: ColorManager.blackColor,
//       iconTheme: IconThemeData(color: ColorManager.whiteColor, size: 24),
//     ),
//   );
// }
