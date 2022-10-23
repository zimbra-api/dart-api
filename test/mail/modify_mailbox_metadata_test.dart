import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/type/key_value_pair.dart';
import 'package:zimbra_api/src/mail/message/modify_mailbox_metadata_envelope.dart';
import 'package:zimbra_api/src/mail/message/modify_mailbox_metadata_request.dart';
import 'package:zimbra_api/src/mail/message/modify_mailbox_metadata_response.dart';
import 'package:zimbra_api/src/mail/type/mail_custom_metadata.dart';

void main() {
  final faker = Faker();

  group('Modify mailbox metadata test', (() {
    test('Modify mailbox metadata request', (() {
      final section = faker.lorem.word();
      final key = faker.lorem.word();
      final value = faker.lorem.word();

      final request = ModifyMailboxMetadataRequest(
        MailCustomMetadata(
          section: section,
          keyValuePairs: [KeyValuePair(key, value: value)],
        ),
      );
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'ModifyMailboxMetadataRequest': {
            '_jsns': 'urn:zimbraMail',
            'meta': {
              'section': section,
              'a': [
                {
                  'n': key,
                  '_content': value,
                }
              ],
            },
          }
        },
      });
    }));

    test('Modify mailbox metadata response', (() {
      final json = {
        'Body': {
          'ModifyMailboxMetadataResponse': {
            '_jsns': 'urn:zimbraMail',
          }
        }
      };
      final envelope = ModifyMailboxMetadataEnvelope.fromJson(json);
      final response = envelope.modifyMailboxMetadataBody.modifyMailboxMetadataResponse;
      expect(response, isNotNull);
      expect(response, isA<ModifyMailboxMetadataResponse>());
    }));
  }));
}
