import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/grant_rights_envelope.dart';
import 'package:zimbra_api/src/account/message/grant_rights_request.dart';
import 'package:zimbra_api/src/account/message/grant_rights_response.dart';
import 'package:zimbra_api/src/account/type/account_ace_info.dart';
import 'package:zimbra_api/src/common/enum/grantee_type.dart';

void main() {
  final faker = Faker();

  group('Grant rights tests', (() {
    final right = faker.lorem.word();
    final zimbraId = faker.guid.guid();
    final displayName = faker.person.name();
    final accessKey = faker.lorem.word();
    final password = faker.internet.password();
    final deny = faker.randomGenerator.boolean();
    final checkGranteeType = faker.randomGenerator.boolean();

    test('Grant rights request', (() {
      final request = GrantRightsRequest(aces: [
        AccountACEInfo(GranteeType.usr, right,
            zimbraId: zimbraId,
            displayName: displayName,
            accessKey: accessKey,
            password: password,
            deny: deny,
            checkGranteeType: checkGranteeType)
      ]);

      expect(request.getEnvelope().toMap(), {
        'Body': {
          'GrantRightsRequest': {
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

    test('Grant rights response', (() {
      final data = {
        'Body': {
          'GrantRightsResponse': {
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
      final envelope = GrantRightsEnvelope.fromMap(data);
      final response = envelope.body.response as GrantRightsResponse;
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
