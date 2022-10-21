import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/get_last_item_id_in_mailbox_envelope.dart';
import 'package:zimbra_api/src/mail/message/get_last_item_id_in_mailbox_request.dart';

void main() {
  final faker = Faker();

  group('Get last item id in mailbox tests', (() {
    test('Get last item id in mailbox request', (() {
      final request = GetLastItemIdInMailboxRequest();
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'GetLastItemIdInMailboxRequest': {
            '_jsns': 'urn:zimbraMail',
          }
        },
      });
    }));

    test('Get last item id in mailbox response', (() {
      final id = faker.randomGenerator.integer(100);
      final json = {
        'Body': {
          'GetLastItemIdInMailboxResponse': {
            '_jsns': 'urn:zimbraMail',
            'id': {'_content': id},
          }
        }
      };
      final envelope = GetLastItemIdInMailboxEnvelope.fromJson(json);
      final response = envelope.getLastItemIdInMailboxBody.getLastItemIdInMailboxResponse!;
      expect(response.id, id);
    }));
  }));
}
