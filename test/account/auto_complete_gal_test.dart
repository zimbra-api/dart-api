import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/auto_complete_gal_envelope.dart';
import 'package:zimbra_api/src/account/message/auto_complete_gal_request.dart';
import 'package:zimbra_api/src/common/enum/gal_search_type.dart';

void main() {
  final faker = Faker();

  group('Auto complete gal request tests', (() {
    test('Default to data test', () {
      final name = faker.lorem.word();
      final request = AutoCompleteGalRequest(name);

      expect(request.toMap(), {
        '_jsns': 'urn:zimbraAccount',
        'name': name,
      });
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'AutoCompleteGalRequest': {
            '_jsns': 'urn:zimbraAccount',
            'name': name,
          }
        }
      });
    });

    test('To data test', (() {
      final name = faker.lorem.word();
      final needCanExpand = faker.randomGenerator.boolean();
      final galAccountId = faker.guid.guid();
      final limit = faker.randomGenerator.integer(100);
      final request = AutoCompleteGalRequest(
        name,
        type: GalSearchType.account,
        needCanExpand: needCanExpand,
        galAccountId: galAccountId,
        limit: limit,
      );

      expect(request.toMap(), {
        '_jsns': 'urn:zimbraAccount',
        'name': name,
        'type': GalSearchType.account.name,
        'needExp': needCanExpand,
        'galAcctId': galAccountId,
        'limit': limit,
      });
    }));
  }));

  group('Auto complete gal response tests', (() {
    test('Default from data test', (() {
      final data = {
        'Body': {
          'AutoCompleteGalResponse': {
            '_jsns': 'urn:zimbraAccount',
          },
        },
      };
      final envelope = AutoCompleteGalEnvelope.fromMap(data);

      expect(envelope.autoCompleteGalBody, isNotNull);
      expect(envelope.autoCompleteGalBody.autoCompleteGalRequest, isNull);
      expect(envelope.autoCompleteGalBody.autoCompleteGalResponse, isNotNull);
    }));

    test('From data test', (() {
      final more = faker.randomGenerator.boolean();
      final tokenizeKey = faker.randomGenerator.boolean();
      final pagingSupported = faker.randomGenerator.boolean();

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

      final part = faker.lorem.word();
      final contentType = faker.lorem.word();
      final size = faker.randomGenerator.integer(100);
      final contentFilename = faker.lorem.word();

      final data = {
        'Body': {
          'AutoCompleteGalResponse': {
            '_jsns': 'urn:zimbraAccount',
            'more': more,
            'tokenizeKey': tokenizeKey,
            'paginationSupported': pagingSupported,
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
                'a': [
                  {
                    'n': key,
                    '_content': value,
                    'part': part,
                    'ct': contentType,
                    's': size,
                    'filename': contentFilename,
                  },
                ],
                'm': [
                  {
                    'type': type,
                    'value': value,
                  },
                ],
              },
            ],
          },
        },
      };

      final envelope = AutoCompleteGalEnvelope.fromMap(data);
      final response = envelope.autoCompleteGalBody.autoCompleteGalResponse!;
      final contact = response.contacts.first;

      expect(response.more, more);
      expect(response.tokenizeKey, tokenizeKey);
      expect(response.pagingSupported, pagingSupported);
      expect(response.contacts.isNotEmpty, isTrue);

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
      expect(attr.contentFilename, contentFilename);
      expect(attr.contentType, contentType);
      expect(attr.part, part);
      expect(attr.size, size);

      final member = contact.contactGroupMembers.first;
      expect(member.type, type);
      expect(member.value, value);
    }));
  }));
}
