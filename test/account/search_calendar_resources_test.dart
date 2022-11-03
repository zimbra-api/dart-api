import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/search_calendar_resources_envelope.dart';
import 'package:zimbra_api/src/account/message/search_calendar_resources_request.dart';
import 'package:zimbra_api/src/account/message/search_calendar_resources_response.dart';
import 'package:zimbra_api/src/account/type/entry_search_filter_info.dart';
import 'package:zimbra_api/src/account/type/entry_search_filter_multi_cond.dart';
import 'package:zimbra_api/src/account/type/entry_search_filter_single_cond.dart';
import 'package:zimbra_api/src/common/enum/condition_operator.dart';
import 'package:zimbra_api/src/common/type/cursor_info.dart';

void main() {
  final faker = Faker();

  group('Search calendar resources tests', (() {
    test('Search calendar resources request', (() {
      final id = faker.guid.guid();
      final sortVal = faker.lorem.word();
      final endSortVal = faker.lorem.word();
      final includeOffset = faker.randomGenerator.boolean();

      final attr = faker.lorem.word();
      final value = faker.lorem.word();
      final isNot = faker.randomGenerator.boolean();
      final isOr = faker.randomGenerator.boolean();

      final quick = faker.randomGenerator.boolean();
      final sortBy = faker.lorem.word();
      final limit = faker.randomGenerator.integer(100);
      final offset = faker.randomGenerator.integer(100);
      final locale = faker.lorem.word();
      final galAccountId = faker.guid.guid();
      final name = faker.lorem.word();
      final attrs = faker.lorem.word();

      final request = SearchCalendarResourcesRequest(
          quick: quick,
          sortBy: sortBy,
          limit: limit,
          offset: offset,
          locale: locale,
          galAccountId: galAccountId,
          name: name,
          attrs: attrs,
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
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'SearchCalendarResourcesRequest': {
            '_jsns': 'urn:zimbraAccount',
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
            'galAcctId': galAccountId,
            'name': {'_content': name},
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
            'attrs': attrs,
          }
        },
      });
    }));

    test('Search calendar resources response', (() {
      final sortBy = faker.lorem.word();
      final offset = faker.randomGenerator.integer(100);
      final more = faker.randomGenerator.boolean();
      final pagingSupported = faker.randomGenerator.boolean();

      final name = faker.lorem.word();
      final id = faker.guid.guid();
      final key = faker.lorem.word();
      final value = faker.lorem.word();

      final data = {
        'Body': {
          'SearchCalendarResourcesResponse': {
            '_jsns': 'urn:zimbraAccount',
            'sortBy': sortBy,
            'offset': offset,
            'more': more,
            'paginationSupported': pagingSupported,
            'calresource': [
              {
                'name': name,
                'id': id,
                'a': [
                  {
                    'n': key,
                    '_content': value,
                  }
                ],
              }
            ],
          }
        }
      };
      final envelope = SearchCalendarResourcesEnvelope.fromMap(data);
      final response = envelope.body.response as SearchCalendarResourcesResponse;

      expect(response.sortBy, sortBy);
      expect(response.offset, offset);
      expect(response.more, more);
      expect(response.pagingSupported, pagingSupported);

      final resource = response.calendarResources.first;
      expect(resource.name, name);
      expect(resource.id, id);
      expect(resource.keyValuePairs.first.key, key);
      expect(resource.keyValuePairs.first.value, value);
    }));
  }));
}
