import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/no_op_envelope.dart';
import 'package:zimbra_api/src/mail/message/no_op_request.dart';

void main() {
  final faker = Faker();

  group('No op tests', (() {
    test('No op request', (() {
      final wait = faker.randomGenerator.boolean();
      final includeDelegates = faker.randomGenerator.boolean();
      final enforceLimit = faker.randomGenerator.boolean();
      final timeout = faker.randomGenerator.integer(100);

      final request = NoOpRequest(
        wait: wait,
        includeDelegates: includeDelegates,
        enforceLimit: enforceLimit,
        timeout: timeout,
      );
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'NoOpRequest': {
            '_jsns': 'urn:zimbraMail',
            'wait': wait,
            'delegate': includeDelegates,
            'limitToOneBlocked': enforceLimit,
            'timeout': timeout,
          }
        },
      });
    }));

    test('No op response', (() {
      final waitDisallowed = faker.randomGenerator.boolean();
      final data = {
        'Body': {
          'NoOpResponse': {
            '_jsns': 'urn:zimbraMail',
            'waitDisallowed': waitDisallowed,
          }
        }
      };
      final envelope = NoOpEnvelope.fromMap(data);
      final response = envelope.noOpBody.noOpResponse!;
      expect(response.waitDisallowed, waitDisallowed);
    }));
  }));
}
