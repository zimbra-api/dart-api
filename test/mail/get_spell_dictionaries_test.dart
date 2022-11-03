import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/get_spell_dictionaries_envelope.dart';
import 'package:zimbra_api/src/mail/message/get_spell_dictionaries_request.dart';
import 'package:zimbra_api/src/mail/message/get_spell_dictionaries_response.dart';

void main() {
  final faker = Faker();

  group('Get spell dictionaries tests', (() {
    test('Get spell dictionaries request', (() {
      final request = GetSpellDictionariesRequest();
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'GetSpellDictionariesRequest': {
            '_jsns': 'urn:zimbraMail',
          }
        },
      });
    }));

    test('Get spell dictionaries response', (() {
      final dictionary1 = faker.lorem.word();
      final dictionary2 = faker.lorem.word();

      final data = {
        'Body': {
          'GetSpellDictionariesResponse': {
            '_jsns': 'urn:zimbraMail',
            'dictionary': [
              {'_content': dictionary1},
              {'_content': dictionary2},
            ],
          }
        }
      };
      final envelope = GetSpellDictionariesEnvelope.fromMap(data);
      final response = envelope.body.response as GetSpellDictionariesResponse;
      expect(response.dictionaries.first, dictionary1);
      expect(response.dictionaries.last, dictionary2);
    }));
  }));
}
