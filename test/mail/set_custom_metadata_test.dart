import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/type/key_value_pair.dart';
import 'package:zimbra_api/src/mail/message/set_custom_metadata_envelope.dart';
import 'package:zimbra_api/src/mail/message/set_custom_metadata_request.dart';
import 'package:zimbra_api/src/mail/type/mail_custom_metadata.dart';

void main() {
  final faker = Faker();

  group('Set custom metadata tests', (() {
    test('Set custom metadata request', (() {
      final id = faker.guid.guid();
      final section = faker.lorem.word();
      final key = faker.lorem.word();
      final value = faker.lorem.word();

      final request = SetCustomMetadataRequest(
        MailCustomMetadata(
          section: section,
          keyValuePairs: [KeyValuePair(key, value: value)],
        ),
        id: id,
      );
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'SetCustomMetadataRequest': {
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
            'id': id,
          }
        },
      });
    }));

    test('Set custom metadata response', (() {
      final id = faker.guid.guid();
      final json = {
        'Body': {
          'SetCustomMetadataResponse': {
            '_jsns': 'urn:zimbraMail',
            'id': id,
          }
        }
      };
      final envelope = SetCustomMetadataEnvelope.fromJson(json);
      final response = envelope.setCustomMetadataBody.setCustomMetadataResponse!;
      expect(response.id, id);
    }));
  }));
}
