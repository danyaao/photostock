import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:photostock/assets/res/resources.dart';

void main() {
  testGoldens('Images golden test', (tester) async {
    final builder = GoldenBuilder.column(
      wrap: (content) => Align(alignment: Alignment.centerLeft, child: content),
    );

    for (final iconPath in Images.values) {
      builder.addScenario(
        iconPath,
        Image.asset(iconPath),
      );
    }

    await tester.pumpWidgetBuilder(
      builder.build(),
      surfaceSize: Size(500, Images.values.length * 300),
      wrapper: materialAppWrapper(),
    );

    await screenMatchesGolden(tester, 'images');
  });
}
