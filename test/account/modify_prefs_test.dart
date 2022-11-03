import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/modify_prefs_envelope.dart';
import 'package:zimbra_api/src/account/message/modify_prefs_request.dart';
import 'package:zimbra_api/src/account/message/modify_prefs_response.dart';
import 'package:zimbra_api/src/account/type/pref.dart';

void main() {
  final faker = Faker();

  group('Modify prefs tests', (() {
    test(' Modify prefs request', (() {
      final name = faker.lorem.word();
      final value = faker.lorem.word();
      final modified = faker.randomGenerator.integer(100);
      final request = ModifyPrefsRequest(prefs: [Pref(name, value: value, modified: modified)]);

      expect(request.getEnvelope().toMap(), {
        'Body': {
          'ModifyPrefsRequest': {
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

    test(' Modify prefs response', (() {
      final data = {
        'Body': {
          'ModifyPrefsResponse': {
            '_jsns': 'urn:zimbraAccount',
          }
        }
      };
      final envelope = ModifyPrefsEnvelope.fromMap(data);
      expect(envelope.body.response, isNotNull);
      expect(envelope.body.response, isA<ModifyPrefsResponse>());
    }));
  }));
}
