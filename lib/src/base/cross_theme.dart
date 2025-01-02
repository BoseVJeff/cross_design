import 'dart:ui';

import 'package:flutter/material.dart' as mat;
import 'package:flutter/cupertino.dart' as cup;
import 'package:fluent_ui/fluent_ui.dart' as flu;
import 'package:macos_ui/macos_ui.dart' as mac;
import 'package:yaru/yaru.dart' as yar;

/// Theme for a CrossApp.
///
/// This can be supplied as an argument to CrossApp.theme.
class CrossTheme {
  // Material Themes
  final mat.ThemeData materialLight;
  final mat.ThemeData materialDark;
  final mat.ThemeData materialHighContrastLight;
  final mat.ThemeData materialHighContrastDark;

  // Cupertino Themes
  final cup.CupertinoThemeData cupertinoLight;
  final cup.CupertinoThemeData cupertinoDark;

  // Fluent Themes
  final flu.FluentThemeData fluentLight;
  final flu.FluentThemeData fluentDark;

  // MacOS Themes
  final mac.MacosThemeData macosLight;
  final mac.MacosThemeData macosDark;

  // Yaru Themes
  final mat.ThemeData yaruLight;
  final mat.ThemeData yaruDark;
  final mat.ThemeData yaruHighContrastLight;
  final mat.ThemeData yaruHighContrastDark;

  const CrossTheme(
    this.materialLight,
    this.materialDark,
    this.materialHighContrastLight,
    this.materialHighContrastDark,
    this.cupertinoLight,
    this.cupertinoDark,
    this.fluentLight,
    this.fluentDark,
    this.macosLight,
    this.macosDark,
    this.yaruLight,
    this.yaruDark,
    this.yaruHighContrastLight,
    this.yaruHighContrastDark,
  );

  factory CrossTheme.defaultTheme() => CrossTheme(
        mat.ThemeData(
          brightness: Brightness.light,
          colorScheme: mat.ColorScheme.fromSeed(
            seedColor: mat.Colors.purple,
            brightness: Brightness.light,
          ),
        ),
        mat.ThemeData(
          brightness: Brightness.dark,
          colorScheme: mat.ColorScheme.fromSeed(
            seedColor: mat.Colors.purple,
            brightness: Brightness.dark,
          ),
        ),
        mat.ThemeData(
          brightness: Brightness.light,
          colorScheme: mat.ColorScheme.fromSeed(
            seedColor: mat.Colors.purple,
            brightness: Brightness.light,
            contrastLevel: 1,
          ),
        ),
        mat.ThemeData(
          brightness: Brightness.dark,
          colorScheme: mat.ColorScheme.fromSeed(
            seedColor: mat.Colors.purple,
            brightness: Brightness.dark,
            contrastLevel: 1,
          ),
        ),
        cup.CupertinoThemeData(brightness: Brightness.light),
        cup.CupertinoThemeData(brightness: Brightness.dark),
        flu.FluentThemeData.light(),
        flu.FluentThemeData.dark(),
        mac.MacosThemeData.light(),
        mac.MacosThemeData.dark(),
        yar.yaruLight,
        yar.yaruDark,
        yar.yaruHighContrastLight,
        yar.yaruHighContrastDark,
      );

  /// Generates themes using a seed color [color].
  ///
  /// The material themes use the given [color] as the seed and generate a theme from that.
  ///
  /// The cupertino themes use the givem [color] as their primary color.
  ///
  /// The fluent themes ignore this value altogether.
  ///
  /// The macos themes use this [color] as their primary color.
  ///
  /// The yaru themes are generated with [color] as the primary color.
  /// Note that the [yaruHighContrastLight] theme remains unchanged.
  factory CrossTheme.fromColor(Color color) => CrossTheme(
        mat.ThemeData(
          brightness: Brightness.light,
          colorScheme: mat.ColorScheme.fromSeed(
            seedColor: color,
            brightness: Brightness.light,
          ),
        ),
        mat.ThemeData(
          brightness: Brightness.dark,
          colorScheme: mat.ColorScheme.fromSeed(
            seedColor: color,
            brightness: Brightness.dark,
          ),
        ),
        mat.ThemeData(
          brightness: Brightness.light,
          colorScheme: mat.ColorScheme.fromSeed(
            seedColor: color,
            brightness: Brightness.light,
            contrastLevel: 1,
          ),
        ),
        mat.ThemeData(
          brightness: Brightness.dark,
          colorScheme: mat.ColorScheme.fromSeed(
            seedColor: color,
            brightness: Brightness.dark,
            contrastLevel: 1,
          ),
        ),
        cup.CupertinoThemeData(
          primaryColor: color,
          brightness: Brightness.light,
        ),
        cup.CupertinoThemeData(
          primaryColor: color,
          brightness: Brightness.dark,
        ),
        // TODO: Figure out what is the primaryColor equivalent here.
        flu.FluentThemeData.light(),
        flu.FluentThemeData.dark(),
        mac.MacosThemeData(primaryColor: color, brightness: Brightness.light),
        mac.MacosThemeData(primaryColor: color, brightness: Brightness.dark),
        yar.createYaruLightTheme(primaryColor: color),
        yar.createYaruDarkTheme(primaryColor: color),
        // This remains the default high contrast theme because we prioritise contrast/visiblity over visual consistency.
        yar.yaruHighContrastLight,
        yar.createYaruDarkTheme(primaryColor: color, highContrast: true),
      );
}
