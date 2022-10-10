import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/get_all_locales_envelope.dart';
import 'package:zimbra_api/src/account/message/get_all_locales_request.dart';

void main() {
  final faker = Faker();

  group('Get all locales tests', (() {
    test('Get all locales request', (() {
      final request = GetAllLocalesRequest();

      expect(request.getEnvelope().toJson(), {
        'Body': {
          'GetAllLocalesRequest': {
            '_jsns': 'urn:zimbraAccount',
          }
        },
      });
    }));

    test('Get all locales response', (() {
      final id = faker.guid.guid();
      final name = faker.lorem.word();
      final localName = faker.lorem.word();

      final json = {
        'Body': {
          'GetAllLocalesResponse': {
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
      final envelope = GetAllLocalesEnvelope.fromJson(json);
      final response = envelope.getAllLocalesBody.getAllLocalesResponse!;
      final locale = response.locales.first;

      expect(locale.id, id);
      expect(locale.name, name);
      expect(locale.localName, localName);
    }));
  }));
}
