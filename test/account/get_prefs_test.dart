import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/get_prefs_envelope.dart';
import 'package:zimbra_api/src/account/message/get_prefs_request.dart';
import 'package:zimbra_api/src/account/type/pref.dart';

void main() {
  final faker = Faker();

  group('Get prefs tests', (() {
    test('Get prefs request', (() {
      final name = faker.lorem.word();
      final value = faker.lorem.word();
      final modified = faker.randomGenerator.integer(100);
      final request = GetPrefsRequest(prefs: [Pref(name, value, modified: modified)]);

      expect(request.getEnvelope().toJson(), {
        'Body': {
          'GetPrefsRequest': {
            '_jsns': 'urn:zimbraAccount',
            'pref': [
              {
                'name': name,
                'modified': modified,
                '_content': value,
              }
            ],
          }
        },
      });
    }));

    test('Get prefs response', (() {
      final name = faker.lorem.word();
      final value = faker.lorem.word();
      final modified = faker.randomGenerator.integer(100);

      final json = {
        'Body': {
          'GetPrefsResponse': {
            '_jsns': 'urn:zimbraAccount',
            'pref': [
              {
                'name': name,
                'modified': modified,
                '_content': value,
              }
            ],
          }
        },
      };
      final envelope = GetPrefsEnvelope.fromJson(json);
      final response = envelope.getPrefsBody.getPrefsResponse;
      final pref = response!.prefs.first;
      expect(pref.name, name);
      expect(pref.modified, modified);
      expect(pref.value, value);
    }));
  }));
}