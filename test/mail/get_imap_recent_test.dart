import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/get_imap_recent_envelope.dart';
import 'package:zimbra_api/src/mail/message/get_imap_recent_request.dart';
import 'package:zimbra_api/src/mail/message/get_imap_recent_response.dart';

void main() {
  final faker = Faker();

  group('Get IMAP recent tests', (() {
    test('Get IMAP recent request', (() {
      final id = faker.guid.guid();
      final request = GetIMAPRecentRequest(id);
      expect(request.getEnvelope().toMap(), {
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
      final data = {
        'Body': {
          'GetIMAPRecentResponse': {
            '_jsns': 'urn:zimbraMail',
            'n': num,
          }
        }
      };
      final envelope = GetIMAPRecentEnvelope.fromMap(data);
      final response = envelope.body.response as GetIMAPRecentResponse;
      expect(response.num, num);
    }));
  }));
}
