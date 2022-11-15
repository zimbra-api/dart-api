import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/list_imap_subscriptions_envelope.dart';
import 'package:zimbra_api/src/mail/message/list_imap_subscriptions_request.dart';
import 'package:zimbra_api/src/mail/message/list_imap_subscriptions_response.dart';

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
      final response = envelope.body.response as ListIMAPSubscriptionsResponse;
      expect(response.subscriptions, [sub1, sub2]);
    }));
  }));
}
