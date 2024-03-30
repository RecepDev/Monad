import 'package:flutter_test/flutter_test.dart';
import 'package:monad/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('TeamViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
