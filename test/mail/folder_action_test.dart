import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/action_constraint.dart';
import 'package:zimbra_api/src/common/enum/action_grant_right.dart';
import 'package:zimbra_api/src/common/enum/folder_action.dart';
import 'package:zimbra_api/src/common/enum/grantee_type.dart';
import 'package:zimbra_api/src/common/enum/policy_type.dart';
import 'package:zimbra_api/src/mail/message/folder_action_envelope.dart';
import 'package:zimbra_api/src/mail/message/folder_action_request.dart';
import 'package:zimbra_api/src/mail/type/action_grant_selector.dart';
import 'package:zimbra_api/src/mail/type/folder_action_selector.dart';
import 'package:zimbra_api/src/mail/type/policy.dart';
import 'package:zimbra_api/src/mail/type/retention_policy.dart';

void main() {
  final faker = Faker();

  group('Folder action tests', (() {
    test('Folder action request', (() {
      final id = faker.guid.guid();
      final name = faker.lorem.word();
      final ids = [faker.guid.guid(), faker.guid.guid(), faker.guid.guid()].join(',');
      final operation = faker.randomGenerator.element(FolderAction.values).name;
      final constraint = random
          .amount((_) => random.element(ActionConstraint.values).name, ActionConstraint.values.length)
          .toSet()
          .join(',');
      final tag = faker.randomGenerator.integer(100);
      final folder = faker.guid.guid();
      final rgb = faker.randomGenerator.fromPatternToHex(['######']);
      final color = faker.randomGenerator.integer(127);
      final flags = faker.lorem.word();
      final tags = faker.lorem.word();
      final tagNames = faker.lorem.word();
      final nonExistentIds = faker.randomGenerator.boolean();
      final newlyCreatedIds = faker.randomGenerator.boolean();
      final recursive = faker.randomGenerator.boolean();
      final url = faker.internet.httpsUrl();
      final excludeFreeBusy = faker.randomGenerator.boolean();
      final zimbraId = faker.guid.guid();
      final view = faker.lorem.word();
      final numDays = faker.randomGenerator.integer(100);

      final rights = random
          .amount((_) => random.element(ActionGrantRight.values).name, ActionGrantRight.values.length)
          .toSet()
          .join(',');
      final displayName = faker.person.name();
      final args = faker.lorem.word();
      final password = faker.internet.password();
      final accessKey = faker.internet.password();
      final lifetime = faker.lorem.word();

      final request = FolderActionRequest(
        FolderActionSelector(
          ids,
          operation,
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
          recursive: recursive,
          url: url,
          excludeFreeBusy: excludeFreeBusy,
          zimbraId: zimbraId,
          grantType: GranteeType.all,
          view: view,
          numDays: numDays,
          grant: ActionGrantSelector(
            rights,
            grantType: GranteeType.all,
            zimbraId: zimbraId,
            displayName: displayName,
            args: args,
            password: password,
            accessKey: accessKey,
          ),
          grants: [
            ActionGrantSelector(
              rights,
              grantType: GranteeType.all,
              zimbraId: zimbraId,
              displayName: displayName,
              args: args,
              password: password,
              accessKey: accessKey,
            )
          ],
          retentionPolicy: RetentionPolicy(
            keep: [
              Policy(
                type: PolicyType.user,
                id: id,
                name: name,
                lifetime: lifetime,
              )
            ],
            purge: [
              Policy(
                type: PolicyType.user,
                id: id,
                name: name,
                lifetime: lifetime,
              )
            ],
          ),
        ),
      );
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'FolderActionRequest': {
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
              'recursive': recursive,
              'url': url,
              'excludeFreeBusy': excludeFreeBusy,
              'zid': zimbraId,
              'gt': GranteeType.all.name,
              'view': view,
              'grant': {
                'perm': rights,
                'gt': GranteeType.all.name,
                'zid': zimbraId,
                'd': displayName,
                'args': args,
                'pw': password,
                'key': accessKey,
              },
              'acl': {
                'grant': [
                  {
                    'perm': rights,
                    'gt': GranteeType.all.name,
                    'zid': zimbraId,
                    'd': displayName,
                    'args': args,
                    'pw': password,
                    'key': accessKey,
                  }
                ],
              },
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
              'numDays': numDays,
            },
          }
        },
      });
    }));

    test('Folder action response', (() {
      final id = faker.guid.guid();
      final operation = faker.randomGenerator.element(FolderAction.values).name;
      final nonExistentIds = [faker.guid.guid(), faker.guid.guid(), faker.guid.guid()].join(',');
      final newlyCreatedIds = [faker.guid.guid(), faker.guid.guid(), faker.guid.guid()].join(',');
      final zimbraId = faker.guid.guid();
      final displayName = faker.person.name();
      final accessKey = faker.internet.password();

      final data = {
        'Body': {
          'FolderActionResponse': {
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
      final envelope = FolderActionEnvelope.fromMap(data);
      final response = envelope.folderActionBody.folderActionResponse!;
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
