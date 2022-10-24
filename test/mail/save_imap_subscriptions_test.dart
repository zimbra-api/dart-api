import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/save_imap_subscriptions_envelope.dart';
import 'package:zimbra_api/src/mail/message/save_imap_subscriptions_request.dart';
import 'package:zimbra_api/src/mail/message/save_imap_subscriptions_response.dart';

void main() {
  final faker = Faker();

  group('Save IMAP subscriptions tests', (() {
    test('Save IMAP subscriptions request', (() {
      final sub1 = faker.lorem.word();
      final sub2 = faker.lorem.word();

      final request = SaveIMAPSubscriptionsRequest([sub1, sub2]);
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'SaveIMAPSubscriptionsRequest': {
            '_jsns': 'urn:zimbraMail',
            'sub': [
              {'_content': sub1},
              {'_content': sub2},
            ],
          }
        },
      });
    }));

    test('Save IMAP subscriptions response', (() {
      final json = {
        'Body': {
          'SaveIMAPSubscriptionsResponse': {
            '_jsns': 'urn:zimbraMail',
          }
        }
      };
      final envelope = SaveIMAPSubscriptionsEnvelope.fromJson(json);
      final response = envelope.saveIMAPSubscriptionsBody.saveIMAPSubscriptionsResponse;
      expect(response, isNotNull);
      expect(response, isA<SaveIMAPSubscriptionsResponse>());
    }));
  }));
}
