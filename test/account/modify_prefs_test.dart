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

      expect(request.getEnvelope().toJson(), {
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
      final json = {
        'Body': {
          'ModifyPrefsResponse': {
            '_jsns': 'urn:zimbraAccount',
          }
        }
      };
      final envelope = ModifyPrefsEnvelope.fromJson(json);
      expect(envelope.modifyPrefsBody.modifyPrefsResponse, isNotNull);
      expect(envelope.modifyPrefsBody.modifyPrefsResponse, isA<ModifyPrefsResponse>());
    }));
  }));
}
