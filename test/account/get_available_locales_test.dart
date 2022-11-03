import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/get_available_locales_envelope.dart';
import 'package:zimbra_api/src/account/message/get_available_locales_request.dart';

void main() {
  final faker = Faker();

  group('Get available locales tests', (() {
    test('Get available locales request', (() {
      final request = GetAvailableLocalesRequest();

      expect(request.getEnvelope().toMap(), {
        'Body': {
          'GetAvailableLocalesRequest': {
            '_jsns': 'urn:zimbraAccount',
          }
        },
      });
    }));

    test('Get available locales response', (() {
      final id = faker.guid.guid();
      final name = faker.lorem.word();
      final localName = faker.lorem.word();

      final data = {
        'Body': {
          'GetAvailableLocalesResponse': {
            '_jsns': 'urn:zimbraAccount',
            'locale': [
              {
                'id': id,
                'name': name,
                'localName': localName,
              }
            ],
          },
        },
      };
      final envelope = GetAvailableLocalesEnvelope.fromMap(data);
      final response = envelope.getAvailableLocalesBody.getAvailableLocalesResponse!;
      final locale = response.locales.first;

      expect(locale.id, id);
      expect(locale.name, name);
      expect(locale.localName, localName);
    }));
  }));
}
