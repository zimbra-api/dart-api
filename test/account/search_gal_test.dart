import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/search_gal_envelope.dart';
import 'package:zimbra_api/src/account/message/search_gal_request.dart';
import 'package:zimbra_api/src/account/type/entry_search_filter_info.dart';
import 'package:zimbra_api/src/account/type/entry_search_filter_multi_cond.dart';
import 'package:zimbra_api/src/account/type/entry_search_filter_single_cond.dart';
import 'package:zimbra_api/src/common/enum/condition_operator.dart';
import 'package:zimbra_api/src/common/enum/gal_search_type.dart';
import 'package:zimbra_api/src/common/enum/member_of_selector.dart';
import 'package:zimbra_api/src/common/type/cursor_info.dart';

void main() {
  final faker = Faker();

  group('Search gal tests', (() {
    test('Search gal request', (() {
      final id = faker.guid.guid();
      final sortVal = faker.lorem.word();
      final endSortVal = faker.lorem.word();
      final includeOffset = faker.randomGenerator.boolean();

      final attr = faker.lorem.word();
      final value = faker.lorem.word();
      final isNot = faker.randomGenerator.boolean();
      final isOr = faker.randomGenerator.boolean();

      final ref = faker.lorem.word();
      final name = faker.lorem.word();
      final needCanExpand = faker.randomGenerator.boolean();
      final needIsOwner = faker.randomGenerator.boolean();
      final needSMIMECerts = faker.randomGenerator.boolean();
      final galAccountId = faker.guid.guid();
      final quick = faker.randomGenerator.boolean();
      final sortBy = faker.lorem.word();
      final limit = faker.randomGenerator.integer(100);
      final offset = faker.randomGenerator.integer(100);
      final locale = faker.lorem.word();

      final request = SearchGalRequest(
          ref: ref,
          name: name,
          type: GalSearchType.all,
          needCanExpand: needCanExpand,
          needIsOwner: needIsOwner,
          needIsMember: MemberOfSelector.all,
          needSMIMECerts: needSMIMECerts,
          galAccountId: galAccountId,
          quick: quick,
          sortBy: sortBy,
          limit: limit,
          offset: offset,
          locale: locale,
          cursor: CursorInfo(id: id, sortVal: sortVal, endSortVal: endSortVal, includeOffset: includeOffset),
          searchFilter: EntrySearchFilterInfo(
              condition: EntrySearchFilterSingleCond(attr, ConditionOperator.equal, value: value, isNot: isNot),
              conditions: EntrySearchFilterMultiCond(
                isNot: isNot,
                isOr: isOr,
                singleConditions: [
                  EntrySearchFilterSingleCond(attr, ConditionOperator.equal, value: value, isNot: isNot)
                ],
                compoundConditions: [
                  EntrySearchFilterMultiCond(
                    isNot: isNot,
                    isOr: isOr,
                    singleConditions: [
                      EntrySearchFilterSingleCond(attr, ConditionOperator.equal, value: value, isNot: isNot)
                    ],
                  )
                ],
              )));
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'SearchGalRequest': {
            '_jsns': 'urn:zimbraAccount',
            'ref': ref,
            'name': name,
            'type': GalSearchType.all.name,
            'needExp': needCanExpand,
            'needIsOwner': needIsOwner,
            'needIsMember': MemberOfSelector.all.name,
            'needSMIMECerts': needSMIMECerts,
            'galAcctId': galAccountId,
            'quick': quick,
            'sortBy': sortBy,
            'limit': limit,
            'offset': offset,
            'locale': {'_content': locale},
            'cursor': {
              'id': id,
              'sortVal': sortVal,
              'endSortVal': endSortVal,
              'includeOffset': includeOffset,
            },
            'searchFilter': {
              'cond': {
                'attr': attr,
                'op': ConditionOperator.equal.name,
                'value': value,
                'not': isNot,
              },
              'conds': {
                'not': isNot,
                'or': isOr,
                'cond': [
                  {
                    'attr': attr,
                    'op': ConditionOperator.equal.name,
                    'value': value,
                    'not': isNot,
                  }
                ],
                'conds': [
                  {
                    'not': isNot,
                    'or': isOr,
                    'cond': [
                      {
                        'attr': attr,
                        'op': ConditionOperator.equal.name,
                        'value': value,
                        'not': isNot,
                      }
                    ]
                  }
                ],
              }
            },
          }
        },
      });
    }));

    test('Search gal response', (() {
      final sortBy = faker.lorem.word();
      final offset = faker.randomGenerator.integer(100);
      final more = faker.randomGenerator.boolean();
      final pagingSupported = faker.randomGenerator.boolean();
      final tokenizeKey = faker.randomGenerator.boolean();

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

      final json = {
        'Body': {
          'SearchGalResponse': {
            '_jsns': 'urn:zimbraAccount',
            'sortBy': sortBy,
            'offset': offset,
            'more': more,
            'paginationSupported': pagingSupported,
            'tokenizeKey': tokenizeKey,
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
          }
        }
      };
      final envelope = SearchGalEnvelope.fromJson(json);
      final response = envelope.searchGalBody.searchGalResponse!;
      final contact = response.contacts.first;

      expect(response.sortBy, sortBy);
      expect(response.offset, offset);
      expect(response.more, more);
      expect(response.pagingSupported, pagingSupported);
      expect(response.tokenizeKey, tokenizeKey);

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
