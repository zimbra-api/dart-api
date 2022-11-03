import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/member_type.dart';
import 'package:zimbra_api/src/common/enum/modify_attribute_operation.dart';
import 'package:zimbra_api/src/common/enum/modify_member_operation.dart';
import 'package:zimbra_api/src/mail/message/modify_contact_envelope.dart';
import 'package:zimbra_api/src/mail/message/modify_contact_request.dart';
import 'package:zimbra_api/src/mail/type/modify_contact_attr.dart';
import 'package:zimbra_api/src/mail/type/modify_contact_group_member.dart';
import 'package:zimbra_api/src/mail/type/modify_contact_spec.dart';

void main() {
  final faker = Faker();

  group('Modify contact tests', (() {
    test('Modify contact request', (() {
      final id = faker.randomGenerator.integer(100);
      final attachId = faker.guid.guid();
      final name = faker.lorem.word();
      final value = faker.lorem.word();
      final part = faker.lorem.word();
      final tagNames = faker.lorem.word();

      final replace = faker.randomGenerator.boolean();
      final verbose = faker.randomGenerator.boolean();
      final wantImapUid = faker.randomGenerator.boolean();
      final wantModifiedSequence = faker.randomGenerator.boolean();

      final request = ModifyContactRequest(
        ModifyContactSpec(
          id: id,
          tagNames: tagNames,
          attributes: [
            ModifyContactAttr(
              name,
              operation: ModifyAttributeOperation.add,
              id: id,
              attachId: attachId,
              part: part,
              value: value,
            )
          ],
          contactGroupMembers: [
            ModifyContactGroupMember(
              operation: ModifyMemberOperation.add,
              type: MemberType.contact,
              value: value,
            )
          ],
        ),
        replace: replace,
        verbose: verbose,
        wantImapUid: wantImapUid,
        wantModifiedSequence: wantModifiedSequence,
      );
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'ModifyContactRequest': {
            '_jsns': 'urn:zimbraMail',
            'cn': {
              'id': id,
              'tn': tagNames,
              'a': [
                {
                  'n': name,
                  'op': ModifyAttributeOperation.add.name,
                  'aid': attachId,
                  'id': id,
                  'part': part,
                  '_content': value,
                }
              ],
              'm': [
                {
                  'op': ModifyMemberOperation.add.name,
                  'type': MemberType.contact.name,
                  '_content': value,
                }
              ],
            },
            'replace': replace,
            'verbose': verbose,
            'wantImapUid': wantImapUid,
            'wantModSeq': wantModifiedSequence,
          }
        },
      });
    }));

    test('Modify contact request', (() {
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
          'ModifyContactResponse': {
            '_jsns': 'urn:zimbraMail',
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
            },
          }
        }
      };
      final envelope = ModifyContactEnvelope.fromMap(data);
      final response = envelope.modifyContactBody.modifyContactResponse!;
      final contact = response.contact!;

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
