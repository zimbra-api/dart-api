import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/grantee_type.dart';
import 'package:zimbra_api/src/mail/message/get_permission_envelope.dart';
import 'package:zimbra_api/src/mail/message/get_permission_response.dart';
import 'package:zimbra_api/src/mail/type/right.dart';
import 'package:zimbra_api/src/mail/message/get_permission_request.dart';

void main() {
  final faker = Faker();

  group('Get permissions tests', (() {
    test('Get permissions request', (() {
      final right = faker.lorem.word();
      final request = GetPermissionRequest(aces: [Right(right: right)]);
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'GetPermissionRequest': {
            '_jsns': 'urn:zimbraMail',
            'ace': [
              {'right': right}
            ],
          }
        },
      });
    }));

    test('Get permissions response', (() {
      final right = faker.lorem.word();
      final zimbraId = faker.guid.guid();
      final displayName = faker.person.name();
      final password = faker.internet.password();
      final accessKey = faker.internet.password();
      final deny = faker.randomGenerator.boolean();

      final data = {
        'Body': {
          'GetPermissionResponse': {
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
      final envelope = GetPermissionEnvelope.fromMap(data);
      final response = envelope.body.response as GetPermissionResponse;
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
