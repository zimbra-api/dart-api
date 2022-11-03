import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/interest_type.dart';
import 'package:zimbra_api/src/common/type/id.dart';
import 'package:zimbra_api/src/common/type/wait_set_add_spec.dart';
import 'package:zimbra_api/src/mail/message/wait_set_envelope.dart';
import 'package:zimbra_api/src/mail/message/wait_set_request.dart';
import 'package:zimbra_api/src/mail/message/wait_set_response.dart';

void main() {
  final faker = Faker();

  group('WaitSet tests', (() {
    test('WaitSet request', (() {
      final id = faker.guid.guid();
      final name = faker.lorem.word();
      final waitSetId = faker.guid.guid();
      final lastKnownSeqNo = faker.randomGenerator.integer(100).toString();
      final block = faker.randomGenerator.boolean();
      final defaultInterests = faker.randomGenerator
          .amount((_) => random.element(InterestType.values).name, InterestType.values.length)
          .toSet()
          .join(',');
      final timeout = faker.randomGenerator.integer(100);
      final expand = faker.randomGenerator.boolean();

      final token = faker.guid.guid();
      final interests = faker.randomGenerator
          .amount((_) => random.element(InterestType.values).name, InterestType.values.length)
          .toSet()
          .join(',');
      final folderInterests = [faker.guid.guid(), faker.guid.guid(), faker.guid.guid()].join(',');

      final request = WaitSetRequest(
        waitSetId,
        lastKnownSeqNo: lastKnownSeqNo,
        block: block,
        defaultInterests: defaultInterests,
        timeout: timeout,
        expand: expand,
        addAccounts: [
          WaitSetAddSpec(
            name: name,
            id: id,
            token: token,
            interests: interests,
            folderInterests: folderInterests,
          )
        ],
        updateAccounts: [
          WaitSetAddSpec(
            name: name,
            id: id,
            token: token,
            interests: interests,
            folderInterests: folderInterests,
          )
        ],
        removeAccounts: [Id(id: id)],
      );
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'WaitSetRequest': {
            '_jsns': 'urn:zimbraMail',
            'waitSet': waitSetId,
            'block': block,
            'defTypes': defaultInterests,
            'timeout': timeout,
            'expand': expand,
            'add': {
              'a': [
                {
                  'name': name,
                  'id': id,
                  'token': token,
                  'types': interests,
                  'folderInterests': folderInterests,
                }
              ]
            },
            'update': {
              'a': [
                {
                  'name': name,
                  'id': id,
                  'token': token,
                  'types': interests,
                  'folderInterests': folderInterests,
                }
              ]
            },
            'remove': {
              'a': [
                {
                  'id': id,
                }
              ]
            },
          }
        },
      });
    }));

    test('WaitSet response', (() {
      final id = faker.randomGenerator.integer(100);
      final name = faker.lorem.word();
      final waitSetId = faker.guid.guid();
      final canceled = faker.randomGenerator.boolean();
      final seqNo = faker.randomGenerator.integer(100);
      final lastChangeId = faker.randomGenerator.integer(100);

      final folderId = faker.randomGenerator.integer(100);
      final imapUid = faker.randomGenerator.integer(100);
      final type = faker.lorem.word();
      final flags = faker.lorem.word();
      final tags = faker.lorem.word();
      final path = faker.lorem.word();
      final changeBitmask = faker.randomGenerator.integer(100);

      final data = {
        'Body': {
          'WaitSetResponse': {
            '_jsns': 'urn:zimbraMail',
            'waitSet': waitSetId,
            'canceled': canceled,
            'seq': seqNo,
            'a': [
              {
                'id': id,
                'mods': [
                  {
                    'id': folderId,
                    'created': [
                      {
                        'm': {
                          'id': id,
                          'i4uid': imapUid,
                          't': type,
                          'f': flags,
                          'tn': tags,
                        }
                      }
                    ],
                    'deleted': [
                      {
                        'id': id,
                        't': type,
                      }
                    ],
                    'modMsgs': [
                      {
                        'change': changeBitmask,
                        'm': {
                          'id': id,
                          'i4uid': imapUid,
                          't': type,
                          'f': flags,
                          'tn': tags,
                        },
                      }
                    ],
                    'modTags': [
                      {
                        'id': {'_content': id},
                        'name': {'_content': name},
                        'change': changeBitmask,
                      }
                    ],
                    'modFolders': [
                      {
                        'id': folderId,
                        'path': path,
                        'change': changeBitmask,
                      }
                    ],
                  }
                ],
                'changeid': lastChangeId,
              }
            ],
            'error': [
              {
                'id': id.toString(),
                'type': type,
              }
            ],
          }
        }
      };
      final envelope = WaitSetEnvelope.fromMap(data);
      final response = envelope.body.response as WaitSetResponse;
      expect(response.waitSetId, waitSetId);
      expect(response.canceled, canceled);
      expect(response.seqNo, seqNo);

      final account = response.signalledAccounts.first;
      expect(account.id, id);
      expect(account.lastChangeId, lastChangeId);

      final modification = account.modifications.first;
      expect(modification.folderId, folderId);

      final created = modification.created.first;
      final createdMsgInfo = created.messageInfo!;
      expect(createdMsgInfo.id, id);
      expect(createdMsgInfo.imapUid, imapUid);
      expect(createdMsgInfo.type, type);
      expect(createdMsgInfo.flags, flags);
      expect(createdMsgInfo.tags, tags);

      final modMsg = modification.modifiedMsgs.first;
      expect(modMsg.changeBitmask, changeBitmask);

      final modMsgInfo = modMsg.messageInfo!;
      expect(modMsgInfo.id, id);
      expect(modMsgInfo.imapUid, imapUid);
      expect(modMsgInfo.type, type);
      expect(modMsgInfo.flags, flags);
      expect(modMsgInfo.tags, tags);

      final modTag = modification.modifiedTags.first;
      expect(modTag.id, id);
      expect(modTag.name, name);
      expect(modTag.changeBitmask, changeBitmask);

      final modFolder = modification.modifiedFolders.first;
      expect(modFolder.folderId, folderId);
      expect(modFolder.path, path);
      expect(modFolder.changeBitmask, changeBitmask);

      final error = response.errors.first;
      expect(error.id, id.toString());
      expect(error.type, type);
    }));
  }));
}
