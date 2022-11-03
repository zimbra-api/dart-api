import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/grantee_type.dart';
import 'package:zimbra_api/src/mail/message/grant_permission_envelope.dart';
import 'package:zimbra_api/src/mail/message/grant_permission_response.dart';
import 'package:zimbra_api/src/mail/type/account_ace_info.dart';
import 'package:zimbra_api/src/mail/message/grant_permission_request.dart';

void main() {
  final faker = Faker();

  group('Grant permission tests', (() {
    test('Grant permission request', (() {
      final right = faker.lorem.word();
      final zimbraId = faker.guid.guid();
      final displayName = faker.person.name();
      final password = faker.internet.password();
      final accessKey = faker.internet.password();
      final deny = faker.randomGenerator.boolean();

      final request = GrantPermissionRequest([
        AccountACEinfo(
          GranteeType.all,
          right,
          zimbraId: zimbraId,
          displayName: displayName,
          password: password,
          accessKey: accessKey,
          deny: deny,
        )
      ]);
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'GrantPermissionRequest': {
            '_jsns': 'urn:zimbraMail',
            'ace': [
              {
                'gt': GranteeType.all.name,
                'right': right,
                'zid': zimbraId,
                'd': displayName,
                'pw': password,
                'key': accessKey,
                'deny': deny,
              }
            ],
          }
        },
      });
    }));

    test('Grant permission response', (() {
      final right = faker.lorem.word();
      final zimbraId = faker.guid.guid();
      final displayName = faker.person.name();
      final password = faker.internet.password();
      final accessKey = faker.internet.password();
      final deny = faker.randomGenerator.boolean();

      final data = {
        'Body': {
          'GrantPermissionResponse': {
            '_jsns': 'urn:zimbraMail',
            'ace': [
              {
                'gt': GranteeType.all.name,
                'right': right,
                'zid': zimbraId,
                'd': displayName,
                'pw': password,
                'key': accessKey,
                'deny': deny,
              }
            ],
          }
        }
      };
      final envelope = GrantPermissionEnvelope.fromMap(data);
      final response = envelope.body.response as GrantPermissionResponse;
      final ace = response.aces.first;

      expect(ace.granteeType, GranteeType.all);
      expect(ace.right, right);
      expect(ace.zimbraId, zimbraId);
      expect(ace.displayName, displayName);
      expect(ace.password, password);
      expect(ace.accessKey, accessKey);
      expect(ace.deny, deny);
    }));
  }));
}
