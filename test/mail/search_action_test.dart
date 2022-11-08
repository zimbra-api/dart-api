import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/bulk_operation.dart';
import 'package:zimbra_api/src/common/enum/msg_content.dart';
import 'package:zimbra_api/src/common/enum/result_mode.dart';
import 'package:zimbra_api/src/common/enum/search_sort_by.dart';
import 'package:zimbra_api/src/common/enum/search_type.dart';
import 'package:zimbra_api/src/common/enum/task_status.dart';
import 'package:zimbra_api/src/common/enum/want_recips_setting.dart';
import 'package:zimbra_api/src/common/type/attribute_name.dart';
import 'package:zimbra_api/src/common/type/cursor_info.dart';
import 'package:zimbra_api/src/common/type/tz_onset_info.dart';
import 'package:zimbra_api/src/mail/message/search_action_envelope.dart';
import 'package:zimbra_api/src/mail/message/search_action_request.dart';
import 'package:zimbra_api/src/mail/message/search_action_response.dart';
import 'package:zimbra_api/src/mail/message/search_request.dart';
import 'package:zimbra_api/src/mail/type/bulk_action.dart';
import 'package:zimbra_api/src/mail/type/cal_tz_info.dart';

void main() {
  final faker = Faker();

  group('Search action tests', (() {
    test('Search action request', (() {
      final id = faker.guid.guid();
      final name = faker.lorem.word();

      final warmup = faker.randomGenerator.boolean();
      final includeTagDeleted = faker.randomGenerator.boolean();
      final includeTagMuted = faker.randomGenerator.boolean();
      final allowableTaskStatus = faker.randomGenerator.element(TaskStatus.values).name;
      final calItemExpandStart = faker.date.dateTime().millisecondsSinceEpoch;
      final calItemExpandEnd = faker.date.dateTime().millisecondsSinceEpoch;
      final query = faker.lorem.word();
      final inDumpster = faker.randomGenerator.boolean();
      final searchTypes = faker.randomGenerator.element(SearchType.values).name;
      final groupBy = faker.lorem.word();
      final quick = faker.randomGenerator.boolean();
      final sortBy = faker.randomGenerator.element(SearchSortBy.values);
      final fetch = faker.lorem.word();
      final markRead = faker.randomGenerator.boolean();
      final maxInlinedLength = faker.randomGenerator.integer(100);
      final wantHtml = faker.randomGenerator.boolean();
      final needCanExpand = faker.randomGenerator.boolean();
      final neuterImages = faker.randomGenerator.boolean();
      final wantRecipients = faker.randomGenerator.element(WantRecipsSetting.values);
      final prefetch = faker.randomGenerator.boolean();
      final resultMode = faker.randomGenerator.element(ResultMode.values);
      final fullConversation = faker.randomGenerator.boolean();
      final field = faker.lorem.word();
      final limit = faker.randomGenerator.integer(100);
      final offset = faker.randomGenerator.integer(100);
      final locale = faker.lorem.word();
      final wantContent = faker.randomGenerator.element(MsgContent.values);
      final includeMemberOf = faker.randomGenerator.boolean();

      final tzStdOffset = faker.randomGenerator.integer(100);
      final tzDayOffset = faker.randomGenerator.integer(100);
      final standardTZName = faker.lorem.word();
      final daylightTZName = faker.lorem.word();

      final month = faker.date.dateTime().month;
      final hour = faker.date.dateTime().hour;
      final minute = faker.date.dateTime().minute;
      final second = faker.date.dateTime().second;
      final dayOfMonth = faker.randomGenerator.integer(31, min: 1);
      final week = faker.randomGenerator.integer(4, min: 1);
      final dayOfWeek = faker.randomGenerator.integer(7, min: 1);

      final sortVal = faker.lorem.word();
      final endSortVal = faker.lorem.word();
      final includeOffset = faker.randomGenerator.boolean();

      final operation = faker.randomGenerator.element(BulkOperation.values);
      final folder = faker.guid.guid();

      final request = SearchActionRequest(
          SearchRequest(
            warmup: warmup,
            includeTagDeleted: includeTagDeleted,
            includeTagMuted: includeTagMuted,
            allowableTaskStatus: allowableTaskStatus,
            calItemExpandStart: calItemExpandStart,
            calItemExpandEnd: calItemExpandEnd,
            query: query,
            inDumpster: inDumpster,
            searchTypes: searchTypes,
            groupBy: groupBy,
            quick: quick,
            sortBy: sortBy,
            fetch: fetch,
            markRead: markRead,
            maxInlinedLength: maxInlinedLength,
            wantHtml: wantHtml,
            needCanExpand: needCanExpand,
            neuterImages: neuterImages,
            wantRecipients: wantRecipients,
            prefetch: prefetch,
            resultMode: resultMode,
            fullConversation: fullConversation,
            field: field,
            limit: limit,
            offset: offset,
            headers: [AttributeName(name: name)],
            timezone: CalTZInfo(
              id,
              tzStdOffset,
              tzDayOffset,
              standardTzOnset: TzOnsetInfo(
                month,
                hour,
                minute,
                second,
                dayOfMonth: dayOfMonth,
                week: week,
                dayOfWeek: dayOfWeek,
              ),
              daylightTzOnset: TzOnsetInfo(
                month,
                hour,
                minute,
                second,
                dayOfMonth: dayOfMonth,
                week: week,
                dayOfWeek: dayOfWeek,
              ),
              standardTZName: standardTZName,
              daylightTZName: daylightTZName,
            ),
            locale: locale,
            cursor: CursorInfo(id: id, sortVal: sortVal, endSortVal: endSortVal, includeOffset: includeOffset),
            wantContent: wantContent,
            includeMemberOf: includeMemberOf,
          ),
          BulkAction(operation: operation, folder: folder));
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'SearchActionRequest': {
            '_jsns': 'urn:zimbraMail',
            'SearchRequest': {
              '_jsns': 'urn:zimbraMail',
              'warmup': warmup,
              'includeTagDeleted': includeTagDeleted,
              'includeTagMuted': includeTagMuted,
              'allowableTaskStatus': allowableTaskStatus,
              'calExpandInstStart': calItemExpandStart,
              'calExpandInstEnd': calItemExpandEnd,
              'query': query,
              'inDumpster': inDumpster,
              'types': searchTypes,
              'groupBy': groupBy,
              'quick': quick,
              'sortBy': sortBy.name,
              'fetch': fetch,
              'read': markRead,
              'max': maxInlinedLength,
              'html': wantHtml,
              'needExp': needCanExpand,
              'neuter': neuterImages,
              'recip': wantRecipients.name,
              'prefetch': prefetch,
              'resultMode': resultMode.name,
              'fullConversation': fullConversation,
              'field': field,
              'limit': limit,
              'offset': offset,
              'header': [
                {
                  'n': name,
                }
              ],
              'tz': {
                'id': id,
                'stdoff': tzStdOffset,
                'dayoff': tzDayOffset,
                'standard': {
                  'mon': month,
                  'hour': hour,
                  'min': minute,
                  'sec': second,
                  'mday': dayOfMonth,
                  'week': week,
                  'wkday': dayOfWeek,
                },
                'daylight': {
                  'mon': month,
                  'hour': hour,
                  'min': minute,
                  'sec': second,
                  'mday': dayOfMonth,
                  'week': week,
                  'wkday': dayOfWeek,
                },
                'stdname': standardTZName,
                'dayname': daylightTZName,
              },
              'locale': {'_content': locale},
              'cursor': {
                'id': id,
                'sortVal': sortVal,
                'endSortVal': endSortVal,
                'includeOffset': includeOffset,
              },
              'wantContent': wantContent.name,
              'memberOf': includeMemberOf,
            },
            'BulkAction': {
              'op': operation.name,
              'l': folder,
            },
          },
        },
      });
    }));

    test('Search action response', (() {
      final data = {
        'Body': {
          'SearchActionResponse': {
            '_jsns': 'urn:zimbraMail',
          }
        }
      };
      final envelope = SearchActionEnvelope.fromMap(data);
      expect(envelope.body.response, isNotNull);
      expect(envelope.body.response, isA<SearchActionResponse>());
    }));
  }));
}
