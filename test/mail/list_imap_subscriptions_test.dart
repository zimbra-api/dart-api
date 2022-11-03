import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/list_imap_subscriptions_envelope.dart';
import 'package:zimbra_api/src/mail/message/list_imap_subscriptions_request.dart';

void main() {
  final faker = Faker();

  group('List IMAP subscriptions tests', (() {
    test('List IMAP subscriptions request', (() {
      final request = ListIMAPSubscriptionsRequest();
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'ListIMAPSubscriptionsRequest': {
            '_jsns': 'urn:zimbraMail',
          }
        },
      });
    }));

    test('List IMAP subscriptions response', (() {
      final sub1 = faker.lorem.word();
      final sub2 = faker.lorem.word();
      final data = {
        'Body': {
          'ListIMAPSubscriptionsResponse': {
            '_jsns': 'urn:zimbraMail',
            'sub': [
              {'_content': sub1},
              {'_content': sub2},
            ],
          }
        }
      };
      final envelope = ListIMAPSubscriptionsEnvelope.fromMap(data);
      final response = envelope.listIMAPSubscriptionsBody.listIMAPSubscriptionsResponse!;

      expect(response.subscriptions.first, sub1);
      expect(response.subscriptions.last, sub2);
    }));
  }));
}
