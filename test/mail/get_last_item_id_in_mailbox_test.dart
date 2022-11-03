import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/get_last_item_id_in_mailbox_envelope.dart';
import 'package:zimbra_api/src/mail/message/get_last_item_id_in_mailbox_request.dart';
import 'package:zimbra_api/src/mail/message/get_last_item_id_in_mailbox_response.dart';

void main() {
  final faker = Faker();

  group('Get last item id in mailbox tests', (() {
    test('Get last item id in mailbox request', (() {
      final request = GetLastItemIdInMailboxRequest();
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'GetLastItemIdInMailboxRequest': {
            '_jsns': 'urn:zimbraMail',
          }
        },
      });
    }));

    test('Get last item id in mailbox response', (() {
      final id = faker.randomGenerator.integer(100);
      final data = {
        'Body': {
          'GetLastItemIdInMailboxResponse': {
            '_jsns': 'urn:zimbraMail',
            'id': {'_content': id},
          }
        }
      };
      final envelope = GetLastItemIdInMailboxEnvelope.fromMap(data);
      final response = envelope.body.response as GetLastItemIdInMailboxResponse;
      expect(response.id, id);
    }));
  }));
}
