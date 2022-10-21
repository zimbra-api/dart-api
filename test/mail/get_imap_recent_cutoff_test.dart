import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/get_imap_recent_cutoff_envelope.dart';
import 'package:zimbra_api/src/mail/message/get_imap_recent_cutoff_request.dart';

void main() {
  final faker = Faker();

  group('Get IMAP recent cutoff tests', (() {
    test('Get IMAP recent cutoff request', (() {
      final id = faker.guid.guid();
      final request = GetIMAPRecentCutoffRequest(id);
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'GetIMAPRecentCutoffRequest': {
            '_jsns': 'urn:zimbraMail',
            'id': id,
          }
        },
      });
    }));

    test('Get IMAP recent cutoff response', (() {
      final cutoff = faker.randomGenerator.integer(100);
      final json = {
        'Body': {
          'GetIMAPRecentCutoffResponse': {
            '_jsns': 'urn:zimbraMail',
            'cutoff': cutoff,
          }
        }
      };
      final envelope = GetIMAPRecentCutoffEnvelope.fromJson(json);
      final response = envelope.getIMAPRecentCutoffBody.getIMAPRecentCutoffResponse!;
      expect(response.cutoff, cutoff);
    }));
  }));
}
