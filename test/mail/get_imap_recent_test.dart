import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/get_imap_recent_envelope.dart';
import 'package:zimbra_api/src/mail/message/get_imap_recent_request.dart';

void main() {
  final faker = Faker();

  group('Get IMAP recent tests', (() {
    test('Get IMAP recent request', (() {
      final id = faker.guid.guid();
      final request = GetIMAPRecentRequest(id);
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'GetIMAPRecentRequest': {
            '_jsns': 'urn:zimbraMail',
            'id': id,
          }
        },
      });
    }));

    test('Get IMAP recent response', (() {
      final num = faker.randomGenerator.integer(100);
      final json = {
        'Body': {
          'GetIMAPRecentResponse': {
            '_jsns': 'urn:zimbraMail',
            'n': num,
          }
        }
      };
      final envelope = GetIMAPRecentEnvelope.fromJson(json);
      final response = envelope.getIMAPRecentBody.getIMAPRecentResponse!;
      expect(response.num, num);
    }));
  }));
}
