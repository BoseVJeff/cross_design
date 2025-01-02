import 'package:cross_design/src/base/design_system.dart';
import 'package:cross_design/src/base/state_provider.dart';
import 'package:flutter/widgets.dart';

/// The base class for all cross widgets.
///
/// This handles all of the theme switching logic.
abstract class CrossWidget extends StatelessWidget {
  const CrossWidget({super.key});

  /// The Material variant of this widget.
  ///
  /// This is normally seen on Android apps.
  Widget buildMaterialWidget(BuildContext context);

  /// The Cupertino variant of this widget.
  ///
  /// This is normally seen on iOS apps.
  Widget buildCupertinoWidget(BuildContext context);

  /// The Fluent variant of this widget.
  ///
  /// This is normally seen on Windows apps.
  Widget buildFluentWidget(BuildContext context);

  /// The MacOS variant of this widget.
  ///
  /// This is normally seen on MacOS apps.
  Widget buildMacosWidget(BuildContext context);

  /// The Yaru variant of this widget.
  ///
  /// This is normally seen on Ubuntu(Linux) apps.
  Widget buildYaruWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    DesignSystem state = DesignState.of(context).designSystem;
    switch (state) {
      case DesignSystem.material:
        return buildMaterialWidget(context);
      case DesignSystem.cupertino:
        return buildCupertinoWidget(context);
      case DesignSystem.fluent:
        return buildFluentWidget(context);
      case DesignSystem.macos:
        return buildMacosWidget(context);
      case DesignSystem.yaru:
        return buildYaruWidget(context);
    }
  }
}

abstract class CrossIcon extends StatelessWidget {
  const CrossIcon({super.key});

  /// The Material variant of this widget.
  ///
  /// This is normally seen on Android apps.
  Widget buildMaterialIcon(BuildContext context);

  /// The Cupertino variant of this widget.
  ///
  /// This is normally seen on iOS apps.
  Widget buildCupertinoIcon(BuildContext context);

  /// The Fluent variant of this widget.
  ///
  /// This is normally seen on Windows apps.
  Widget buildFluentIcon(BuildContext context);

  /// The MacOS variant of this widget.
  ///
  /// This is normally seen on MacOS apps.
  Widget buildMacosIcon(BuildContext context);

  /// The Yaru variant of this widget.
  ///
  /// This is normally seen on Ubuntu(Linux) apps.
  Widget buildYaruIcon(BuildContext context);

  @override
  Widget build(BuildContext context) {
    IconSystem system = DesignState.of(context).iconSystem;
    switch (system) {
      case IconSystem.material:
        return buildMaterialIcon(context);
      case IconSystem.cupertino:
        return buildCupertinoIcon(context);
      case IconSystem.fluent:
        return buildFluentIcon(context);
      case IconSystem.macos:
        return buildMacosIcon(context);
      case IconSystem.yaru:
        return buildYaruIcon(context);
    }
  }
}
