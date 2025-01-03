import 'dart:ui';

import 'package:flutter/material.dart' as mat;

enum CrossThemeMode {
  light(Brightness.light),
  dark(Brightness.dark),
  system(null);

  final Brightness? brightness;

  const CrossThemeMode(this.brightness);

  mat.ThemeMode toMaterial() {
    switch (this) {
      case CrossThemeMode.light:
        return mat.ThemeMode.light;
      case CrossThemeMode.dark:
        return mat.ThemeMode.dark;
      case CrossThemeMode.system:
        return mat.ThemeMode.system;
    }
  }
}
