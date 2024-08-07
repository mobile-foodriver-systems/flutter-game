import 'package:flutter/material.dart';
import 'package:food_driver/core/ui/assets/assets_catalog.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
// import 'package:pinput/pinput.dart';

ThemeData appTheme(BuildContext context) {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.background,
    dialogBackgroundColor: AppColors.dialogBackgroundColor,
    appBarTheme: const AppBarTheme(
      color: AppColors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      filled: true,
      fillColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.error)) {
          return AppColors.textFieldError;
        } else if (states.contains(WidgetState.focused)) {
          return AppColors.white;
        }
        return AppColors.textFieldGray;
      }),
      contentPadding:
          const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
      labelStyle: const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: AppColors.lightGray,
      ),
      floatingLabelStyle: const TextStyle(
        shadows: [
          Shadow(
            color: AppColors.midGray,
            offset: Offset(0, 14),
          ),
        ],
        fontSize: 12.0,
        color: Colors.transparent,
        decorationColor: AppColors.midGray,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: AppColors.focusedBorder),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: AppColors.errorBorder),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        minimumSize: const Size.fromHeight(52),
        textStyle: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
        elevation: 0,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        foregroundColor: AppColors.textButtonGray,
        disabledForegroundColor: AppColors.lightGray,
        minimumSize: const Size.fromHeight(52),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        backgroundColor: AppColors.white,
        minimumSize: const Size(52, 52),
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.focusedBorder,
      selectionColor: AppColors.focusedBorder,
      selectionHandleColor: AppColors.focusedBorder,
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.dividerLightGray,
    ),
  );
}

const iconButtonDecoration = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: AppColors.buttonShadow,
      offset: Offset(0, 6),
      blurRadius: 16.0,
    ),
  ],
  shape: BoxShape.circle,
);

const scaffoldDecoration = BoxDecoration(
  image: DecorationImage(
    image: AssetImage(AssetsCatalog.background),
    fit: BoxFit.fill,
  ),
);

// final defaultPinTheme = PinTheme(
//   width: 48,
//   height: 48,
//   textStyle: const TextStyle(
//     fontSize: 20,
//     color: AppColors.pinCodeGray,
//     fontWeight: FontWeight.w600,
//   ),
//   decoration: BoxDecoration(
//     border: Border.all(color: AppColors.pinCodeGray),
//     borderRadius: BorderRadius.circular(10),
//   ),
// );
