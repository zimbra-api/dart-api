import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/action_constraint.dart';
import 'package:zimbra_api/src/common/enum/conv_action.dart';
import 'package:zimbra_api/src/mail/message/item_action_envelope.dart';
import 'package:zimbra_api/src/mail/message/item_action_request.dart';
import 'package:zimbra_api/src/mail/message/item_action_response.dart';
import 'package:zimbra_api/src/mail/type/action_selector.dart';

void main() {
  final faker = Faker();

  group('Item action tests', (() {
    test('Item action request', (() {
      final ids = [faker.guid.guid(), faker.guid.guid(), faker.guid.guid()].join(',');
      final operation = faker.randomGenerator.element(ConvAction.values).name;
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

      final request = ItemActionRequest(
        ActionSelector(ids, operation,
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
            newlyCreatedIds: newlyCreatedIds),
      );
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'ItemActionRequest': {
            '_jsns': 'urn:zimbraMail',
            'action': {
              'id': ids,
              'op': operation,
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

    test('Item action response', (() {
      final id = faker.guid.guid();
      final operation = faker.randomGenerator.element(ConvAction.values).name;
      final nonExistentIds = [faker.guid.guid(), faker.guid.guid(), faker.guid.guid()].join(',');
      final newlyCreatedIds = [faker.guid.guid(), faker.guid.guid(), faker.guid.guid()].join(',');

      final data = {
        'Body': {
          'ItemActionResponse': {
            '_jsns': 'urn:zimbraMail',
            'action': {
              'id': id,
              'op': operation,
              'nei': nonExistentIds,
              'nci': newlyCreatedIds,
            },
          }
        }
      };
      final envelope = ItemActionEnvelope.fromMap(data);
      final response = envelope.body.response as ItemActionResponse;
      final action = response.action!;

      expect(action.id, id);
      expect(action.operation, operation);
      expect(action.nonExistentIds, nonExistentIds);
      expect(action.newlyCreatedIds, newlyCreatedIds);
    }));
  }));
}
