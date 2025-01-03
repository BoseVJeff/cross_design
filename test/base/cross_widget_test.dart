import 'package:cross_design/cross_design.dart';
import 'package:flutter_test/flutter_test.dart';

// Test scaffolding for all design values
List<DesignSystem> designSystems = DesignSystem.values;
final ValueVariant<DesignSystem> designs = ValueVariant(designSystems.toSet());
Map<DesignSystem, Key> keyMap = designSystems.asNameMap().map(
      (key, value) => MapEntry(value, Key(key)),
    );

// A widget for the purposes of testing
class CrossWidgetTest extends CrossWidget {
  const CrossWidgetTest({super.key});

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return SizedBox(key: keyMap[DesignSystem.cupertino]);
  }

  @override
  Widget buildFluentWidget(BuildContext context) {
    return SizedBox(key: keyMap[DesignSystem.fluent]);
  }

  @override
  Widget buildMacosWidget(BuildContext context) {
    return SizedBox(key: keyMap[DesignSystem.macos]);
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return SizedBox(key: keyMap[DesignSystem.material]);
  }

  @override
  Widget buildYaruWidget(BuildContext context) {
    return SizedBox(key: keyMap[DesignSystem.yaru]);
  }
}

// Test scaffolding for all design values
List<IconSystem> values = IconSystem.values;
final ValueVariant<IconSystem> icons = ValueVariant(values.toSet());
Map<IconSystem, Key> iconKeyMap = values.asNameMap().map(
      (key, value) => MapEntry(value, Key(key)),
    );

// A widget for the purposes of testing
class CrossIconTest extends CrossIcon {
  const CrossIconTest({super.key});

  @override
  Widget buildCupertinoIcon(BuildContext context) {
    return SizedBox(key: iconKeyMap[IconSystem.cupertino]);
  }

  @override
  Widget buildFluentIcon(BuildContext context) {
    return SizedBox(key: iconKeyMap[IconSystem.fluent]);
  }

  @override
  Widget buildMacosIcon(BuildContext context) {
    return SizedBox(key: iconKeyMap[IconSystem.macos]);
  }

  @override
  Widget buildMaterialIcon(BuildContext context) {
    return SizedBox(key: iconKeyMap[IconSystem.material]);
  }

  @override
  Widget buildYaruIcon(BuildContext context) {
    return SizedBox(key: iconKeyMap[IconSystem.yaru]);
  }
}

void main() {
  testWidgets(
    'Cross Widget',
    (WidgetTester tester) async {
      await tester.pumpWidget(StateProvider(
        initialDesignSystem: designs.currentValue,
        child: CrossWidgetTest(),
      ));

      expect(find.byKey(keyMap[designs.currentValue!]!), findsOneWidget);
    },
    variant: designs,
  );
  testWidgets(
    'Cross Icon',
    (WidgetTester tester) async {
      await tester.pumpWidget(StateProvider(
        initialIconSystem: icons.currentValue,
        child: CrossIconTest(),
      ));

      expect(find.byKey(iconKeyMap[icons.currentValue!]!), findsOneWidget);
    },
    variant: icons,
  );
}
