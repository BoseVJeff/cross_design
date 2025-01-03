import 'package:cross_design/src/base/design_system.dart';
import 'cross_widget.dart';
import 'package:flutter/widgets.dart';

/// The design state of the app.
///
/// This widget controls and manipulates the [DesignSystem] and [IconSystem] for all child [CrossWidget].
class StateProvider extends StatefulWidget {
  final DesignSystem? initialDesignSystem;
  final IconSystem? initialIconSystem;
  final Widget child;

  const StateProvider({
    super.key,
    this.initialDesignSystem,
    this.initialIconSystem,
    required this.child,
  });

  @override
  State<StateProvider> createState() => _StateProviderState();
}

class _StateProviderState extends State<StateProvider> {
  late DesignSystem _designSystem;
  late IconSystem _iconSystem;

  @override
  void initState() {
    super.initState();

    _designSystem = widget.initialDesignSystem ?? DesignSystem.material;
    _iconSystem = widget.initialIconSystem ?? IconSystem.material;

    // TODO: Explicitly handle default theme for each platform, including Web.
  }

  void setDesignSystem(DesignSystem system) {
    setState(() {
      _designSystem = system;
    });
  }

  void setIconSystem(IconSystem system) {
    setState(() {
      _iconSystem = system;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DesignState(_designSystem, _iconSystem, child: widget.child);
  }
}

class DesignState extends InheritedWidget {
  final DesignSystem designSystem;
  final IconSystem iconSystem;

  const DesignState(
    this.designSystem,
    this.iconSystem, {
    super.key,
    required super.child,
  });

  @override
  bool updateShouldNotify(DesignState oldWidget) {
    return designSystem != oldWidget.designSystem ||
        iconSystem != oldWidget.iconSystem;
  }

  static DesignState? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<DesignState>();

  static DesignState of(BuildContext context) {
    DesignState? state = DesignState.maybeOf(context);
    assert(state != null, 'No DesignState found in context');
    return state!;
  }

  void setDesignSystem(BuildContext context, DesignSystem designSystem) {
    (context.findAncestorStateOfType<State<StateProvider>>()!
            as _StateProviderState)
        .setDesignSystem(designSystem);
  }

  void setIconSystem(BuildContext context, IconSystem iconSystem) {
    (context.findAncestorStateOfType<State<StateProvider>>()!
            as _StateProviderState)
        .setIconSystem(iconSystem);
  }
}
