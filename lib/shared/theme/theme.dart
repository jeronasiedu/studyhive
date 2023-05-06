// This theme was made for FlexColorScheme version 6.1.1. Make sure
// you use same or higher version, but still same major version. If
// you use a lower version, some properties may not be supported. In
// that case you can also remove them after copying the theme to your app.
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = FlexThemeData.light(
  usedColors: 1,
  scheme: FlexScheme.tealM3,
  surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
  blendLevel: 3,
  appBarStyle: FlexAppBarStyle.background,
  subThemesData: const FlexSubThemesData(
    blendTextTheme: true,
    useM2StyleDividerInM3: true,
    defaultRadius: 6,
    defaultRadiusAdaptive: 6.0,
    adaptiveRadius: FlexAdaptive.all(),
    elevatedButtonSchemeColor: SchemeColor.onPrimaryContainer,
    elevatedButtonSecondarySchemeColor: SchemeColor.primaryContainer,
    segmentedButtonSchemeColor: SchemeColor.primary,
    inputDecoratorSchemeColor: SchemeColor.primary,
    inputDecoratorBackgroundAlpha: 21,
    inputDecoratorRadius: 8.0,
    inputDecoratorUnfocusedHasBorder: false,
    inputDecoratorPrefixIconSchemeColor: SchemeColor.primary,
    popupMenuRadius: 6.0,
    popupMenuElevation: 4.0,
    cardElevation: 0.7,
    cardRadius: 6,
    dialogRadius: 20.0,
    dialogElevation: 3.0,
    timePickerDialogRadius: 20.0,
    drawerIndicatorSchemeColor: SchemeColor.primary,
    bottomNavigationBarMutedUnselectedLabel: false,
    bottomNavigationBarMutedUnselectedIcon: false,
    menuRadius: 6.0,
    menuElevation: 4.0,
    menuBarRadius: 0.0,
    menuBarElevation: 1.0,
    navigationBarSelectedLabelSchemeColor: SchemeColor.onSurface,
    navigationBarUnselectedLabelSchemeColor: SchemeColor.onSurface,
    navigationBarMutedUnselectedLabel: false,
    navigationBarSelectedIconSchemeColor: SchemeColor.onSurface,
    navigationBarUnselectedIconSchemeColor: SchemeColor.onSurface,
    navigationBarMutedUnselectedIcon: false,
    navigationBarIndicatorSchemeColor: SchemeColor.secondaryContainer,
    navigationBarIndicatorOpacity: 1.00,
    navigationRailSelectedLabelSchemeColor: SchemeColor.primary,
    navigationRailMutedUnselectedLabel: false,
    navigationRailSelectedIconSchemeColor: SchemeColor.onPrimary,
    navigationRailMutedUnselectedIcon: false,
    navigationRailIndicatorSchemeColor: SchemeColor.primary,
    navigationRailIndicatorOpacity: 1.00,
  ),
  keyColors: const FlexKeyColors(
    useTertiary: true,
    keepPrimary: true,
    keepSecondary: true,
    keepPrimaryContainer: true,
    keepSecondaryContainer: true,
  ),
  tones: FlexTones.oneHue(Brightness.light),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  fontFamily: GoogleFonts.inter().fontFamily,
);
final darkTheme = FlexThemeData.dark(
  scheme: FlexScheme.cyanM3,
  usedColors: 1,
  surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
  blendLevel: 4,
  appBarStyle: FlexAppBarStyle.background,
  subThemesData: const FlexSubThemesData(
    blendTextTheme: true,
    useM2StyleDividerInM3: true,
    defaultRadius: 1.0,
    defaultRadiusAdaptive: 4.0,
    adaptiveRadius: FlexAdaptive.all(),
    elevatedButtonSchemeColor: SchemeColor.onPrimaryContainer,
    elevatedButtonSecondarySchemeColor: SchemeColor.primaryContainer,
    segmentedButtonSchemeColor: SchemeColor.primary,
    inputDecoratorSchemeColor: SchemeColor.primary,
    inputDecoratorBackgroundAlpha: 43,
    inputDecoratorRadius: 8.0,
    inputDecoratorUnfocusedHasBorder: false,
    inputDecoratorPrefixIconSchemeColor: SchemeColor.primary,
    popupMenuRadius: 6.0,
    cardElevation: 2,
    cardRadius: 6,
    popupMenuElevation: 4.0,
    dialogRadius: 20.0,
    dialogElevation: 3.0,
    timePickerDialogRadius: 20.0,
    drawerIndicatorSchemeColor: SchemeColor.primary,
    bottomNavigationBarMutedUnselectedLabel: false,
    bottomNavigationBarMutedUnselectedIcon: false,
    menuRadius: 6.0,
    menuElevation: 4.0,
    menuBarRadius: 0.0,
    menuBarElevation: 1.0,
    navigationBarSelectedLabelSchemeColor: SchemeColor.onSurface,
    navigationBarUnselectedLabelSchemeColor: SchemeColor.onSurface,
    navigationBarBackgroundSchemeColor: SchemeColor.surface,
    navigationBarMutedUnselectedLabel: false,
    navigationBarSelectedIconSchemeColor: SchemeColor.onSurface,
    navigationBarUnselectedIconSchemeColor: SchemeColor.onSurface,
    navigationBarMutedUnselectedIcon: false,
    navigationBarIndicatorSchemeColor: SchemeColor.secondaryContainer,
    navigationBarIndicatorOpacity: 1.00,
    navigationRailSelectedLabelSchemeColor: SchemeColor.primary,
    navigationRailMutedUnselectedLabel: false,
    navigationRailSelectedIconSchemeColor: SchemeColor.onPrimary,
    navigationRailMutedUnselectedIcon: false,
    navigationRailIndicatorSchemeColor: SchemeColor.primary,
    navigationRailIndicatorOpacity: 1.00,
  ),
  keyColors: const FlexKeyColors(
    useTertiary: true,
  ),
  tones: FlexTones.oneHue(Brightness.dark),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  fontFamily: GoogleFonts.openSans().fontFamily,
);

const inputPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 12);
