import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/account_by.dart';
import 'package:zimbra_api/src/common/enum/target_type.dart';
import 'package:zimbra_api/src/mail/message/check_permission_envelope.dart';
import 'package:zimbra_api/src/mail/message/check_permission_request.dart';
import 'package:zimbra_api/src/mail/type/target_spec.dart';

void main() {
  final faker = Faker();

  group('Check permission tests', (() {
    test('Check permission request', (() {
      final account = faker.internet.email();
      final right = faker.lorem.word();
      final request = CheckPermissionRequest(
          TargetSpec(
            targetType: TargetType.account,
            accountBy: AccountBy.name,
            value: account,
          ),
          rights: [right]);

      expect(request.getEnvelope().toJson(), {
        'Body': {
          'CheckPermissionRequest': {
            '_jsns': 'urn:zimbraMail',
            'target': {
              'type': TargetType.account.name,
              'by': AccountBy.name.name,
              '_content': account,
            },
            'right': [
              {'_content': right}
            ],
          }
        },
      });
    }));

    test('Check permission response', (() {
      final allow = faker.randomGenerator.boolean();
      final rightName = faker.lorem.word();

      final json = {
        'Body': {
          'CheckPermissionResponse': {
            '_jsns': 'urn:zimbraMail',
            'allow': allow,
            'right': [
              {
                'allow': allow,
                '_content': rightName,
              }
            ],
          }
        }
      };
      final envelope = CheckPermissionEnvelope.fromJson(json);
      final response = envelope.checkPermissionBody.checkPermissionResponse!;

      expect(response.allow, allow);
      expect(response.rights.first.allow, allow);
      expect(response.rights.first.rightName, rightName);
    }));
  }));
}
