import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/modify_zimlet_prefs_envelope.dart';
import 'package:zimbra_api/src/account/message/modify_zimlet_prefs_request.dart';
import 'package:zimbra_api/src/account/message/modify_zimlet_prefs_response.dart';
import 'package:zimbra_api/src/account/type/modify_zimlet_prefs_spec.dart';
import 'package:zimbra_api/src/common/enum/zimlet_status.dart';

void main() {
  final faker = Faker();

  group('Modify zimlet prefs tests', (() {
    test('Modify zimlet prefs request', (() {
      final name = faker.lorem.word();
      final request = ModifyZimletPrefsRequest(zimlets: [ModifyZimletPrefsSpec(name, ZimletStatus.enabled)]);
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'ModifyZimletPrefsRequest': {
            '_jsns': 'urn:zimbraAccount',
            'zimlet': [
              {
                'name': name,
                'presence': ZimletStatus.enabled.name,
              }
            ]
          }
        }
      });
    }));

    test('Modify zimlet prefs response', (() {
      final zimlet1 = faker.lorem.word();
      final zimlet2 = faker.lorem.word();
      final data = {
        'Body': {
          'ModifyZimletPrefsResponse': {
            '_jsns': 'urn:zimbraAccount',
            'zimlet': [
              {'_content': zimlet1},
              {'_content': zimlet2},
            ],
          }
        }
      };
      final envelope = ModifyZimletPrefsEnvelope.fromMap(data);
      final response = envelope.body.response as ModifyZimletPrefsResponse;
      expect(response.zimlets, [zimlet1, zimlet2]);
    }));
  }));
}
