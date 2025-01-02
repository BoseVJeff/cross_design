import 'dart:ui';

import 'package:cross_design/cross_design.dart';
import 'package:flutter_test/flutter_test.dart';

// These are basically a set on sanity checks to ensure that the theme constructors alteast are light/dark as they claim to be.
// These tests only exist to alarm if a theme has unexpected behaviour (eg. Light theme being dark, etc).
// For more detailled tests for these themes, refer to the individual widget tests instead.

void main() {
  late CrossTheme theme;

  group('Default Theme Brightness', () {
    setUp(() {
      theme = CrossTheme.defaultTheme();
    });

    group('Material', () {
      test('Light', () {
        expect(theme.materialLight.brightness, equals(Brightness.light));
      });
      test('Dark', () {
        expect(theme.materialDark.brightness, equals(Brightness.dark));
      });
      test('High Contrast Light', () {
        expect(theme.materialHighContrastLight.brightness,
            equals(Brightness.light));
      });
      test('High Contrast Dark', () {
        expect(
            theme.materialHighContrastDark.brightness, equals(Brightness.dark));
      });
    });

    group('Cupertino', () {
      test('Light', () {
        expect(theme.cupertinoLight.brightness, equals(Brightness.light));
      });
      test('Light', () {
        expect(theme.cupertinoDark.brightness, equals(Brightness.dark));
      });
    });

    group('Fluent', () {
      test('Light', () {
        expect(theme.fluentLight.brightness, equals(Brightness.light));
      });
      test('Dark', () {
        expect(theme.fluentDark.brightness, equals(Brightness.dark));
      });
    });

    group('MacOS', () {
      test('Light', () {
        expect(theme.macosLight.brightness, equals(Brightness.light));
      });
      test('Dark', () {
        expect(theme.macosDark.brightness, equals(Brightness.dark));
      });
    });

    group('Yaru', () {
      test('Light', () {
        expect(theme.yaruLight.brightness, equals(Brightness.light));
      });
      test('Dark', () {
        expect(theme.yaruDark.brightness, equals(Brightness.dark));
      });
      test('High Contrast Light', () {
        expect(
            theme.yaruHighContrastLight.brightness, equals(Brightness.light));
      });
      test('High Contrast Dark', () {
        expect(theme.yaruHighContrastDark.brightness, equals(Brightness.dark));
      });
    });
  });

  group('Color Theme Brightness', () {
    setUp(() {
      theme = CrossTheme.fromColor(Color.fromARGB(255, 66, 33, 99));
    });

    group('Material', () {
      test('Light', () {
        expect(theme.materialLight.brightness, equals(Brightness.light));
      });
      test('Dark', () {
        expect(theme.materialDark.brightness, equals(Brightness.dark));
      });
      test('High Contrast Light', () {
        expect(theme.materialHighContrastLight.brightness,
            equals(Brightness.light));
      });
      test('High Contrast Dark', () {
        expect(
            theme.materialHighContrastDark.brightness, equals(Brightness.dark));
      });
    });

    group('Cupertino', () {
      test('Light', () {
        expect(theme.cupertinoLight.brightness, equals(Brightness.light));
      });
      test('Light', () {
        expect(theme.cupertinoDark.brightness, equals(Brightness.dark));
      });
    });

    group('Fluent', () {
      test('Light', () {
        expect(theme.fluentLight.brightness, equals(Brightness.light));
      });
      test('Dark', () {
        expect(theme.fluentDark.brightness, equals(Brightness.dark));
      });
    });

    group('MacOS', () {
      test('Light', () {
        expect(theme.macosLight.brightness, equals(Brightness.light));
      });
      test('Dark', () {
        expect(theme.macosDark.brightness, equals(Brightness.dark));
      });
    });

    group('Yaru', () {
      test('Light', () {
        expect(theme.yaruLight.brightness, equals(Brightness.light));
      });
      test('Dark', () {
        expect(theme.yaruDark.brightness, equals(Brightness.dark));
      });
      test('High Contrast Light', () {
        expect(
            theme.yaruHighContrastLight.brightness, equals(Brightness.light));
      });
      test('High Contrast Dark', () {
        expect(theme.yaruHighContrastDark.brightness, equals(Brightness.dark));
      });
    });
  });
}
