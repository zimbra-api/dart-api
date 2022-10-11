import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/revoke_rights_envelope.dart';
import 'package:zimbra_api/src/account/message/revoke_rights_request.dart';
import 'package:zimbra_api/src/account/type/account_ace_info.dart';
import 'package:zimbra_api/src/common/enum/grantee_type.dart';

void main() {
  final faker = Faker();

  group('Revoke rights tests', (() {
    final right = faker.lorem.word();
    final zimbraId = faker.guid.guid();
    final displayName = faker.person.name();
    final accessKey = faker.lorem.word();
    final password = faker.internet.password();
    final deny = faker.randomGenerator.boolean();
    final checkGranteeType = faker.randomGenerator.boolean();

    test('Revoke rights request', (() {
      final request = RevokeRightsRequest(aces: [
        AccountACEInfo(GranteeType.usr, right,
            zimbraId: zimbraId,
            displayName: displayName,
            accessKey: accessKey,
            password: password,
            deny: deny,
            checkGranteeType: checkGranteeType)
      ]);

      expect(request.getEnvelope().toJson(), {
        'Body': {
          'RevokeRightsRequest': {
            '_jsns': 'urn:zimbraAccount',
            'ace': [
              {
                'gt': GranteeType.usr.name,
                'right': right,
                'zid': zimbraId,
                'd': displayName,
                'key': accessKey,
                'pw': password,
                'deny': deny,
                'chkgt': checkGranteeType,
              }
            ],
          }
        },
      });
    }));

    test('Revoke rights response', (() {
      final json = {
        'Body': {
          'RevokeRightsResponse': {
            '_jsns': 'urn:zimbraAccount',
            'ace': [
              {
                'gt': GranteeType.usr.name,
                'right': right,
                'zid': zimbraId,
                'd': displayName,
                'key': accessKey,
                'pw': password,
                'deny': deny,
                'chkgt': checkGranteeType,
              }
            ],
          }
        },
      };
      final envelope = RevokeRightsEnvelope.fromJson(json);
      final response = envelope.revokeRightsBody.revokeRightsResponse!;
      final ace = response.aces.first;

      expect(ace.granteeType, GranteeType.usr);
      expect(ace.right, right);
      expect(ace.zimbraId, zimbraId);
      expect(ace.displayName, displayName);
      expect(ace.accessKey, accessKey);
      expect(ace.password, password);
      expect(ace.deny, deny);
      expect(ace.checkGranteeType, checkGranteeType);
    }));
  }));
}