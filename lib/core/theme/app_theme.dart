import "package:flutter/material.dart";

import "../consts/app_colors.dart";
import "../consts/consts.dart";

const _fontColor = Colors.black;

var appThemeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    centerTitle: true,
  ),
  iconTheme: const IconThemeData(
    color: _fontColor,
    size: 28,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: AppColors.primary,
      shape: const RoundedRectangleBorder(
        // borderRadius: BorderRadius.circular(0),
        side: BorderSide(color: AppColors.primary, width: 2),
      ),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(kBorderRadius)),
    ),
    filled: true,
    fillColor: Colors.white,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      shape: const RoundedRectangleBorder(
        // borderRadius: BorderRadius.all(Radius.circular(16)),
        side: BorderSide.none,
      ),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: AppColors.secondary,
    backgroundColor: AppColors.primary,
    elevation: 4,
    shape: CircleBorder(),
    iconSize: 32,
  ),
  chipTheme: const ChipThemeData(
    selectedColor: AppColors.primary,
    disabledColor: Colors.grey,
    labelStyle: TextStyle(
      // color: _fontColor,
      fontWeight: FontWeight.bold,
    ),
    showCheckmark: false,

    // padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    elevation: 0,
    backgroundColor: AppColors.secondary,
    shape: StadiumBorder(side: BorderSide(color: Colors.transparent)),
  ),
  brightness: Brightness.light,
  fontFamily: 'DMSans',
  cardColor: const Color(0xFFedecf2),
  primaryColor: AppColors.primary,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      color: _fontColor,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      color: AppColors.greyTxt,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: TextStyle(
      color: _fontColor,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(
      color: _fontColor,
      fontSize: 14,
      height: 1.5,
      fontWeight: FontWeight.normal,
    ),
    bodyMedium: TextStyle(
      color: _fontColor,
      fontSize: 12,
      fontWeight: FontWeight.normal,
    ),
  ),
);
