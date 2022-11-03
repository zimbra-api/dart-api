import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/type/section_attr.dart';
import 'package:zimbra_api/src/mail/message/get_custom_metadata_envelope.dart';
import 'package:zimbra_api/src/mail/message/get_custom_metadata_request.dart';

void main() {
  final faker = Faker();

  group('Get custom metadata tests', (() {
    test('Get custom metadata request', (() {
      final id = faker.guid.guid();
      final section = faker.lorem.word();

      final request = GetCustomMetadataRequest(SectionAttr(section: section), id: id);
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'GetCustomMetadataRequest': {
            '_jsns': 'urn:zimbraMail',
            'id': id,
            'meta': {
              'section': section,
            },
          }
        },
      });
    }));

    test('Get custom metadata response', (() {
      final id = faker.guid.guid();
      final section = faker.lorem.word();
      final key = faker.lorem.word();
      final value = faker.lorem.word();

      final data = {
        'Body': {
          'GetCustomMetadataResponse': {
            '_jsns': 'urn:zimbraMail',
            'id': id,
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
      final envelope = GetCustomMetadataEnvelope.fromMap(data);
      final response = envelope.getCustomMetadataBody.getCustomMetadataResponse!;

      expect(response.id, id);

      final meta = response.metadata!;
      expect(meta.section, section);
      expect(meta.keyValuePairs.first.key, key);
      expect(meta.keyValuePairs.first.value, value);
    }));
  }));
}
