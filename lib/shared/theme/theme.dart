// This theme was made for FlexColorScheme version 6.1.1. Make sure
// you use same or higher version, but still same major version. If
// you use a lower version, some properties may not be supported. In
// that case you can also remove them after copying the theme to your app.
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = FlexThemeData.light(
  scheme: FlexScheme.deepPurple,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  appBarStyle: FlexAppBarStyle.material,
  blendLevel: 9,
  subThemesData: const FlexSubThemesData(
    useM2StyleDividerInM3: true,
    blendOnLevel: 10,
    blendOnColors: false,
    fabUseShape: true,
    fabRadius: 60,
    chipRadius: 40.0,
    inputDecoratorUnfocusedHasBorder: false,
    inputDecoratorBorderType: FlexInputBorderType.underline,
    inputDecoratorRadius: 0,
    elevatedButtonRadius: 0,
    outlinedButtonRadius: 0,
    textButtonRadius: 0,
    navigationBarLabelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
    navigationBarSelectedLabelSize: 13,
    navigationBarUnselectedLabelSize: 13,
    navigationBarHeight: 80,
    bottomSheetRadius: 0,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  fontFamily: GoogleFonts.poppins().fontFamily,
);
final darkTheme = FlexThemeData.dark(
  scheme: FlexScheme.deepPurple,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 14,
  appBarStyle: FlexAppBarStyle.material,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 20,
    useM2StyleDividerInM3: true,
    fabUseShape: true,
    fabRadius: 60,
    chipRadius: 40.0,
    inputDecoratorUnfocusedBorderIsColored: false,
    inputDecoratorUnfocusedHasBorder: false,
    inputDecoratorBorderType: FlexInputBorderType.underline,
    inputDecoratorRadius: 0,
    elevatedButtonRadius: 0,
    outlinedButtonRadius: 0,
    textButtonRadius: 0,
    navigationBarLabelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
    navigationBarSelectedLabelSize: 13,
    navigationBarUnselectedLabelSize: 13,
    navigationBarHeight: 80,
    bottomSheetRadius: 0,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  fontFamily: GoogleFonts.poppins().fontFamily,
);
