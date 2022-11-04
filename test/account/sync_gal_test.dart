import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/sync_gal_envelope.dart';
import 'package:zimbra_api/src/account/message/sync_gal_request.dart';
import 'package:zimbra_api/src/account/message/sync_gal_response.dart';

void main() {
  final faker = Faker();

  group('Sync gal tests', (() {
    test('Sync gal request', (() {
      final token = faker.guid.guid();
      final galAccountId = faker.guid.guid();
      final idOnly = faker.randomGenerator.boolean();
      final getCount = faker.randomGenerator.boolean();
      final limit = faker.randomGenerator.integer(100);
      final request = SyncGalRequest(
        token: token,
        galAccountId: galAccountId,
        idOnly: idOnly,
        getCount: getCount,
        limit: limit,
      );

      expect(request.getEnvelope().toMap(), {
        'Body': {
          'SyncGalRequest': {
            '_jsns': 'urn:zimbraAccount',
            'token': token,
            'galAcctId': galAccountId,
            'idOnly': idOnly,
            'getCount': getCount,
            'limit': limit,
          }
        },
      });
    }));

    test('Sync gal response', (() {
      final more = faker.randomGenerator.boolean();
      final token = faker.guid.guid();
      final galDefinitionLastModified = faker.lorem.word();
      final throttled = faker.randomGenerator.boolean();
      final fullSyncRecommended = faker.randomGenerator.boolean();
      final remain = faker.randomGenerator.integer(100);

      final sortField = faker.lorem.word();
      final canExpand = faker.randomGenerator.boolean();
      final id = faker.guid.guid();
      final folder = faker.lorem.word();
      final flags = faker.lorem.word();
      final tags = faker.lorem.word();
      final tagNames = faker.lorem.word();
      final changeDate = faker.date.dateTime().millisecondsSinceEpoch;
      final modifiedSequenceId = faker.randomGenerator.integer(100);
      final date = faker.date.dateTime().millisecondsSinceEpoch;
      final revisionId = faker.randomGenerator.integer(100);
      final fileAs = faker.lorem.word();
      final email = faker.internet.email();
      final email2 = faker.internet.email();
      final email3 = faker.internet.email();
      final type = faker.lorem.word();
      final dlist = faker.lorem.word();
      final reference = faker.lorem.word();
      final tooManyMembers = faker.randomGenerator.boolean();
      final isOwner = faker.randomGenerator.boolean();
      final isMember = faker.randomGenerator.boolean();

      final section = faker.lorem.word();
      final key = faker.lorem.word();
      final value = faker.lorem.word();

      // final part = faker.lorem.word();
      // final contentType = faker.lorem.word();
      // final size = faker.randomGenerator.integer(100);
      // final contentFilename = faker.lorem.word();

      final data = {
        'Body': {
          'SyncGalResponse': {
            '_jsns': 'urn:zimbraAccount',
            'more': more,
            'token': token,
            'galDefinitionLastModified': galDefinitionLastModified,
            'throttled': throttled,
            'fullSyncRecommended': fullSyncRecommended,
            'remain': remain,
            'cn': [
              {
                'sf': sortField,
                'exp': canExpand,
                'id': id,
                'l': folder,
                'f': flags,
                't': tags,
                'tn': tagNames,
                'md': changeDate,
                'ms': modifiedSequenceId,
                'd': date,
                'rev': revisionId,
                'fileAsStr': fileAs,
                'email': email,
                'email2': email2,
                'email3': email3,
                'type': type,
                'dlist': dlist,
                'ref': reference,
                'tooManyMembers': tooManyMembers,
                'isOwner': isOwner,
                'isMember': isMember,
                'meta': [
                  {
                    'section': section,
                    'a': [
                      {
                        'n': key,
                        '_content': value,
                      },
                    ],
                  },
                ],
                '_attrs': {
                  key: value,
                },
                'm': [
                  {
                    'type': type,
                    'value': value,
                  },
                ],
              },
            ],
            'deleted': [
              {
                'id': id,
              }
            ],
          }
        }
      };
      final envelope = SyncGalEnvelope.fromMap(data);
      final response = envelope.body.response as SyncGalResponse;
      final deleted = response.deleted.first;
      final contact = response.contacts.first;

      expect(response.more, more);
      expect(response.token, token);
      expect(response.galDefinitionLastModified, galDefinitionLastModified);
      expect(response.throttled, throttled);
      expect(response.fullSyncRecommended, fullSyncRecommended);
      expect(response.remain, remain);
      expect(deleted.id, id);

      expect(contact.sortField, sortField);
      expect(contact.canExpand, canExpand);
      expect(contact.id, id);
      expect(contact.folder, folder);
      expect(contact.flags, flags);
      expect(contact.tags, tags);
      expect(contact.tagNames, tagNames);
      expect(contact.changeDate, changeDate);
      expect(contact.modifiedSequenceId, modifiedSequenceId);
      expect(contact.date, date);
      expect(contact.revisionId, revisionId);
      expect(contact.fileAs, fileAs);
      expect(contact.email, email);
      expect(contact.email2, email2);
      expect(contact.email3, email3);
      expect(contact.type, type);
      expect(contact.dlist, dlist);
      expect(contact.reference, reference);
      expect(contact.tooManyMembers, tooManyMembers);
      expect(contact.isOwner, isOwner);
      expect(contact.isMember, isMember);

      final meta = contact.metadatas.first;
      final kvp = meta.keyValuePairs.first;
      expect(meta.section, section);
      expect(kvp.key, key);
      expect(kvp.value, value);

      final attr = contact.attrs.first;
      expect(attr.key, key);
      expect(attr.value, value);
      // expect(attr.contentFilename, contentFilename);
      // expect(attr.contentType, contentType);
      // expect(attr.part, part);
      // expect(attr.size, size);

      final member = contact.contactGroupMembers.first;
      expect(member.type, type);
      expect(member.value, value);
    }));
  }));
}
