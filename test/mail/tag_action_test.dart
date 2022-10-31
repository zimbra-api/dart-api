import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/action_constraint.dart';
import 'package:zimbra_api/src/common/enum/policy_type.dart';
import 'package:zimbra_api/src/common/enum/tag_action.dart';
import 'package:zimbra_api/src/mail/message/tag_action_envelope.dart';
import 'package:zimbra_api/src/mail/message/tag_action_request.dart';
import 'package:zimbra_api/src/mail/type/policy.dart';
import 'package:zimbra_api/src/mail/type/retention_policy.dart';
import 'package:zimbra_api/src/mail/type/tag_action_selector.dart';

void main() {
  final faker = Faker();

  group('Tag action tests', (() {
    test('Tag action request', (() {
      final id = faker.guid.guid();
      final ids = [faker.guid.guid(), faker.guid.guid(), faker.guid.guid()].join(',');
      final operation = faker.randomGenerator.element(TagAction.values).name;
      final constraint = random
          .amount((_) => random.element(ActionConstraint.values).name, ActionConstraint.values.length)
          .toSet()
          .join(',');
      final tag = faker.randomGenerator.integer(100);
      final folder = faker.guid.guid();
      final rgb = faker.randomGenerator.fromPatternToHex(['######']);
      final color = faker.randomGenerator.integer(127);
      final name = faker.lorem.word();
      final flags = faker.lorem.word();
      final tags = faker.lorem.word();
      final tagNames = faker.lorem.word();
      final nonExistentIds = faker.randomGenerator.boolean();
      final newlyCreatedIds = faker.randomGenerator.boolean();
      final lifetime = faker.lorem.word();

      final request = TagActionRequest(
        TagActionSelector(
          ids,
          operation,
          retentionPolicy: RetentionPolicy(
            keep: [Policy(type: PolicyType.user, id: id, name: name, lifetime: lifetime)],
            purge: [Policy(type: PolicyType.user, id: id, name: name, lifetime: lifetime)],
          ),
          constraint: constraint,
          tag: tag,
          folder: folder,
          rgb: rgb,
          color: color,
          name: name,
          flags: flags,
          tags: tags,
          tagNames: tagNames,
          nonExistentIds: nonExistentIds,
          newlyCreatedIds: newlyCreatedIds,
        ),
      );
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'TagActionRequest': {
            '_jsns': 'urn:zimbraMail',
            'action': {
              'id': ids,
              'op': operation,
              'retentionPolicy': {
                'keep': {
                  'policy': [
                    {
                      'type': PolicyType.user.name,
                      'id': id,
                      'name': name,
                      'lifetime': lifetime,
                    }
                  ]
                },
                'purge': {
                  'policy': [
                    {
                      'type': PolicyType.user.name,
                      'id': id,
                      'name': name,
                      'lifetime': lifetime,
                    }
                  ]
                },
              },
              'tcon': constraint,
              'tag': tag,
              'l': folder,
              'rgb': rgb,
              'color': color,
              'name': name,
              'f': flags,
              't': tags,
              'tn': tagNames,
              'nei': nonExistentIds,
              'nci': newlyCreatedIds,
            },
          }
        },
      });
    }));

    test('Tag action response', (() {
      final successes = [faker.guid.guid(), faker.guid.guid(), faker.guid.guid()].join(',');
      final successNames = faker.lorem.word();
      final operation = faker.randomGenerator.element(TagAction.values).name;
      final json = {
        'Body': {
          'TagActionResponse': {
            '_jsns': 'urn:zimbraMail',
            'action': {
              'id': successes,
              'tn': successNames,
              'op': operation,
            },
          }
        }
      };
      final envelope = TagActionEnvelope.fromJson(json);
      final response = envelope.tagActionBody.tagActionResponse!;
      final action = response.action!;
      expect(action.successes, successes);
      expect(action.successNames, successNames);
      expect(action.operation, operation);
    }));
  }));
}
