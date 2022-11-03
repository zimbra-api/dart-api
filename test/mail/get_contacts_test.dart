import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/member_type.dart';
import 'package:zimbra_api/src/common/type/attribute_name.dart';
import 'package:zimbra_api/src/common/type/id.dart';
import 'package:zimbra_api/src/mail/message/get_contacts_envelope.dart';
import 'package:zimbra_api/src/mail/message/get_contacts_request.dart';

void main() {
  final faker = Faker();

  group('Get contacts tests', (() {
    test('Get contacts request', (() {
      final id = faker.guid.guid();
      final name = faker.lorem.word();
      final sync = faker.randomGenerator.boolean();
      final folderId = faker.guid.guid();
      final sortBy = faker.lorem.word();
      final derefGroupMember = faker.randomGenerator.boolean();
      final includeMemberOf = faker.randomGenerator.boolean();
      final returnHiddenAttrs = faker.randomGenerator.boolean();
      final returnCertInfo = faker.randomGenerator.boolean();
      final wantImapUid = faker.randomGenerator.boolean();
      final maxMembers = faker.randomGenerator.integer(100);

      final request = GetContactsRequest(
        sync: sync,
        folderId: folderId,
        sortBy: sortBy,
        derefGroupMember: derefGroupMember,
        includeMemberOf: includeMemberOf,
        returnHiddenAttrs: returnHiddenAttrs,
        returnCertInfo: returnCertInfo,
        wantImapUid: wantImapUid,
        maxMembers: maxMembers,
        attributes: [AttributeName(name: name)],
        memberAttributes: [AttributeName(name: name)],
        contacts: [Id(id: id)],
      );
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'GetContactsRequest': {
            '_jsns': 'urn:zimbraMail',
            'sync': sync,
            'l': folderId,
            'sortBy': sortBy,
            'derefGroupMember': derefGroupMember,
            'memberOf': includeMemberOf,
            'returnHiddenAttrs': returnHiddenAttrs,
            'returnCertInfo': returnCertInfo,
            'wantImapUid': wantImapUid,
            'maxMembers': maxMembers,
            'a': [
              {
                'n': name,
              }
            ],
            'ma': [
              {
                'n': name,
              }
            ],
            'cn': [
              {
                'id': id,
              }
            ],
          }
        },
      });
    }));

    test('Get contacts response', (() {
      final sortField = faker.lorem.word();
      final canExpand = faker.randomGenerator.boolean();
      final id = faker.guid.guid();
      final imapUid = faker.randomGenerator.integer(100);
      final folder = faker.lorem.word();
      final flags = faker.lorem.word();
      final tags = faker.lorem.word();
      final tagNames = faker.lorem.word();
      final changeDate = faker.date.dateTime().millisecond;
      final modifiedSequenceId = faker.randomGenerator.integer(100);
      final date = faker.date.dateTime().millisecond;
      final revisionId = faker.randomGenerator.integer(100);
      final fileAs = faker.lorem.word();
      final email = faker.internet.email();
      final email2 = faker.internet.email();
      final email3 = faker.internet.email();
      final type = faker.lorem.word();
      final dlist = faker.lorem.word();
      final reference = faker.lorem.word();
      final tooManyMembers = faker.randomGenerator.boolean();
      final memberOf = faker.internet.email();

      final section = faker.lorem.word();
      final key = faker.lorem.word();
      final value = faker.lorem.word();

      final part = faker.lorem.word();
      final contentType = faker.lorem.word();
      final size = faker.randomGenerator.integer(100);
      final contentFilename = faker.lorem.word();

      final data = {
        'Body': {
          'GetContactsResponse': {
            '_jsns': 'urn:zimbraMail',
            'cn': [
              {
                'sf': sortField,
                'exp': canExpand,
                'id': id,
                'i4uid': imapUid,
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
                'meta': [
                  {
                    'section': section,
                    'a': [
                      {
                        'n': key,
                        '_content': value,
                      }
                    ],
                  }
                ],
                'a': [
                  {
                    'n': key,
                    '_content': value,
                    'part': part,
                    'ct': contentType,
                    's': size,
                    'filename': contentFilename,
                  }
                ],
                'm': [
                  {
                    'type': MemberType.contact.name,
                    '_content': value,
                    'cn': {
                      'sf': sortField,
                      'exp': canExpand,
                      'id': id,
                      'i4uid': imapUid,
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
                      'memberOf': {'_content': memberOf},
                    },
                  }
                ],
                'memberOf': {'_content': memberOf},
              }
            ],
          }
        }
      };
      final envelope = GetContactsEnvelope.fromMap(data);
      final response = envelope.getContactsBody.getContactsResponse!;
      final contact = response.contacts.first;

      expect(contact.sortField, sortField);
      expect(contact.canExpand, canExpand);
      expect(contact.id, id);
      expect(contact.imapUid, imapUid);
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
      expect(contact.memberOf, memberOf);

      final meta = contact.metadatas.first;
      expect(meta.section, section);
      expect(meta.keyValuePairs.first.key, key);
      expect(meta.keyValuePairs.first.value, value);

      final attr = contact.attrs.first;
      expect(attr.key, key);
      expect(attr.value, value);
      expect(attr.part, part);
      expect(attr.contentType, contentType);
      expect(attr.size, size);
      expect(attr.contentFilename, contentFilename);

      final member = contact.contactGroupMembers.first;
      expect(member.type, MemberType.contact);
      expect(member.value, value);

      final cn = member.contact!;
      expect(cn.sortField, sortField);
      expect(cn.canExpand, canExpand);
      expect(cn.id, id);
      expect(cn.imapUid, imapUid);
      expect(cn.folder, folder);
      expect(cn.flags, flags);
      expect(cn.tags, tags);
      expect(cn.tagNames, tagNames);
      expect(cn.changeDate, changeDate);
      expect(cn.modifiedSequenceId, modifiedSequenceId);
      expect(cn.date, date);
      expect(cn.revisionId, revisionId);
      expect(cn.fileAs, fileAs);
      expect(cn.email, email);
      expect(cn.email2, email2);
      expect(cn.email3, email3);
      expect(cn.type, type);
      expect(cn.dlist, dlist);
      expect(cn.reference, reference);
      expect(cn.tooManyMembers, tooManyMembers);
      expect(cn.memberOf, memberOf);
    }));
  }));
}
