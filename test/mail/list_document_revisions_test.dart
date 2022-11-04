import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/grant_grantee_type.dart';
import 'package:zimbra_api/src/mail/message/list_document_revisions_envelope.dart';
import 'package:zimbra_api/src/mail/message/list_document_revisions_request.dart';
import 'package:zimbra_api/src/mail/message/list_document_revisions_response.dart';
import 'package:zimbra_api/src/mail/type/list_document_revisions_spec.dart';

void main() {
  final faker = Faker();

  group('List document revisions tests', (() {
    test('List document revisions request', (() {
      final id = faker.guid.guid();
      final version = faker.randomGenerator.integer(100);
      final count = faker.randomGenerator.integer(100);

      final request = ListDocumentRevisionsRequest(ListDocumentRevisionsSpec(
        id: id,
        version: version,
        count: count,
      ));
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'ListDocumentRevisionsRequest': {
            '_jsns': 'urn:zimbraMail',
            'doc': {
              'id': id,
              'ver': version,
              'count': count,
            },
          }
        },
      });
    }));

    test('List document revisions response', (() {
      final id = faker.guid.guid();
      final email = faker.internet.email();
      final name = faker.person.name();

      final lockOwnerId = faker.guid.guid();
      final lockOwnerEmail = faker.internet.email();
      final lockOwnerTimestamp = faker.date.dateTime().toString();

      final uuid = faker.guid.guid();
      final folderUuid = faker.guid.guid();
      final flags = faker.lorem.word();
      final revision = faker.randomGenerator.integer(100);
      final version = faker.randomGenerator.integer(100);
      final modifiedSequence = faker.randomGenerator.integer(100);
      final metadataVersion = faker.randomGenerator.integer(100);
      final changeDate = faker.date.dateTime().minute;
      final perm = faker.lorem.word();

      final section = faker.lorem.word();
      final key = faker.lorem.word();
      final value = faker.lorem.word();

      final internalGrantExpiry = faker.randomGenerator.integer(100);
      final guestGrantExpiry = faker.randomGenerator.integer(100);

      final granteeId = faker.guid.guid();
      final expiry = faker.randomGenerator.integer(100);
      final granteeName = faker.person.name();
      final guestPassword = faker.internet.password();
      final accessKey = faker.internet.password();
      final date = faker.date.dateTime().millisecondsSinceEpoch;
      final folderId = faker.guid.guid();
      final tags = faker.lorem.word();
      final tagNames = faker.lorem.word();
      final description = faker.lorem.word();
      final contentType = faker.lorem.word();
      final size = faker.randomGenerator.integer(100);
      final fragment = faker.lorem.word();
      final descEnabled = faker.randomGenerator.boolean();
      final lastEditedBy = faker.lorem.word();
      final creator = faker.lorem.word();
      final createdDate = faker.date.dateTime().millisecondsSinceEpoch;

      final data = {
        'Body': {
          'ListDocumentRevisionsResponse': {
            '_jsns': 'urn:zimbraMail',
            'doc': [
              {
                'loid': lockOwnerId,
                'loe': lockOwnerEmail,
                'lt': lockOwnerTimestamp,
                'id': id,
                'uuid': uuid,
                'name': name,
                's': size,
                'd': date,
                'l': folderId,
                'luuid': folderUuid,
                'ms': modifiedSequence,
                'mdver': metadataVersion,
                'md': changeDate,
                'rev': revision,
                'f': flags,
                't': tags,
                'tn': tagNames,
                'desc': description,
                'ct': contentType,
                'descEnabled': descEnabled,
                'ver': version,
                'leb': lastEditedBy,
                'cr': creator,
                'cd': createdDate,
                'meta': [
                  {
                    'section': section,
                    '_attrs': {
                      key: value,
                    },
                  }
                ],
                'fr': {'_content': fragment},
                'acl': {
                  'internalGrantExpiry': internalGrantExpiry,
                  'guestGrantExpiry': guestGrantExpiry,
                  'grant': [
                    {
                      'perm': perm,
                      'gt': GrantGranteeType.all.name,
                      'zid': granteeId,
                      'expiry': expiry,
                      'd': granteeName,
                      'pw': guestPassword,
                      'key': accessKey,
                    }
                  ],
                },
              }
            ],
            'user': [
              {
                'id': id,
                'email': email,
                'name': name,
              }
            ],
          }
        }
      };
      final envelope = ListDocumentRevisionsEnvelope.fromMap(data);
      final response = envelope.body.response as ListDocumentRevisionsResponse;

      final user = response.users.first;
      expect(user.id, id);
      expect(user.email, email);
      expect(user.name, name);

      final doc = response.revisions.first;
      expect(doc.lockOwnerId, lockOwnerId);
      expect(doc.lockOwnerEmail, lockOwnerEmail);
      expect(doc.lockOwnerTimestamp, lockOwnerTimestamp);
      expect(doc.id, id);
      expect(doc.uuid, uuid);
      expect(doc.name, name);
      expect(doc.size, size);
      expect(doc.date, date);
      expect(doc.folderId, folderId);
      expect(doc.folderUuid, folderUuid);
      expect(doc.modifiedSequence, modifiedSequence);
      expect(doc.metadataVersion, metadataVersion);
      expect(doc.changeDate, changeDate);
      expect(doc.revision, revision);
      expect(doc.flags, flags);
      expect(doc.tags, tags);
      expect(doc.tagNames, tagNames);
      expect(doc.description, description);
      expect(doc.contentType, contentType);
      expect(doc.descEnabled, descEnabled);
      expect(doc.version, version);
      expect(doc.lastEditedBy, lastEditedBy);
      expect(doc.creator, creator);
      expect(doc.createdDate, createdDate);
      expect(doc.fragment, fragment);

      final docMeta = doc.metadatas.first;
      expect(docMeta.section, section);
      expect(docMeta.keyValuePairs.first.key, key);
      expect(docMeta.keyValuePairs.first.value, value);

      final docAcl = doc.acl!;
      expect(docAcl.internalGrantExpiry, internalGrantExpiry);
      expect(docAcl.guestGrantExpiry, guestGrantExpiry);

      final docGrant = docAcl.grants.first;
      expect(docGrant.perm, perm);
      expect(docGrant.granteeType, GrantGranteeType.all);
      expect(docGrant.granteeId, granteeId);
      expect(docGrant.expiry, expiry);
      expect(docGrant.granteeName, granteeName);
      expect(docGrant.guestPassword, guestPassword);
      expect(docGrant.accessKey, accessKey);
    }));
  }));
}
