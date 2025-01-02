import 'package:cross_design/cross_design.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final ValueVariant<DesignSystem> designs = ValueVariant({
    DesignSystem.cupertino,
    DesignSystem.fluent,
    DesignSystem.macos,
    DesignSystem.material,
    DesignSystem.yaru,
  });
  final ValueVariant<IconSystem> icons = ValueVariant({
    IconSystem.cupertino,
    IconSystem.fluent,
    IconSystem.macos,
    IconSystem.material,
    IconSystem.yaru,
  });

  group('Initial Design System Values', () {
    // Testing that the default values are set and made available correctly.
    //
    // Note that this is tested seperately for each platform.
    // This is because the defaults may be platform-specific in the future, and this covers for that.
    // Basically some pre-emptive tests to ensure that we don't depend on the values to be the same for all platforms.
    testWidgets(
      "Package Defaults",
      (WidgetTester tester) async {
        await tester.pumpWidget(
          StateProvider(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Builder(
                builder: (context) =>
                    Text(DesignState.of(context).designSystem.name),
              ),
            ),
          ),
        );

        // TODO: Update tests once the per-platform defaults have been finalised.
        expect(
          find.text(DesignSystem.material.name),
          findsOneWidget,
        );
      },
      variant: TargetPlatformVariant.all(),
    );
    // Testing that the values initially set are retained and made available properly.
    testWidgets(
      "User-defined Initial Design",
      (WidgetTester tester) async {
        await tester.pumpWidget(
          StateProvider(
            initialDesignSystem: designs.currentValue,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Builder(
                builder: (context) =>
                    Text(DesignState.of(context).designSystem.name),
              ),
            ),
          ),
        );

        expect(
          find.text(designs.currentValue!.name),
          findsOneWidget,
        );
      },
      variant: designs,
    );
  });

  group('Initial Icon System Values', () {
    // Testing that the default values are set and made available correctly.
    //
    // Note that this is tested seperately for each platform.
    // This is because the defaults may be platform-specific in the future, and this covers for that.
    // Basically some pre-emptive tests to ensure that we don't depend on the values to be the same for all platforms.
    testWidgets(
      "Package Defaults",
      (WidgetTester tester) async {
        await tester.pumpWidget(
          StateProvider(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Builder(
                builder: (context) =>
                    Text(DesignState.of(context).iconSystem.name),
              ),
            ),
          ),
        );

        // TODO: Update tests once the per-platform defaults have been finalised.
        expect(
          find.text(IconSystem.material.name),
          findsOneWidget,
        );
      },
      variant: TargetPlatformVariant.all(),
    );
    // Testing that the values initially set are retained and made available properly.
    testWidgets(
      "User-defined Initial Design",
      (WidgetTester tester) async {
        await tester.pumpWidget(
          StateProvider(
            initialIconSystem: icons.currentValue,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Builder(
                builder: (context) =>
                    Text(DesignState.of(context).iconSystem.name),
              ),
            ),
          ),
        );

        expect(
          find.text(icons.currentValue!.name),
          findsOneWidget,
        );
      },
      variant: icons,
    );
  });

  testWidgets(
    "Changing Values",
    (WidgetTester tester) async {
      // Initial Values
      DesignSystem designSystem = DesignSystem.material;
      IconSystem iconSystem = IconSystem.macos;
      // New values
      DesignSystem newDesignSystem = DesignSystem.fluent;
      IconSystem newIconSystem = IconSystem.cupertino;
      // Build context
      late BuildContext appContext;
      // No. of times the child builder has re-rendered
      int renderCnt = 0;

      await tester.pumpWidget(
        StateProvider(
          key: Key("state"),
          initialDesignSystem: designSystem,
          initialIconSystem: iconSystem,
          child: Builder(builder: (context) {
            appContext = context;
            renderCnt++;
            return Column(
              children: [
                SizedBox(
                  key: Key(
                    "Design: ${DesignState.of(context).designSystem.name}",
                  ),
                  height: 10,
                  width: 10,
                ),
                SizedBox(
                  key: Key(
                    "Icon: ${DesignState.of(context).iconSystem.name}",
                  ),
                  height: 10,
                  width: 10,
                ),
              ],
            );
          }),
        ),
      );

      // Verify initial state
      expect(
        find.byKey(Key("Design: ${designSystem.name}")),
        findsOneWidget,
      );
      expect(
        find.byKey(Key("Icon: ${iconSystem.name}")),
        findsOneWidget,
      );
      expect(renderCnt, equals(1));

      // Setting old values
      DesignState.of(appContext).setDesignSystem(appContext, designSystem);
      DesignState.of(appContext).setIconSystem(appContext, iconSystem);

      // Rebuild
      await tester.pump();

      // Verify lack of change in state
      expect(
        find.byKey(Key("Design: ${designSystem.name}")),
        findsOneWidget,
      );
      expect(
        find.byKey(Key("Icon: ${iconSystem.name}")),
        findsOneWidget,
      );
      expect(renderCnt, equals(1));

      // Setting new values
      DesignState.of(appContext).setDesignSystem(appContext, newDesignSystem);
      DesignState.of(appContext).setIconSystem(appContext, newIconSystem);

      // Rebuild
      await tester.pump();

      // Test updated values
      expect(
        find.byKey(Key("Design: ${newDesignSystem.name}")),
        findsOneWidget,
      );
      expect(
        find.byKey(Key("Icon: ${newIconSystem.name}")),
        findsOneWidget,
      );
      expect(renderCnt, equals(2));
    },
  );
}
