import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/check_rights_envelope.dart';
import 'package:zimbra_api/src/account/message/check_rights_request.dart';
import 'package:zimbra_api/src/account/message/check_rights_response.dart';
import 'package:zimbra_api/src/account/type/check_rights_target_spec.dart';
import 'package:zimbra_api/src/common/enum/target_by.dart';
import 'package:zimbra_api/src/common/enum/target_type.dart';

void main() {
  final faker = Faker();

  group('Check rights request tests', (() {
    test('Default to data test', () {
      final request = CheckRightsRequest();

      expect(request.toMap(), {'_jsns': 'urn:zimbraAccount'});
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'CheckRightsRequest': {
            '_jsns': 'urn:zimbraAccount',
          }
        }
      });
    });

    test('To data test', () {
      final targetKey = faker.guid.guid();
      final right = faker.lorem.word();
      final target = CheckRightsTargetSpec(
        targetType: TargetType.account,
        targetBy: TargetBy.name,
        targetKey: targetKey,
        rights: [right],
      );

      final request = CheckRightsRequest(targets: [target]);
      expect(request.toMap(), {
        '_jsns': 'urn:zimbraAccount',
        'target': [
          {
            'type': TargetType.account.name,
            'by': TargetBy.name.name,
            'key': targetKey,
            'right': [
              {'_content': right},
            ],
          },
        ],
      });
    });
  }));

  group('Check rights response tests', (() {
    test('Default from data test', () {
      final data = {
        'Body': {
          'CheckRightsResponse': {
            '_jsns': 'urn:zimbraAccount',
          },
        },
      };
      final envelope = CheckRightsEnvelope.fromMap(data);

      expect(envelope.body.response, isNotNull);
    });

    test('From data test', (() {
      final targetKey = faker.guid.guid();
      final allow = faker.randomGenerator.boolean();
      final right = faker.lorem.word();
      final data = {
        'Body': {
          'CheckRightsResponse': {
            '_jsns': 'urn:zimbraAccount',
            'target': [
              {
                'type': TargetType.account.name,
                'by': TargetBy.name.name,
                'key': targetKey,
                'allow': allow,
                'right': [
                  {
                    'allow': allow,
                    '_content': right,
                  },
                ],
              },
            ],
          },
        },
      };

      final envelope = CheckRightsEnvelope.fromMap(data);
      final response = envelope.body.response as CheckRightsResponse;
      final target = response.targets.first;

      expect(target.targetType, TargetType.account);
      expect(target.targetBy, TargetBy.name);
      expect(target.targetKey, targetKey);
      expect(target.allow, allow);

      final rightInfo = target.rights.first;
      expect(rightInfo.allow, allow);
      expect(rightInfo.right, right);
    }));
  }));
}
