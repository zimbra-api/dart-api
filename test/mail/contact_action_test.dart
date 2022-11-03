import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/action_constraint.dart';
import 'package:zimbra_api/src/common/enum/conv_action.dart';
import 'package:zimbra_api/src/mail/message/contact_action_envelope.dart';
import 'package:zimbra_api/src/mail/message/contact_action_request.dart';
import 'package:zimbra_api/src/mail/type/contact_action_selector.dart';
import 'package:zimbra_api/src/mail/type/new_contact_attr.dart';

void main() {
  final faker = Faker();

  group('Contact action tests', (() {
    test('Contact action request', (() {
      final ids = [faker.guid.guid(), faker.guid.guid(), faker.guid.guid()].join(',');
      final operation = faker.randomGenerator.element(ConvAction.values).name;
      final constraint = random.amount((_) => ActionConstraint.values, 5).join(',');
      final tag = faker.randomGenerator.integer(100);
      final folder = faker.guid.guid();
      final rgb = faker.randomGenerator.fromPatternToHex(['######']);
      final color = faker.randomGenerator.integer(127);
      final name = faker.lorem.word();
      final value = faker.lorem.word();
      final flags = faker.lorem.word();
      final tags = faker.lorem.word();
      final tagNames = faker.lorem.word();
      final nonExistentIds = faker.randomGenerator.boolean();
      final newlyCreatedIds = faker.randomGenerator.boolean();

      final attachId = faker.guid.guid();
      final id = faker.randomGenerator.integer(100);
      final part = faker.lorem.word();

      final request = ContactActionRequest(
        ContactActionSelector(ids, operation,
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
            attrs: [
              NewContactAttr(
                name,
                attachId: attachId,
                id: id,
                part: part,
                value: value,
              )
            ]),
      );
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'ContactActionRequest': {
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
              'attr': [
                {
                  'n': name,
                  'aid': attachId,
                  'id': id,
                  'part': part,
                  '_content': value,
                }
              ],
            },
          }
        },
      });
    }));

    test('Contact action response', (() {
      final id = faker.guid.guid();
      final operation = faker.randomGenerator.element(ConvAction.values).name;
      final nonExistentIds = [faker.guid.guid(), faker.guid.guid(), faker.guid.guid()].join(',');
      final newlyCreatedIds = [faker.guid.guid(), faker.guid.guid(), faker.guid.guid()].join(',');
      final zimbraId = faker.guid.guid();
      final displayName = faker.person.name();
      final accessKey = faker.internet.password();

      final data = {
        'Body': {
          'ContactActionResponse': {
            '_jsns': 'urn:zimbraMail',
            'action': {
              'id': id,
              'op': operation,
              'nei': nonExistentIds,
              'nci': newlyCreatedIds,
              'zid': zimbraId,
              'd': displayName,
              'key': accessKey,
            },
          }
        }
      };
      final envelope = ContactActionEnvelope.fromMap(data);
      final response = envelope.contactActionBody.contactActionResponse!;
      final action = response.action!;

      expect(action.id, id);
      expect(action.operation, operation);
      expect(action.nonExistentIds, nonExistentIds);
      expect(action.newlyCreatedIds, newlyCreatedIds);
      expect(action.zimbraId, zimbraId);
      expect(action.displayName, displayName);
      expect(action.accessKey, accessKey);
    }));
  }));
}
