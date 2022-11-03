import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/mail_item_type.dart';
import 'package:zimbra_api/src/mail/message/imap_copy_envelope.dart';
import 'package:zimbra_api/src/mail/message/imap_copy_request.dart';

void main() {
  final faker = Faker();

  group('IMAP copy tests', (() {
    test('IMAP copy request', (() {
      final ids = [
        faker.randomGenerator.integer(100),
        faker.randomGenerator.integer(100),
        faker.randomGenerator.integer(100)
      ].join(',');
      final folder = faker.randomGenerator.integer(100);

      final request = IMAPCopyRequest(ids, MailItemType.message, folder);
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'IMAPCopyRequest': {
            '_jsns': 'urn:zimbraMail',
            'ids': ids,
            't': MailItemType.message.name,
            'l': folder,
          }
        },
      });
    }));

    test('IMAP copy response', (() {
      final id = faker.randomGenerator.integer(100);
      final imapUid = faker.randomGenerator.integer(100);
      final data = {
        'Body': {
          'IMAPCopyResponse': {
            '_jsns': 'urn:zimbraMail',
            'item': [
              {
                'id': id,
                'i4uid': imapUid,
              }
            ],
          }
        }
      };
      final envelope = IMAPCopyEnvelope.fromMap(data);
      final response = envelope.imapCopyBody.imapCopyResponse!;
      final item = response.items.first;

      expect(item.id, id);
      expect(item.imapUid, imapUid);
    }));
  }));
}
