import 'package:zimbra_api/zimbra_api.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final api = AccountApi('');

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect(api.isAwesome, isTrue);
    });
  });
}
