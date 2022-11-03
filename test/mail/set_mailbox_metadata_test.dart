import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/type/key_value_pair.dart';
import 'package:zimbra_api/src/mail/message/set_mailbox_metadata_envelope.dart';
import 'package:zimbra_api/src/mail/message/set_mailbox_metadata_request.dart';
import 'package:zimbra_api/src/mail/message/set_mailbox_metadata_response.dart';
import 'package:zimbra_api/src/mail/type/mail_custom_metadata.dart';

void main() {
  final faker = Faker();

  group('Set custom metadata tests', (() {
    test('Set custom metadata request', (() {
      final section = faker.lorem.word();
      final key = faker.lorem.word();
      final value = faker.lorem.word();

      final request = SetMailboxMetadataRequest(
        MailCustomMetadata(
          section: section,
          keyValuePairs: [KeyValuePair(key, value: value)],
        ),
      );
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'SetMailboxMetadataRequest': {
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

    test('Set custom metadata response', (() {
      final data = {
        'Body': {
          'SetMailboxMetadataResponse': {
            '_jsns': 'urn:zimbraMail',
          }
        }
      };
      final envelope = SetMailboxMetadataEnvelope.fromMap(data);
      expect(envelope.body.response, isNotNull);
      expect(envelope.body.response, isA<SetMailboxMetadataResponse>());
    }));
  }));
}
