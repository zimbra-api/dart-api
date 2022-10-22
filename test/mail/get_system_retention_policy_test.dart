import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/policy_type.dart';
import 'package:zimbra_api/src/mail/message/get_system_retention_policy_envelope.dart';
import 'package:zimbra_api/src/mail/message/get_system_retention_policy_request.dart';

void main() {
  final faker = Faker();

  group('Get system retention policy tests', (() {
    test('Get system retention policy request', (() {
      final request = GetSystemRetentionPolicyRequest();
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'GetSystemRetentionPolicyRequest': {
            '_jsns': 'urn:zimbraMail',
          }
        },
      });
    }));

    test('Get system retention policy response', (() {
      final id = faker.guid.guid();
      final name = faker.lorem.word();
      final lifetime = faker.lorem.word();

      final json = {
        'Body': {
          'GetSystemRetentionPolicyResponse': {
            '_jsns': 'urn:zimbraMail',
            'retentionPolicy': {
              'keep': {
                'policy': [
                  {
                    'type': PolicyType.system.name,
                    'id': id,
                    'name': name,
                    'lifetime': lifetime,
                  }
                ]
              },
              'purge': {
                'policy': [
                  {
                    'type': PolicyType.system.name,
                    'id': id,
                    'name': name,
                    'lifetime': lifetime,
                  }
                ]
              },
            },
          }
        }
      };
      final envelope = GetSystemRetentionPolicyEnvelope.fromJson(json);
      final response = envelope.getSystemRetentionPolicyBody.getSystemRetentionPolicyResponse!;
      final retentionPolicy = response.retentionPolicy!;

      final keep = retentionPolicy.keep.first;
      expect(keep.id, id);
      expect(keep.name, name);
      expect(keep.lifetime, lifetime);
      expect(keep.type, PolicyType.system);

      final purge = retentionPolicy.purge.first;
      expect(purge.id, id);
      expect(purge.name, name);
      expect(purge.lifetime, lifetime);
      expect(purge.type, PolicyType.system);
    }));
  }));
}
