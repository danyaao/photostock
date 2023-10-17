import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:photostock/assets/res/resources.dart';

void main() {
  test('svg_icons assets test', () {
    expect(File(SvgIcons.testSvg).existsSync(), isTrue);
  });
}
