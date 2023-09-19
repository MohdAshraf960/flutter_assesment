import 'package:currency/config/config.dart';
import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  primaryColor: AppColor.primaryColor,
  scaffoldBackgroundColor: AppColor.primaryColor,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      color: AppColor.largeTextColor,
      fontSize: 48,
      fontWeight: FontWeight.w300,
    ),
  ),
);
