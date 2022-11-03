import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/discover_rights_envelope.dart';
import 'package:zimbra_api/src/account/message/discover_rights_request.dart';
import 'package:zimbra_api/src/account/message/discover_rights_response.dart';
import 'package:zimbra_api/src/common/enum/target_type.dart';

void main() {
  final faker = Faker();

  group('Discover rights tests', (() {
    test('Discover rights request', (() {
      final right1 = faker.lorem.word();
      final right2 = faker.lorem.word();

      final request = DiscoverRightsRequest(rights: [right1, right2]);
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'DiscoverRightsRequest': {
            '_jsns': 'urn:zimbraAccount',
            'right': [
              {'_content': right1},
              {'_content': right2},
            ],
          }
        }
      });
    }));

    test('Discover rights response', (() {
      final right = faker.lorem.word();
      final name = faker.internet.email();
      final id = faker.guid.guid();
      final displayName = faker.person.name();
      final addr = faker.internet.email();

      final data = {
        'Body': {
          'DiscoverRightsResponse': {
            '_jsns': 'urn:zimbraAccount',
            'targets': [
              {
                'right': right,
                'target': [
                  {
                    'type': TargetType.account.name,
                    'id': id,
                    'name': name,
                    'd': displayName,
                    'email': [
                      {'addr': addr}
                    ],
                  }
                ],
              }
            ],
          }
        }
      };
      final envelope = DiscoverRightsEnvelope.fromMap(data);
      final response = envelope.body.response as DiscoverRightsResponse;
      final discoveredRight = response.discoveredRights.first;

      expect(discoveredRight.right, right);

      final target = discoveredRight.targets.first;
      expect(target.type, TargetType.account);
      expect(target.id, id);
      expect(target.name, name);
      expect(target.displayName, displayName);

      final email = target.emails.first;
      expect(email.addr, addr);
    }));
  }));
}
