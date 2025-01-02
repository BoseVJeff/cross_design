import 'package:cross_design/cross_design.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Icon systems for all design systems', () {
    Iterable<String> designs = DesignSystem.values.map((e) => e.name);
    Iterable<String> icons = IconSystem.values.map((e) => e.name);

    // Basically, each designSystem MUST have a corresponding iconSystem.
    // An iconSystem can exist without any corresponding designSystem.
    expect(icons, containsAll(designs));
  });
}
