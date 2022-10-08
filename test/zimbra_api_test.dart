import 'package:zimbra_api/zimbra_api.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    test('First Test', () {
      final api = AccountApi('');
      expect(api.isAwesome, isTrue);
    });
  });
}
