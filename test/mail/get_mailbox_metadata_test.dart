import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/type/section_attr.dart';
import 'package:zimbra_api/src/mail/message/get_mailbox_metadata_envelope.dart';
import 'package:zimbra_api/src/mail/message/get_mailbox_metadata_request.dart';

void main() {
  final faker = Faker();

  group('Get custom metadata tests', (() {
    test('Get custom metadata request', (() {
      final section = faker.lorem.word();

      final request = GetMailboxMetadataRequest(SectionAttr(section: section));
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'GetMailboxMetadataRequest': {
            '_jsns': 'urn:zimbraMail',
            'meta': {
              'section': section,
            },
          }
        },
      });
    }));

    test('Get custom metadata response', (() {
      final section = faker.lorem.word();
      final key = faker.lorem.word();
      final value = faker.lorem.word();

      final json = {
        'Body': {
          'GetMailboxMetadataResponse': {
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
        }
      };
      final envelope = GetMailboxMetadataEnvelope.fromJson(json);
      final response = envelope.getMailboxMetadataBody.getMailboxMetadataResponse!;
      final meta = response.metadata!;
      expect(meta.section, section);
      expect(meta.keyValuePairs.first.key, key);
      expect(meta.keyValuePairs.first.value, value);
    }));
  }));
}
