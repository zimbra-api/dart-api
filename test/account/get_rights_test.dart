import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/get_rights_envelope.dart';
import 'package:zimbra_api/src/account/message/get_rights_request.dart';
import 'package:zimbra_api/src/account/message/get_rights_response.dart';
import 'package:zimbra_api/src/account/type/right.dart';
import 'package:zimbra_api/src/common/enum/grantee_type.dart';

void main() {
  final faker = Faker();

  group('Get rights tests', (() {
    test('Get rights request', (() {
      final right = faker.lorem.word();
      final request = GetRightsRequest(aces: [Right(right)]);

      expect(request.getEnvelope().toMap(), {
        'Body': {
          'GetRightsRequest': {
            '_jsns': 'urn:zimbraAccount',
            'ace': [
              {
                'right': right,
              }
            ],
          }
        },
      });
    }));

    test('Get rights response', (() {
      final right = faker.lorem.word();
      final zimbraId = faker.guid.guid();
      final displayName = faker.person.name();
      final accessKey = faker.lorem.word();
      final password = faker.internet.password();
      final deny = faker.randomGenerator.boolean();
      final checkGranteeType = faker.randomGenerator.boolean();

      final data = {
        'Body': {
          'GetRightsResponse': {
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
      final envelope = GetRightsEnvelope.fromMap(data);
      final response = envelope.body.response as GetRightsResponse;
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
