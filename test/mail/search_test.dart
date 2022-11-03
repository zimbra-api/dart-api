import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/address_type.dart';
import 'package:zimbra_api/src/common/enum/alarm_action.dart';
import 'package:zimbra_api/src/common/enum/alarm_related.dart';
import 'package:zimbra_api/src/common/enum/free_busy_status.dart';
import 'package:zimbra_api/src/common/enum/frequency.dart';
import 'package:zimbra_api/src/common/enum/grant_grantee_type.dart';
import 'package:zimbra_api/src/common/enum/invite_class.dart';
import 'package:zimbra_api/src/common/enum/invite_status.dart';
import 'package:zimbra_api/src/common/enum/invite_type.dart';
import 'package:zimbra_api/src/common/enum/member_type.dart';
import 'package:zimbra_api/src/common/enum/msg_content.dart';
import 'package:zimbra_api/src/common/enum/participation_status.dart';
import 'package:zimbra_api/src/common/enum/reply_type.dart';
import 'package:zimbra_api/src/common/enum/result_mode.dart';
import 'package:zimbra_api/src/common/enum/search_sort_by.dart';
import 'package:zimbra_api/src/common/enum/search_type.dart';
import 'package:zimbra_api/src/common/enum/task_status.dart';
import 'package:zimbra_api/src/common/enum/transparency.dart';
import 'package:zimbra_api/src/common/enum/want_recips_setting.dart';
import 'package:zimbra_api/src/common/enum/week_day.dart';
import 'package:zimbra_api/src/common/type/attribute_name.dart';
import 'package:zimbra_api/src/common/type/cursor_info.dart';
import 'package:zimbra_api/src/common/type/tz_onset_info.dart';
import 'package:zimbra_api/src/mail/message/search_envelope.dart';
import 'package:zimbra_api/src/mail/message/search_request.dart';
import 'package:zimbra_api/src/mail/message/search_response.dart';
import 'package:zimbra_api/src/mail/type/add_recurrence_info.dart';
import 'package:zimbra_api/src/mail/type/cal_tz_info.dart';
import 'package:zimbra_api/src/mail/type/calendar_item_hit_info.dart';
import 'package:zimbra_api/src/mail/type/exclude_recurrence_info.dart';
import 'package:zimbra_api/src/mail/type/message_hit_info.dart';
import 'package:zimbra_api/src/mail/type/recurrence_info.dart';

void main() {
  final faker = Faker();

  group('Search tests', (() {
    test('Search request', (() {
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

      final request = SearchRequest(
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
      );
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'SearchRequest': {
            '_jsns': 'urn:zimbraMail',
            'warmup': warmup,
            'includeTagDeleted': includeTagDeleted,
            'includeTagMuted': includeTagMuted,
            'allowableTaskStatus': allowableTaskStatus,
            'calExpandInstStart': calItemExpandStart,
            'calExpandInstEnd': calItemExpandEnd,
            'query': {'_content': query},
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
          }
        },
      });
    }));

    test('Search response', (() {
      final id = faker.guid.guid();
      final uid = faker.guid.guid();
      final uuid = faker.guid.guid();
      final name = faker.lorem.word();
      final key = faker.lorem.word();
      final value = faker.lorem.word();
      final section = faker.lorem.word();

      final sortBy = faker.randomGenerator.element(SearchSortBy.values);
      final queryOffset = faker.randomGenerator.integer(100);
      final queryMore = faker.randomGenerator.boolean();
      final totalSize = faker.randomGenerator.integer(100);

      final sortField = faker.lorem.word();
      final size = faker.randomGenerator.integer(100);
      final folderId = faker.guid.guid();
      final folderUuid = faker.guid.guid();
      final flags = faker.lorem.word();
      final tags = faker.lorem.word();
      final tagNames = faker.lorem.word();
      final bounds = faker.lorem.word();
      final color = faker.randomGenerator.integer(127);
      final rgb = faker.randomGenerator.fromPatternToHex(['######']);
      final autoSendTime = faker.date.dateTime().millisecondsSinceEpoch;
      final date = faker.date.dateTime().millisecondsSinceEpoch;
      final numMsg = faker.randomGenerator.integer(100);
      final numUnread = faker.randomGenerator.integer(100);
      final elided = faker.randomGenerator.boolean();
      final changeDate = faker.date.dateTime().millisecondsSinceEpoch;
      final modifiedSequence = faker.randomGenerator.integer(100);
      final subject = faker.lorem.word();
      final fragment = faker.lorem.word();

      final address = faker.internet.email();
      final display = faker.person.name();
      final personal = faker.lorem.word();
      final addressType = faker.randomGenerator.element(AddressType.values);
      final isGroup = faker.randomGenerator.boolean();
      final canExpandGroupMembers = faker.randomGenerator.boolean();

      final num = faker.randomGenerator.integer(100);

      final contentMatched = faker.randomGenerator.boolean();
      final nextAlarm = faker.randomGenerator.integer(100);
      final alarmInstanceStart = faker.date.dateTime().millisecondsSinceEpoch;
      final imapUid = faker.randomGenerator.integer(100);
      final part = faker.lorem.word();
      final calendarIntendedFor = faker.lorem.word();
      final origId = faker.guid.guid();
      final draftReplyType = faker.randomGenerator.element(ReplyType.values);
      final identityId = faker.guid.guid();
      final draftAccountId = faker.guid.guid();
      final draftAutoSendTime = faker.date.dateTime().millisecondsSinceEpoch;
      final sentDate = faker.date.dateTime().millisecondsSinceEpoch;
      final resentDate = faker.date.dateTime().millisecondsSinceEpoch;
      final messageIdHeader = faker.guid.guid();
      final folder = faker.guid.guid();
      final conversationId = faker.randomGenerator.integer(100);
      final messageId = faker.randomGenerator.integer(100);
      final revision = faker.randomGenerator.integer(100);
      final metadataVersion = faker.randomGenerator.integer(100);
      final version = faker.randomGenerator.integer(100);

      final inReplyTo = faker.internet.email();
      final calItemType = faker.randomGenerator.element(InviteType.values);

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

      final recurrenceRangeType = faker.randomGenerator.integer(3, min: 1);
      final attendee = faker.internet.email();
      final sentBy = faker.internet.email();
      final timezone = faker.lorem.word();
      final recurIdZ = faker.date.dateTime().toString();
      final recurrenceId = faker.date.dateTime().toString();
      final seq = faker.randomGenerator.integer(100);
      final tzOffset = faker.randomGenerator.integer(100);
      final taskPercentComplete = faker.lorem.word();
      final isRecurring = faker.randomGenerator.boolean();
      final hasExceptions = faker.randomGenerator.boolean();
      final hasOtherAttendees = faker.randomGenerator.boolean();
      final hasAlarm = faker.randomGenerator.boolean();
      final invId = faker.randomGenerator.integer(100);
      final allDay = faker.randomGenerator.boolean();
      final draft = faker.randomGenerator.boolean();
      final neverSent = faker.randomGenerator.boolean();
      final taskDueDate = faker.date.dateTime().millisecondsSinceEpoch;
      final taskTzOffsetDue = faker.randomGenerator.integer(100);

      final category = faker.lorem.word();
      final comment = faker.lorem.word();
      final contact = faker.lorem.word();
      final latitude = faker.randomGenerator.decimal().toString();
      final longitude = faker.randomGenerator.decimal().toString();

      final displayName = faker.person.name();
      final dir = faker.lorem.word();
      final language = faker.address.countryCode();
      final cuType = faker.lorem.word();
      final role = faker.lorem.word();
      final member = faker.internet.email();
      final delegatedTo = faker.internet.email();
      final delegatedFrom = faker.internet.email();
      final utcTime = faker.date.dateTime().millisecond;
      final dateTimeString = faker.date.dateTime().toString();

      final durationNegative = faker.randomGenerator.boolean();
      final weeks = faker.randomGenerator.integer(100);
      final days = faker.randomGenerator.integer(100);
      final hours = faker.randomGenerator.integer(100);
      final minutes = faker.randomGenerator.integer(100);
      final seconds = faker.randomGenerator.integer(100);
      final repeatCount = faker.randomGenerator.integer(100);

      final contentType = faker.lorem.word();
      final content = faker.lorem.word();
      final contentName = faker.lorem.word();
      final summary = faker.guid.guid();
      final description = faker.lorem.word();
      final htmlDescription = faker.lorem.word();
      final binaryB64Data = faker.lorem.word();

      final ival = faker.randomGenerator.integer(100);
      final list = faker.randomGenerator.amount((_) => random.integer(10), 10).join(',');
      final ordWk = faker.randomGenerator.integer(100);

      final partStat = faker.randomGenerator.element(ParticipationStatus.values);
      final componentNum = faker.randomGenerator.integer(100);
      final method = faker.lorem.word();
      final rsvp = faker.randomGenerator.boolean();
      final priority = faker.randomGenerator.integer(9).toString();
      final location = faker.address.streetAddress();
      final percentComplete = faker.randomGenerator.integer(100).toString();
      final completed = faker.date.dateTime().toString();
      final noBlob = faker.randomGenerator.boolean();
      final isOrganizer = faker.randomGenerator.boolean();
      final xUid = faker.guid.guid();
      final calItemId = faker.guid.guid();
      final deprecatedApptId = faker.guid.guid();
      final sequence = faker.randomGenerator.integer(100);
      final dateTime = faker.date.dateTime().millisecondsSinceEpoch;
      final calItemFolder = faker.lorem.word();
      final url = faker.internet.httpsUrl();
      final uri = faker.internet.uri('http');
      final startTime = faker.date.dateTime().millisecondsSinceEpoch;
      final duration = faker.randomGenerator.integer(100);
      final isException = faker.randomGenerator.boolean();
      final isAllDay = faker.randomGenerator.boolean();
      final isDraft = faker.randomGenerator.boolean();
      final changes = faker.lorem.words(3).join(',');

      final contentDisposition = faker.lorem.word();
      final contentFilename = faker.lorem.word();
      final contentId = faker.guid.guid();
      final body = faker.randomGenerator.boolean();
      final truncatedContent = faker.randomGenerator.boolean();

      final canExpand = faker.randomGenerator.boolean();
      final modifiedSequenceId = faker.randomGenerator.integer(100);
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

      final descEnabled = faker.randomGenerator.boolean();
      final lastEditedBy = faker.lorem.word();
      final creator = faker.lorem.word();
      final createdDate = faker.date.dateTime().millisecondsSinceEpoch;
      final lockOwnerId = faker.guid.guid();
      final lockOwnerEmail = faker.internet.email();
      final lockOwnerTimestamp = faker.date.dateTime().toString();

      final internalGrantExpiry = faker.randomGenerator.integer(100);
      final guestGrantExpiry = faker.randomGenerator.integer(100);
      final perm = faker.lorem.word();
      final granteeId = faker.guid.guid();
      final expiry = faker.randomGenerator.integer(100);
      final granteeName = faker.person.name();
      final guestPassword = faker.internet.password();
      final accessKey = faker.internet.password();

      final suggestedQueryString = faker.lorem.word();
      final wildcardString = faker.lorem.word();
      final expanded = faker.randomGenerator.boolean();
      final numExpanded = faker.randomGenerator.integer(100);

      final data = {
        'Body': {
          'SearchResponse': {
            '_jsns': 'urn:zimbraMail',
            'sortBy': sortBy.name,
            'offset': queryOffset,
            'more': queryMore,
            'total': totalSize,
            'hit': [
              {
                'id': id,
                'sf': sortField,
              }
            ],
            'c': [
              {
                'sf': sortField,
                'm': [
                  {
                    'id': id,
                    's': size,
                    'l': folderId,
                    'f': flags,
                    'autoSendTime': autoSendTime,
                    'd': date,
                  }
                ],
                'id': id,
                'n': numMsg,
                'u': numUnread,
                'total': totalSize,
                'f': flags,
                't': tags,
                'tn': tagNames,
                'd': date,
                'elided': elided,
                'md': changeDate,
                'ms': modifiedSequence,
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
                'su': {'_content': subject},
                'fr': {'_content': fragment},
                'e': [
                  {
                    'a': address,
                    'd': display,
                    'p': personal,
                    't': addressType.name,
                    'isGroup': isGroup,
                    'exp': canExpandGroupMembers,
                  }
                ],
              }
            ],
            'm': [
              {
                'sf': sortField,
                'cm': contentMatched,
                'hp': [
                  {
                    'part': part,
                  }
                ],
                'id': id,
                'i4uid': imapUid,
                'cif': calendarIntendedFor,
                'origid': origId,
                'rt': draftReplyType.name,
                'idnt': identityId,
                'forAcct': draftAccountId,
                'autoSendTime': draftAutoSendTime,
                'sd': sentDate,
                'rd': resentDate,
                'part': part,
                'fr': {'_content': fragment},
                'e': [
                  {
                    'a': address,
                    'd': display,
                    'p': personal,
                    't': addressType.name,
                    'isGroup': isGroup,
                    'exp': canExpandGroupMembers,
                  }
                ],
                'su': {'_content': subject},
                'mid': {'_content': messageIdHeader},
                'irt': inReplyTo,
                's': size,
                'd': date,
                'l': folder,
                'cid': conversationId.toString(),
                'f': flags,
                't': tags,
                'tn': tagNames,
                'rev': revision,
                'md': changeDate,
                'ms': modifiedSequence,
                'inv': {
                  'type': calItemType.name,
                  'tz': [
                    {
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
                    }
                  ],
                  'comp': {
                    'category': [
                      {'_content': category}
                    ],
                    'comment': [
                      {'_content': comment}
                    ],
                    'contact': [
                      {'_content': contact}
                    ],
                    'geo': {
                      'lat': latitude,
                      'lon': longitude,
                    },
                    'at': [
                      {
                        'a': address,
                        'url': url,
                        'd': displayName,
                        'sentBy': sentBy,
                        'dir': dir,
                        'lang': language,
                        'cutype': cuType,
                        'role': role,
                        'ptst': partStat.name,
                        'rsvp': rsvp,
                        'member': member,
                        'delegatedTo': delegatedTo,
                        'delegatedFrom': delegatedFrom,
                        'xparam': [
                          {
                            'name': name,
                            '_content': value,
                          }
                        ],
                      }
                    ],
                    'alarm': [
                      {
                        'action': AlarmAction.display.name,
                        'trigger': {
                          'abs': {
                            'd': dateTimeString,
                          },
                          'rel': {
                            'd': dateTimeString,
                          },
                        },
                        'repeat': {
                          'neg': durationNegative,
                          'w': weeks,
                          'd': days,
                          'h': hours,
                          'm': minutes,
                          's': seconds,
                          'related': AlarmRelated.start.name,
                          'count': repeatCount,
                        },
                        'desc': {'_content': description},
                        'attach': {
                          'uri': uri,
                          'ct': contentType,
                          '_content': binaryB64Data,
                        },
                        'summary': {'_content': summary},
                        'at': [
                          {
                            'a': address,
                            'url': url,
                            'd': displayName,
                            'sentBy': sentBy,
                            'dir': dir,
                            'lang': language,
                            'cutype': cuType,
                            'role': role,
                            'ptst': partStat.name,
                            'rsvp': rsvp,
                            'member': member,
                            'delegatedTo': delegatedTo,
                            'delegatedFrom': delegatedFrom,
                            'xparam': [
                              {
                                'name': name,
                                '_content': value,
                              }
                            ],
                          }
                        ],
                        'xprop': [
                          {
                            'name': name,
                            '_content': value,
                            'xparam': [
                              {
                                'name': name,
                                '_content': value,
                              }
                            ],
                          }
                        ],
                      }
                    ],
                    'xprop': [
                      {
                        'name': name,
                        '_content': value,
                        'xparam': [
                          {
                            'name': name,
                            '_content': value,
                          }
                        ],
                      }
                    ],
                    'fr': {'_content': fragment},
                    'desc': {'_content': description},
                    'descHtml': {'_content': htmlDescription},
                    'or': {
                      'a': address,
                      'url': url,
                      'd': displayName,
                      'sentBy': sentBy,
                      'dir': dir,
                      'lang': language,
                      'xparam': [
                        {
                          'name': name,
                          '_content': value,
                        }
                      ],
                    },
                    'recur': {
                      'add': [
                        {'add': {}}
                      ],
                      'exclude': [
                        {'exclude': {}}
                      ],
                      'except': [
                        {
                          'rangeType': recurrenceRangeType,
                          'recurId': recurrenceId,
                          'tz': timezone,
                          'ridZ': recurIdZ,
                          'add': {'add': []},
                          'exclude': {'exclude': []},
                        }
                      ],
                      'cancel': [
                        {
                          'rangeType': recurrenceRangeType,
                          'recurId': recurrenceId,
                          'tz': timezone,
                          'ridZ': recurIdZ,
                        }
                      ],
                      'dates': [
                        {
                          'tz': timezone,
                          'dtval': [
                            {
                              's': {
                                'd': dateTimeString,
                                'tz': timezone,
                                'u': utcTime,
                              },
                              'e': {
                                'd': dateTimeString,
                                'tz': timezone,
                                'u': utcTime,
                              },
                              'dur': {
                                'neg': durationNegative,
                                'w': weeks,
                                'd': days,
                                'h': hours,
                                'm': minutes,
                                's': seconds,
                                'related': AlarmRelated.start.name,
                                'count': repeatCount,
                              },
                            }
                          ],
                        }
                      ],
                      'rule': [
                        {
                          'freq': Frequency.second.name,
                          'until': {
                            'd': dateTimeString,
                          },
                          'count': {
                            'num': num,
                          },
                          'interval': {
                            'ival': ival,
                          },
                          'bysecond': {
                            'seclist': list,
                          },
                          'byminute': {
                            'minlist': list,
                          },
                          'byhour': {
                            'hrlist': list,
                          },
                          'byday': {
                            'wkday': [
                              {
                                'day': WeekDay.sunday.name,
                                'ordWk': ordWk,
                              }
                            ],
                          },
                          'bymonthday': {
                            'modaylist': list,
                          },
                          'byyearday': {
                            'yrdaylist': list,
                          },
                          'byweekno': {
                            'wklist': list,
                          },
                          'bymonth': {
                            'molist': list,
                          },
                          'bysetpos': {
                            'poslist': list,
                          },
                          'wkst': {
                            'day': WeekDay.sunday.name,
                          },
                          'rule-x-name': [
                            {
                              'name': name,
                              'value': value,
                            }
                          ],
                        }
                      ],
                    },
                    'exceptId': {
                      'd': dateTimeString,
                      'tz': timezone,
                      'rangeType': recurrenceRangeType,
                    },
                    's': {
                      'd': dateTimeString,
                      'tz': timezone,
                      'u': utcTime,
                    },
                    'e': {
                      'd': dateTimeString,
                      'tz': timezone,
                      'u': utcTime,
                    },
                    'dur': {
                      'neg': durationNegative,
                      'w': weeks,
                      'd': days,
                      'h': hours,
                      'm': minutes,
                      's': seconds,
                      'related': AlarmRelated.start.name,
                      'count': repeatCount,
                    },
                    'method': method,
                    'compNum': componentNum,
                    'rsvp': rsvp,
                    'priority': priority,
                    'name': name,
                    'loc': location,
                    'percentComplete': percentComplete,
                    'completed': completed,
                    'noBlob': noBlob,
                    'fba': FreeBusyStatus.free.name,
                    'fb': FreeBusyStatus.free.name,
                    'transp': Transparency.opaque.name,
                    'isOrg': isOrganizer,
                    'x_uid': xUid,
                    'uid': uid,
                    'seq': sequence,
                    'd': dateTime,
                    'calItemId': calItemId,
                    'apptId': deprecatedApptId,
                    'ciFolder': calItemFolder,
                    'status': InviteStatus.completed.name,
                    'class': InviteClass.public.name,
                    'url': url,
                    'ex': isException,
                    'ridZ': recurIdZ,
                    'allDay': isAllDay,
                    'draft': isDraft,
                    'neverSent': neverSent,
                    'changes': changes,
                  },
                  'replies': {
                    'reply': [
                      {
                        'rangeType': recurrenceRangeType,
                        'recurId': recurrenceId,
                        'seq': seq,
                        'd': date,
                        'at': attendee,
                        'sentBy': sentBy,
                        'ptst': partStat.name,
                        'tz': timezone,
                        'ridZ': recurIdZ,
                      }
                    ]
                  }
                },
                'header': [
                  {
                    'n': key,
                    '_content': value,
                  }
                ],
                'mp': [
                  {
                    'part': part,
                    'ct': contentType,
                    's': size,
                    'cd': contentDisposition,
                    'filename': contentFilename,
                    'ci': contentId,
                    'cl': location,
                    'body': body,
                    'truncated': truncatedContent,
                    'content': {'_content': content},
                    'mp': [
                      {
                        'part': part,
                        'ct': contentType,
                        's': size,
                        'cd': contentDisposition,
                        'filename': contentFilename,
                        'ci': contentId,
                        'cl': location,
                        'body': body,
                        'truncated': truncatedContent,
                        'content': {'_content': content},
                      }
                    ],
                  }
                ],
                'shr': [
                  {
                    'truncated': truncatedContent,
                    'content': {'_content': content},
                  }
                ],
                'dlSubs': [
                  {
                    'truncated': truncatedContent,
                    'content': {'_content': content},
                  }
                ],
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
              }
            ],
            'chat': [
              {
                'sf': sortField,
                'cm': contentMatched,
                'id': id,
                'i4uid': imapUid,
                'cif': calendarIntendedFor,
                'origid': origId,
                'rt': draftReplyType.name,
                'idnt': identityId,
                'forAcct': draftAccountId,
                'autoSendTime': draftAutoSendTime,
                'sd': sentDate,
                'rd': resentDate,
                'part': part,
                'fr': {'_content': fragment},
                'su': {'_content': subject},
                'mid': {'_content': messageIdHeader},
                'irt': inReplyTo,
                's': size,
                'd': date,
                'l': folder,
                'cid': conversationId.toString(),
                'f': flags,
                't': tags,
                'tn': tagNames,
                'rev': revision,
                'md': changeDate,
                'ms': modifiedSequence,
              }
            ],
            'mp': [
              {
                'id': id,
                'sf': sortField,
                's': size,
                'd': date,
                'cid': conversationId,
                'mid': messageId,
                'ct': contentType,
                'name': contentName,
                'part': part,
                'e': {
                  'a': address,
                  'd': display,
                  'p': personal,
                  't': addressType.name,
                  'isGroup': isGroup,
                  'exp': canExpandGroupMembers,
                },
                'su': {'_content': subject},
              }
            ],
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
            'note': [
              {
                'sf': sortField,
                'id': id,
                'rev': revision,
                'l': folder,
                'd': date,
                'f': flags,
                't': tags,
                'tn': tagNames,
                'pos': bounds,
                'color': color,
                'rgb': rgb,
                'md': changeDate,
                'ms': modifiedSequence,
                'content': {'_content': content},
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
              }
            ],
            'doc': [
              {
                'sf': sortField,
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
                    'a': [
                      {
                        'n': key,
                        '_content': value,
                      }
                    ],
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
            'w': [
              {
                'sf': sortField,
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
                    'a': [
                      {
                        'n': key,
                        '_content': value,
                      }
                    ],
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
            'appt': [
              {
                'sf': sortField,
                'd': date,
                'cm': contentMatched,
                'nextAlarm': nextAlarm,
                'or': {
                  'a': address,
                  'url': url,
                  'd': displayName,
                  'sentBy': sentBy,
                  'dir': dir,
                  'lang': language,
                  'xparam': [
                    {
                      'name': name,
                      '_content': value,
                    }
                  ],
                },
                'category': [
                  {'_content': category}
                ],
                'geo': {
                  'lat': latitude,
                  'lon': longitude,
                },
                'fr': {'_content': fragment},
                'inst': [
                  {
                    's': startTime,
                    'ex': isException,
                    'or': {
                      'a': address,
                      'url': url,
                      'd': displayName,
                      'sentBy': sentBy,
                      'dir': dir,
                      'lang': language,
                      'xparam': [
                        {
                          'name': name,
                          '_content': value,
                        }
                      ],
                    },
                    'category': [
                      {'_content': category}
                    ],
                    'geo': {
                      'lat': latitude,
                      'lon': longitude,
                    },
                    'fr': {'_content': fragment},
                    'dur': duration,
                    'ptst': partStat.name,
                    'ridZ': recurIdZ,
                    'tzo': tzOffset,
                    'fba': FreeBusyStatus.free.name,
                    'percentComplete': taskPercentComplete,
                    'recur': isRecurring,
                    'hasEx': hasExceptions,
                    'priority': priority,
                    'fb': FreeBusyStatus.free.name,
                    'transp': Transparency.opaque.name,
                    'name': name,
                    'loc': location,
                    'otherAtt': hasOtherAttendees,
                    'alarm': hasAlarm,
                    'isOrg': isOrganizer,
                    'invId': invId.toString(),
                    'compNum': componentNum,
                    'status': InviteStatus.completed.name,
                    'class': InviteClass.public.name,
                    'allDay': allDay,
                    'draft': draft,
                    'neverSent': neverSent,
                    'dueDate': taskDueDate,
                    'tzoDue': taskTzOffsetDue,
                  }
                ],
                'alarmData': {
                  'nextAlarm': nextAlarm,
                  'alarmInstStart': alarmInstanceStart,
                  'invId': invId,
                  'compNum': componentNum,
                  'name': name,
                  'loc': location,
                  'alarm': {
                    'action': AlarmAction.display.name,
                    'trigger': {
                      'abs': {
                        'd': dateTimeString,
                      },
                      'rel': {
                        'd': dateTimeString,
                      },
                    },
                    'repeat': {
                      'neg': durationNegative,
                      'w': weeks,
                      'd': days,
                      'h': hours,
                      'm': minutes,
                      's': seconds,
                      'related': AlarmRelated.start.name,
                      'count': repeatCount,
                    },
                    'desc': {'_content': description},
                    'attach': {
                      'uri': uri,
                      'ct': contentType,
                      '_content': binaryB64Data,
                    },
                    'summary': {'_content': summary},
                    'at': [
                      {
                        'a': address,
                        'url': url,
                        'd': displayName,
                        'sentBy': sentBy,
                        'dir': dir,
                        'lang': language,
                        'cutype': cuType,
                        'role': role,
                        'ptst': partStat.name,
                        'rsvp': rsvp,
                        'member': member,
                        'delegatedTo': delegatedTo,
                        'delegatedFrom': delegatedFrom,
                        'xparam': [
                          {
                            'name': name,
                            '_content': value,
                          }
                        ],
                      }
                    ],
                    'xprop': [
                      {
                        'name': name,
                        '_content': value,
                        'xparam': [
                          {
                            'name': name,
                            '_content': value,
                          }
                        ],
                      }
                    ],
                  },
                },
                'inv': [
                  {
                    'type': calItemType.name,
                    'seq': sequence,
                    'id': id,
                    'compNum': componentNum,
                    'recurId': recurrenceId,
                    'tz': [
                      {
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
                      }
                    ],
                    'comp': {
                      'category': [
                        {'_content': category}
                      ],
                      'comment': [
                        {'_content': comment}
                      ],
                      'contact': [
                        {'_content': contact}
                      ],
                      'geo': {
                        'lat': latitude,
                        'lon': longitude,
                      },
                      'at': [
                        {
                          'a': address,
                          'url': url,
                          'd': displayName,
                          'sentBy': sentBy,
                          'dir': dir,
                          'lang': language,
                          'cutype': cuType,
                          'role': role,
                          'ptst': partStat.name,
                          'rsvp': rsvp,
                          'member': member,
                          'delegatedTo': delegatedTo,
                          'delegatedFrom': delegatedFrom,
                          'xparam': [
                            {
                              'name': name,
                              '_content': value,
                            }
                          ],
                        }
                      ],
                      'alarm': [
                        {
                          'action': AlarmAction.display.name,
                          'trigger': {
                            'abs': {
                              'd': dateTimeString,
                            },
                            'rel': {
                              'd': dateTimeString,
                            },
                          },
                          'repeat': {
                            'neg': durationNegative,
                            'w': weeks,
                            'd': days,
                            'h': hours,
                            'm': minutes,
                            's': seconds,
                            'related': AlarmRelated.start.name,
                            'count': repeatCount,
                          },
                          'desc': {'_content': description},
                          'attach': {
                            'uri': uri,
                            'ct': contentType,
                            '_content': binaryB64Data,
                          },
                          'summary': {'_content': summary},
                          'at': [
                            {
                              'a': address,
                              'url': url,
                              'd': displayName,
                              'sentBy': sentBy,
                              'dir': dir,
                              'lang': language,
                              'cutype': cuType,
                              'role': role,
                              'ptst': partStat.name,
                              'rsvp': rsvp,
                              'member': member,
                              'delegatedTo': delegatedTo,
                              'delegatedFrom': delegatedFrom,
                              'xparam': [
                                {
                                  'name': name,
                                  '_content': value,
                                }
                              ],
                            }
                          ],
                          'xprop': [
                            {
                              'name': name,
                              '_content': value,
                              'xparam': [
                                {
                                  'name': name,
                                  '_content': value,
                                }
                              ],
                            }
                          ],
                        }
                      ],
                      'xprop': [
                        {
                          'name': name,
                          '_content': value,
                          'xparam': [
                            {
                              'name': name,
                              '_content': value,
                            }
                          ],
                        }
                      ],
                      'fr': {'_content': fragment},
                      'desc': {'_content': description},
                      'descHtml': {'_content': htmlDescription},
                      'or': {
                        'a': address,
                        'url': url,
                        'd': displayName,
                        'sentBy': sentBy,
                        'dir': dir,
                        'lang': language,
                        'xparam': [
                          {
                            'name': name,
                            '_content': value,
                          }
                        ],
                      },
                      'recur': {
                        'add': [
                          {'add': []}
                        ],
                        'exclude': [
                          {'exclude': []}
                        ],
                        'except': [
                          {
                            'rangeType': recurrenceRangeType,
                            'recurId': recurrenceId,
                            'tz': timezone,
                            'ridZ': recurIdZ,
                            'add': {'add': []},
                            'exclude': {'exclude': []},
                          }
                        ],
                        'cancel': [
                          {
                            'rangeType': recurrenceRangeType,
                            'recurId': recurrenceId,
                            'tz': timezone,
                            'ridZ': recurIdZ,
                          }
                        ],
                        'dates': [
                          {
                            'tz': timezone,
                            'dtval': [
                              {
                                's': {
                                  'd': dateTimeString,
                                  'tz': timezone,
                                  'u': utcTime,
                                },
                                'e': {
                                  'd': dateTimeString,
                                  'tz': timezone,
                                  'u': utcTime,
                                },
                                'dur': {
                                  'neg': durationNegative,
                                  'w': weeks,
                                  'd': days,
                                  'h': hours,
                                  'm': minutes,
                                  's': seconds,
                                  'related': AlarmRelated.start.name,
                                  'count': repeatCount,
                                },
                              }
                            ],
                          }
                        ],
                        'rule': [
                          {
                            'freq': Frequency.second.name,
                            'until': {
                              'd': dateTimeString,
                            },
                            'count': {
                              'num': num,
                            },
                            'interval': {
                              'ival': ival,
                            },
                            'bysecond': {
                              'seclist': list,
                            },
                            'byminute': {
                              'minlist': list,
                            },
                            'byhour': {
                              'hrlist': list,
                            },
                            'byday': {
                              'wkday': [
                                {
                                  'day': WeekDay.sunday.name,
                                  'ordWk': ordWk,
                                }
                              ],
                            },
                            'bymonthday': {
                              'modaylist': list,
                            },
                            'byyearday': {
                              'yrdaylist': list,
                            },
                            'byweekno': {
                              'wklist': list,
                            },
                            'bymonth': {
                              'molist': list,
                            },
                            'bysetpos': {
                              'poslist': list,
                            },
                            'wkst': {
                              'day': WeekDay.sunday.name,
                            },
                            'rule-x-name': [
                              {
                                'name': name,
                                'value': value,
                              }
                            ],
                          }
                        ],
                      },
                      'exceptId': {
                        'd': dateTimeString,
                        'tz': timezone,
                        'rangeType': recurrenceRangeType,
                      },
                      's': {
                        'd': dateTimeString,
                        'tz': timezone,
                        'u': utcTime,
                      },
                      'e': {
                        'd': dateTimeString,
                        'tz': timezone,
                        'u': utcTime,
                      },
                      'dur': {
                        'neg': durationNegative,
                        'w': weeks,
                        'd': days,
                        'h': hours,
                        'm': minutes,
                        's': seconds,
                        'related': AlarmRelated.start.name,
                        'count': repeatCount,
                      },
                      'method': method,
                      'compNum': componentNum,
                      'rsvp': rsvp,
                      'priority': priority,
                      'name': name,
                      'loc': location,
                      'percentComplete': percentComplete,
                      'completed': completed,
                      'noBlob': noBlob,
                      'fba': FreeBusyStatus.free.name,
                      'fb': FreeBusyStatus.free.name,
                      'transp': Transparency.opaque.name,
                      'isOrg': isOrganizer,
                      'x_uid': xUid,
                      'uid': uid,
                      'seq': sequence,
                      'd': dateTime,
                      'calItemId': calItemId,
                      'apptId': deprecatedApptId,
                      'ciFolder': calItemFolder,
                      'status': InviteStatus.completed.name,
                      'class': InviteClass.public.name,
                      'url': url,
                      'ex': isException,
                      'ridZ': recurIdZ,
                      'allDay': isAllDay,
                      'draft': isDraft,
                      'neverSent': neverSent,
                      'changes': changes,
                    },
                    'mp': [
                      {
                        'part': part,
                        'ct': contentType,
                        's': size,
                        'cd': contentDisposition,
                        'filename': contentFilename,
                        'ci': contentId,
                        'cl': location,
                        'body': body,
                        'truncated': truncatedContent,
                        'content': {'_content': content},
                        'mp': [
                          {
                            'part': part,
                            'ct': contentType,
                            's': size,
                            'cd': contentDisposition,
                            'filename': contentFilename,
                            'ci': contentId,
                            'cl': location,
                            'body': body,
                            'truncated': truncatedContent,
                            'content': {'_content': content},
                          }
                        ],
                      }
                    ],
                    'shr': [
                      {
                        'truncated': truncatedContent,
                        'content': {'_content': content},
                      }
                    ],
                    'dlSubs': [
                      {
                        'truncated': truncatedContent,
                        'content': {'_content': content},
                      }
                    ],
                  }
                ],
                'replies': {
                  'reply': [
                    {
                      'rangeType': recurrenceRangeType,
                      'recurId': recurrenceId,
                      'at': attendee,
                      'sentBy': sentBy,
                      'ptst': partStat.name,
                      'seq': sequence,
                      'd': date,
                      'tz': timezone,
                      'ridZ': recurIdZ,
                    }
                  ]
                },
                'x_uid': xUid,
                'uid': uid,
                'f': flags,
                't': tags,
                'tn': tagNames,
                'l': folderId,
                's': size,
                'md': changeDate,
                'ms': modifiedSequence,
                'rev': revision,
                'id': id,
                'dur': duration,
                'ptst': partStat.name,
                'ridZ': recurIdZ,
                'tzo': tzOffset,
                'fba': FreeBusyStatus.free.name,
                'percentComplete': taskPercentComplete,
                'recur': isRecurring,
                'hasEx': hasExceptions,
                'priority': priority,
                'fb': FreeBusyStatus.free.name,
                'transp': Transparency.opaque.name,
                'name': name,
                'loc': location,
                'otherAtt': hasOtherAttendees,
                'alarm': hasAlarm,
                'isOrg': isOrganizer,
                'invId': invId.toString(),
                'compNum': componentNum,
                'status': InviteStatus.completed.name,
                'class': InviteClass.public.name,
                'allDay': allDay,
                'draft': draft,
                'neverSent': neverSent,
                'dueDate': taskDueDate,
                'tzoDue': taskTzOffsetDue,
              }
            ],
            'task': [
              {
                'sf': sortField,
                'd': date,
                'cm': contentMatched,
                'nextAlarm': nextAlarm,
                'fr': {'_content': fragment},
                'x_uid': xUid,
                'uid': uid,
                'f': flags,
                't': tags,
                'tn': tagNames,
                'l': folderId,
                's': size,
                'md': changeDate,
                'ms': modifiedSequence,
                'rev': revision,
                'id': id,
                'dur': duration,
                'ptst': partStat.name,
                'ridZ': recurIdZ,
                'tzo': tzOffset,
                'fba': FreeBusyStatus.free.name,
                'percentComplete': taskPercentComplete,
                'recur': isRecurring,
                'hasEx': hasExceptions,
                'priority': priority,
                'fb': FreeBusyStatus.free.name,
                'transp': Transparency.opaque.name,
                'name': name,
                'loc': location,
                'otherAtt': hasOtherAttendees,
                'alarm': hasAlarm,
                'isOrg': isOrganizer,
                'invId': invId.toString(),
                'compNum': componentNum,
                'status': InviteStatus.completed.name,
                'class': InviteClass.public.name,
                'allDay': allDay,
                'draft': draft,
                'neverSent': neverSent,
                'dueDate': taskDueDate,
                'tzoDue': taskTzOffsetDue,
              }
            ],
            'info': {
              'suggest': [
                {
                  '_content': suggestedQueryString,
                }
              ],
              'wildcard': [
                {
                  'str': wildcardString,
                  'expanded': expanded,
                  'numExpanded': numExpanded,
                }
              ],
            }
          }
        }
      };
      final envelope = SearchEnvelope.fromMap(data);
      final response = envelope.body.response as SearchResponse;

      expect(response.sortBy, sortBy);
      expect(response.queryOffset, queryOffset);
      expect(response.queryMore, queryMore);
      expect(response.totalSize, totalSize);

      final simpleHit = response.simpleHits.first;
      expect(simpleHit.sortField, sortField);
      expect(simpleHit.id, id);

      final convHit = response.conversationHits.first;
      expect(convHit.sortField, sortField);
      expect(convHit.id, id);
      expect(convHit.numMsg, numMsg);
      expect(convHit.numUnread, numUnread);
      expect(convHit.totalSize, totalSize);
      expect(convHit.flags, flags);
      expect(convHit.tags, tags);
      expect(convHit.tagNames, tagNames);
      expect(convHit.date, date);
      expect(convHit.elided, elided);
      expect(convHit.changeDate, changeDate);
      expect(convHit.modifiedSequence, modifiedSequence);
      expect(convHit.subject, subject);
      expect(convHit.fragment, fragment);

      final convHitMsg = convHit.messageHits.first;
      expect(convHitMsg.id, id);
      expect(convHitMsg.size, size);
      expect(convHitMsg.folderId, folderId);
      expect(convHitMsg.flags, flags);
      expect(convHitMsg.autoSendTime, autoSendTime);
      expect(convHitMsg.date, date);

      final convHitMeta = convHit.metadatas.first;
      expect(convHitMeta.section, section);
      expect(convHitMeta.keyValuePairs.first.key, key);
      expect(convHitMeta.keyValuePairs.first.value, value);

      final convHitEmail = convHit.emails.first;
      expect(convHitEmail.address, address);
      expect(convHitEmail.display, display);
      expect(convHitEmail.personal, personal);
      expect(convHitEmail.addressType, addressType);
      expect(convHitEmail.isGroup, isGroup);
      expect(convHitEmail.canExpandGroupMembers, canExpandGroupMembers);

      final msgHit = response.messageHits.first;
      expect(msgHit.sortField, sortField);
      expect(msgHit.contentMatched, contentMatched);
      expect(msgHit.id, id);
      expect(msgHit.imapUid, imapUid);
      expect(msgHit.calendarIntendedFor, calendarIntendedFor);
      expect(msgHit.origId, origId);
      expect(msgHit.draftReplyType, draftReplyType);
      expect(msgHit.identityId, identityId);
      expect(msgHit.draftAccountId, draftAccountId);
      expect(msgHit.draftAutoSendTime, draftAutoSendTime);
      expect(msgHit.sentDate, sentDate);
      expect(msgHit.resentDate, resentDate);
      expect(msgHit.part, part);
      expect(msgHit.fragment, fragment);
      expect(msgHit.subject, subject);
      expect(msgHit.messageIdHeader, messageIdHeader);
      expect(msgHit.inReplyTo, inReplyTo);
      expect(msgHit.size, size);
      expect(msgHit.date, date);
      expect(msgHit.folder, folder);
      expect(msgHit.conversationId, conversationId.toString());
      expect(msgHit.flags, flags);
      expect(msgHit.tags, tags);
      expect(msgHit.tagNames, tagNames);
      expect(msgHit.revision, revision);
      expect(msgHit.changeDate, changeDate);
      expect(msgHit.modifiedSequence, modifiedSequence);

      final msgHitPart = msgHit.messagePartHits.first;
      expect(msgHitPart.part, part);

      final msgHitEmail = msgHit.emails.first;
      expect(msgHitEmail.address, address);
      expect(msgHitEmail.display, display);
      expect(msgHitEmail.personal, personal);
      expect(msgHitEmail.addressType, addressType);
      expect(msgHitEmail.isGroup, isGroup);
      expect(msgHitEmail.canExpandGroupMembers, canExpandGroupMembers);

      final msgHitHeader = msgHit.headers.first;
      expect(msgHitHeader.key, key);
      expect(msgHitHeader.value, value);

      final msgHitPartInfo = msgHit.partInfos.first;
      expect(msgHitPartInfo.part, part);
      expect(msgHitPartInfo.contentType, contentType);
      expect(msgHitPartInfo.size, size);
      expect(msgHitPartInfo.contentDisposition, contentDisposition);
      expect(msgHitPartInfo.contentFilename, contentFilename);
      expect(msgHitPartInfo.contentId, contentId);
      expect(msgHitPartInfo.location, location);
      expect(msgHitPartInfo.body, body);
      expect(msgHitPartInfo.truncatedContent, truncatedContent);
      expect(msgHitPartInfo.content, content);

      final msgHitMimePart = msgHitPartInfo.mimeParts.first;
      expect(msgHitMimePart.part, part);
      expect(msgHitMimePart.contentType, contentType);
      expect(msgHitMimePart.size, size);
      expect(msgHitMimePart.contentDisposition, contentDisposition);
      expect(msgHitMimePart.contentFilename, contentFilename);
      expect(msgHitMimePart.contentId, contentId);
      expect(msgHitMimePart.location, location);
      expect(msgHitMimePart.body, body);
      expect(msgHitMimePart.truncatedContent, truncatedContent);
      expect(msgHitMimePart.content, content);

      final msgHitShr = msgHit.shareNotifications.first;
      expect(msgHitShr.content, content);
      expect(msgHitShr.truncatedContent, truncatedContent);

      final msgHitDlSubs = msgHit.dlSubsNotifications.first;
      expect(msgHitDlSubs.content, content);
      expect(msgHitDlSubs.truncatedContent, truncatedContent);

      final msgHitMsgMeta = msgHit.metadatas.first;
      expect(msgHitMsgMeta.section, section);
      expect(msgHitMsgMeta.keyValuePairs.first.key, key);
      expect(msgHitMsgMeta.keyValuePairs.first.value, value);

      final msgHitInvite = msgHit.invite!;
      expect(msgHitInvite.calItemType, calItemType);

      final msgHitTz = msgHitInvite.timezones.first;
      expect(msgHitTz.id, id);
      expect(msgHitTz.tzStdOffset, tzStdOffset);
      expect(msgHitTz.tzDayOffset, tzDayOffset);
      expect(msgHitTz.standardTZName, standardTZName);
      expect(msgHitTz.daylightTZName, daylightTZName);

      final msgHitStandard = msgHitTz.standardTzOnset!;
      expect(msgHitStandard.month, month);
      expect(msgHitStandard.hour, hour);
      expect(msgHitStandard.minute, minute);
      expect(msgHitStandard.second, second);
      expect(msgHitStandard.dayOfMonth, dayOfMonth);
      expect(msgHitStandard.week, week);
      expect(msgHitStandard.dayOfWeek, dayOfWeek);

      final msgHitDaylight = msgHitTz.daylightTzOnset!;
      expect(msgHitDaylight.month, month);
      expect(msgHitDaylight.hour, hour);
      expect(msgHitDaylight.minute, minute);
      expect(msgHitDaylight.second, second);
      expect(msgHitDaylight.dayOfMonth, dayOfMonth);
      expect(msgHitDaylight.week, week);
      expect(msgHitDaylight.dayOfWeek, dayOfWeek);

      final msgHitReply = msgHitInvite.calendarReplies.first;
      expect(msgHitReply.recurrenceRangeType, recurrenceRangeType);
      expect(msgHitReply.recurrenceId, recurrenceId);
      expect(msgHitReply.seq, seq);
      expect(msgHitReply.date, date);
      expect(msgHitReply.attendee, attendee);
      expect(msgHitReply.sentBy, sentBy);
      expect(msgHitReply.partStat, partStat);
      expect(msgHitReply.timezone, timezone);
      expect(msgHitReply.recurIdZ, recurIdZ);

      final msgHitComp = msgHitInvite.inviteComponent!;
      expect(msgHitComp.method, method);
      expect(msgHitComp.componentNum, componentNum);
      expect(msgHitComp.rsvp, rsvp);
      expect(msgHitComp.priority, priority);
      expect(msgHitComp.name, name);
      expect(msgHitComp.location, location);
      expect(msgHitComp.percentComplete, percentComplete);
      expect(msgHitComp.completed, completed);
      expect(msgHitComp.noBlob, noBlob);
      expect(msgHitComp.freeBusyActual, FreeBusyStatus.free);
      expect(msgHitComp.freeBusy, FreeBusyStatus.free);
      expect(msgHitComp.transparency, Transparency.opaque);
      expect(msgHitComp.isOrganizer, isOrganizer);
      expect(msgHitComp.xUid, xUid);
      expect(msgHitComp.uid, uid);
      expect(msgHitComp.sequence, sequence);
      expect(msgHitComp.dateTime, dateTime);
      expect(msgHitComp.calItemId, calItemId);
      expect(msgHitComp.deprecatedApptId, deprecatedApptId);
      expect(msgHitComp.calItemFolder, calItemFolder);
      expect(msgHitComp.status, InviteStatus.completed);
      expect(msgHitComp.calClass, InviteClass.public);
      expect(msgHitComp.url, url);
      expect(msgHitComp.isException, isException);
      expect(msgHitComp.recurIdZ, recurIdZ);
      expect(msgHitComp.isAllDay, isAllDay);
      expect(msgHitComp.isDraft, isDraft);
      expect(msgHitComp.neverSent, neverSent);
      expect(msgHitComp.changes, changes);
      expect(msgHitComp.fragment, fragment);
      expect(msgHitComp.description, description);
      expect(msgHitComp.htmlDescription, htmlDescription);
      expect(msgHitComp.categories.first, category);
      expect(msgHitComp.comments.first, comment);
      expect(msgHitComp.contacts.first, contact);

      final msgHitGeo = msgHitComp.geo!;
      expect(msgHitGeo.latitude, latitude);
      expect(msgHitGeo.longitude, longitude);

      final msgHitAtt = msgHitComp.attendees.first;
      expect(msgHitAtt.address, address);
      expect(msgHitAtt.url, url);
      expect(msgHitAtt.displayName, displayName);
      expect(msgHitAtt.sentBy, sentBy);
      expect(msgHitAtt.dir, dir);
      expect(msgHitAtt.language, language);
      expect(msgHitAtt.cuType, cuType);
      expect(msgHitAtt.role, role);
      expect(msgHitAtt.partStat, partStat);
      expect(msgHitAtt.rsvp, rsvp);
      expect(msgHitAtt.member, member);
      expect(msgHitAtt.delegatedTo, delegatedTo);
      expect(msgHitAtt.delegatedFrom, delegatedFrom);
      expect(msgHitAtt.xParams.first.name, name);
      expect(msgHitAtt.xParams.first.value, value);

      final msgHitAlarm = msgHitComp.alarms.first;
      expect(msgHitAlarm.action, AlarmAction.display);
      expect(msgHitAlarm.description, description);
      expect(msgHitAlarm.summary, summary);
      expect(msgHitAlarm.attach!.uri, uri);
      expect(msgHitAlarm.attach!.contentType, contentType);
      expect(msgHitAlarm.attach!.binaryB64Data, binaryB64Data);

      final msgHitAlarmAtt = msgHitAlarm.attendees.first;
      expect(msgHitAlarmAtt.address, address);
      expect(msgHitAlarmAtt.url, url);
      expect(msgHitAlarmAtt.displayName, displayName);
      expect(msgHitAlarmAtt.sentBy, sentBy);
      expect(msgHitAlarmAtt.dir, dir);
      expect(msgHitAlarmAtt.language, language);
      expect(msgHitAlarmAtt.cuType, cuType);
      expect(msgHitAlarmAtt.role, role);
      expect(msgHitAlarmAtt.partStat, partStat);
      expect(msgHitAlarmAtt.rsvp, rsvp);
      expect(msgHitAlarmAtt.member, member);
      expect(msgHitAlarmAtt.delegatedTo, delegatedTo);
      expect(msgHitAlarmAtt.delegatedFrom, delegatedFrom);
      expect(msgHitAlarmAtt.xParams.first.name, name);
      expect(msgHitAlarmAtt.xParams.first.value, value);

      final msgHitAlarmXProp = msgHitAlarm.xProps.first;
      expect(msgHitAlarmXProp.name, name);
      expect(msgHitAlarmXProp.value, value);
      expect(msgHitAlarmXProp.xParams.first.name, name);
      expect(msgHitAlarmXProp.xParams.first.value, value);

      final msgHitCompXProp = msgHitComp.xProps.first;
      expect(msgHitCompXProp.name, name);
      expect(msgHitCompXProp.value, value);
      expect(msgHitCompXProp.xParams.first.name, name);
      expect(msgHitCompXProp.xParams.first.value, value);

      final msgHitOrganizer = msgHitComp.organizer!;
      expect(msgHitOrganizer.address, address);
      expect(msgHitOrganizer.url, url);
      expect(msgHitOrganizer.displayName, displayName);
      expect(msgHitOrganizer.sentBy, sentBy);
      expect(msgHitOrganizer.dir, dir);
      expect(msgHitOrganizer.language, language);
      expect(msgHitOrganizer.xParams.first.name, name);
      expect(msgHitOrganizer.xParams.first.value, value);

      final msgHitRecurrence = msgHitComp.recurrence!;
      expect(msgHitRecurrence.add.first, isA<AddRecurrenceInfo>());
      expect(msgHitRecurrence.exclude.first, isA<ExcludeRecurrenceInfo>());

      final msgHitExcept = msgHitRecurrence.except.first;
      expect(msgHitExcept.recurrenceRangeType, recurrenceRangeType);
      expect(msgHitExcept.recurrenceId, recurrenceId);
      expect(msgHitExcept.timezone, timezone);
      expect(msgHitExcept.recurIdZ, recurIdZ);
      expect(msgHitExcept.add, isA<RecurrenceInfo>());
      expect(msgHitExcept.exclude, isA<RecurrenceInfo>());

      final msgHitCancel = msgHitRecurrence.cancel.first;
      expect(msgHitCancel.recurrenceRangeType, recurrenceRangeType);
      expect(msgHitCancel.recurrenceId, recurrenceId);
      expect(msgHitCancel.timezone, timezone);
      expect(msgHitCancel.recurIdZ, recurIdZ);
      final msgHitDates = msgHitRecurrence.dates.first;
      expect(msgHitDates.timezone, timezone);

      final msgHitStartTime = msgHitDates.dtVals.first.startTime!;
      expect(msgHitStartTime.dateTime, dateTimeString);
      expect(msgHitStartTime.timezone, timezone);
      expect(msgHitStartTime.utcTime, utcTime);

      final msgHitEndTime = msgHitDates.dtVals.first.endTime!;
      expect(msgHitEndTime.dateTime, dateTimeString);
      expect(msgHitEndTime.timezone, timezone);
      expect(msgHitEndTime.utcTime, utcTime);

      final msgHitDuration = msgHitDates.dtVals.first.duration!;
      expect(msgHitDuration.durationNegative, durationNegative);
      expect(msgHitDuration.weeks, weeks);
      expect(msgHitDuration.days, days);
      expect(msgHitDuration.hours, hours);
      expect(msgHitDuration.minutes, minutes);
      expect(msgHitDuration.seconds, seconds);
      expect(msgHitDuration.related, AlarmRelated.start);
      expect(msgHitDuration.repeatCount, repeatCount);

      final msgHitSimple = msgHitRecurrence.simple.first;
      expect(msgHitSimple.until!.dateTime, dateTimeString);
      expect(msgHitSimple.count!.num, num);
      expect(msgHitSimple.interval!.ival, ival);
      expect(msgHitSimple.bySecond!.list, list);
      expect(msgHitSimple.byMinute!.list, list);
      expect(msgHitSimple.byHour!.list, list);
      expect(msgHitSimple.byDay!.days.first.day, WeekDay.sunday);
      expect(msgHitSimple.byDay!.days.first.ordWk, ordWk);
      expect(msgHitSimple.byMonthDay!.list, list);
      expect(msgHitSimple.byYearDay!.list, list);
      expect(msgHitSimple.byWeekNo!.list, list);
      expect(msgHitSimple.byMonth!.list, list);
      expect(msgHitSimple.bySetPose!.list, list);
      expect(msgHitSimple.weekStart!.day, WeekDay.sunday);
      expect(msgHitSimple.xNames.first.name, name);
      expect(msgHitSimple.xNames.first.value, value);

      final msgHitExceptionId = msgHitComp.exceptionId!;
      expect(msgHitExceptionId.dateTime, dateTimeString);
      expect(msgHitExceptionId.timezone, timezone);
      expect(msgHitExceptionId.recurrenceRangeType, recurrenceRangeType);

      final msgHitDtStart = msgHitComp.dtStart!;
      expect(msgHitDtStart.dateTime, dateTimeString);
      expect(msgHitDtStart.timezone, timezone);
      expect(msgHitDtStart.utcTime, utcTime);

      final msgHitDtEnd = msgHitComp.dtEnd!;
      expect(msgHitDtEnd.dateTime, dateTimeString);
      expect(msgHitDtEnd.timezone, timezone);
      expect(msgHitDtEnd.utcTime, utcTime);

      final msgHitInviteDuration = msgHitComp.duration!;
      expect(msgHitInviteDuration.durationNegative, durationNegative);
      expect(msgHitInviteDuration.weeks, weeks);
      expect(msgHitInviteDuration.days, days);
      expect(msgHitInviteDuration.hours, hours);
      expect(msgHitInviteDuration.minutes, minutes);
      expect(msgHitInviteDuration.seconds, seconds);
      expect(msgHitInviteDuration.related, AlarmRelated.start);
      expect(msgHitInviteDuration.repeatCount, repeatCount);

      final chatHit = response.chatHits.first;
      expect(chatHit, isA<MessageHitInfo>());
      expect(chatHit.sortField, sortField);
      expect(chatHit.contentMatched, contentMatched);
      expect(chatHit.id, id);
      expect(chatHit.imapUid, imapUid);
      expect(chatHit.calendarIntendedFor, calendarIntendedFor);
      expect(chatHit.origId, origId);
      expect(chatHit.draftReplyType, draftReplyType);
      expect(chatHit.identityId, identityId);
      expect(chatHit.draftAccountId, draftAccountId);
      expect(chatHit.draftAutoSendTime, draftAutoSendTime);
      expect(chatHit.sentDate, sentDate);
      expect(chatHit.resentDate, resentDate);
      expect(chatHit.part, part);
      expect(chatHit.fragment, fragment);
      expect(chatHit.subject, subject);
      expect(chatHit.messageIdHeader, messageIdHeader);
      expect(chatHit.inReplyTo, inReplyTo);
      expect(chatHit.size, size);
      expect(chatHit.date, date);
      expect(chatHit.folder, folder);
      expect(chatHit.conversationId, conversationId.toString());
      expect(chatHit.flags, flags);
      expect(chatHit.tags, tags);
      expect(chatHit.tagNames, tagNames);
      expect(chatHit.revision, revision);
      expect(chatHit.changeDate, changeDate);
      expect(chatHit.modifiedSequence, modifiedSequence);

      final mpHit = response.messagePartHits.first;
      expect(mpHit.id, id);
      expect(mpHit.sortField, sortField);
      expect(mpHit.size, size);
      expect(mpHit.date, date);
      expect(mpHit.conversationId, conversationId);
      expect(mpHit.messageId, messageId);
      expect(mpHit.contentType, contentType);
      expect(mpHit.contentName, contentName);
      expect(mpHit.part, part);
      expect(mpHit.subject, subject);

      final mpHitEmail = mpHit.email!;
      expect(mpHitEmail.address, address);
      expect(mpHitEmail.display, display);
      expect(mpHitEmail.personal, personal);
      expect(mpHitEmail.addressType, addressType);
      expect(mpHitEmail.isGroup, isGroup);
      expect(mpHitEmail.canExpandGroupMembers, canExpandGroupMembers);

      final contactHit = response.contactHits.first;
      expect(contactHit.sortField, sortField);
      expect(contactHit.canExpand, canExpand);
      expect(contactHit.id, id);
      expect(contactHit.imapUid, imapUid);
      expect(contactHit.folder, folder);
      expect(contactHit.flags, flags);
      expect(contactHit.tags, tags);
      expect(contactHit.tagNames, tagNames);
      expect(contactHit.changeDate, changeDate);
      expect(contactHit.modifiedSequenceId, modifiedSequenceId);
      expect(contactHit.date, date);
      expect(contactHit.revisionId, revisionId);
      expect(contactHit.fileAs, fileAs);
      expect(contactHit.email, email);
      expect(contactHit.email2, email2);
      expect(contactHit.email3, email3);
      expect(contactHit.type, type);
      expect(contactHit.dlist, dlist);
      expect(contactHit.reference, reference);
      expect(contactHit.tooManyMembers, tooManyMembers);
      expect(contactHit.memberOf, memberOf);
      final contactMeta = contactHit.metadatas.first;
      expect(contactMeta.section, section);
      expect(contactMeta.keyValuePairs.first.key, key);
      expect(contactMeta.keyValuePairs.first.value, value);

      final contactAttr = contactHit.attrs.first;
      expect(contactAttr.key, key);
      expect(contactAttr.value, value);
      expect(contactAttr.part, part);
      expect(contactAttr.contentType, contentType);
      expect(contactAttr.size, size);
      expect(contactAttr.contentFilename, contentFilename);

      final contactMember = contactHit.contactGroupMembers.first;
      expect(contactMember.type, MemberType.contact);
      expect(contactMember.value, value);

      final cnMember = contactMember.contact!;
      expect(cnMember.sortField, sortField);
      expect(cnMember.canExpand, canExpand);
      expect(cnMember.id, id);
      expect(cnMember.imapUid, imapUid);
      expect(cnMember.folder, folder);
      expect(cnMember.flags, flags);
      expect(cnMember.tags, tags);
      expect(cnMember.tagNames, tagNames);
      expect(cnMember.changeDate, changeDate);
      expect(cnMember.modifiedSequenceId, modifiedSequenceId);
      expect(cnMember.date, date);
      expect(cnMember.revisionId, revisionId);
      expect(cnMember.fileAs, fileAs);
      expect(cnMember.email, email);
      expect(cnMember.email2, email2);
      expect(cnMember.email3, email3);
      expect(cnMember.type, type);
      expect(cnMember.dlist, dlist);
      expect(cnMember.reference, reference);
      expect(cnMember.tooManyMembers, tooManyMembers);
      expect(cnMember.memberOf, memberOf);

      final noteHit = response.noteHits.first;
      expect(noteHit.sortField, sortField);
      expect(noteHit.id, id);
      expect(noteHit.revision, revision);
      expect(noteHit.folder, folder);
      expect(noteHit.date, date);
      expect(noteHit.flags, flags);
      expect(noteHit.tags, tags);
      expect(noteHit.tagNames, tagNames);
      expect(noteHit.bounds, bounds);
      expect(noteHit.color, color);
      expect(noteHit.rgb, rgb);
      expect(noteHit.changeDate, changeDate);
      expect(noteHit.modifiedSequence, modifiedSequence);
      expect(noteHit.content, content);

      final noteHitMeta = noteHit.metadatas.first;
      expect(noteHitMeta.section, section);
      expect(noteHitMeta.keyValuePairs.first.key, key);
      expect(noteHitMeta.keyValuePairs.first.value, value);

      final docHit = response.documentHits.first;
      expect(docHit.sortField, sortField);
      expect(docHit.lockOwnerId, lockOwnerId);
      expect(docHit.lockOwnerEmail, lockOwnerEmail);
      expect(docHit.lockOwnerTimestamp, lockOwnerTimestamp);
      expect(docHit.id, id);
      expect(docHit.uuid, uuid);
      expect(docHit.name, name);
      expect(docHit.size, size);
      expect(docHit.date, date);
      expect(docHit.folderId, folderId);
      expect(docHit.folderUuid, folderUuid);
      expect(docHit.modifiedSequence, modifiedSequence);
      expect(docHit.metadataVersion, metadataVersion);
      expect(docHit.changeDate, changeDate);
      expect(docHit.revision, revision);
      expect(docHit.flags, flags);
      expect(docHit.tags, tags);
      expect(docHit.tagNames, tagNames);
      expect(docHit.description, description);
      expect(docHit.contentType, contentType);
      expect(docHit.descEnabled, descEnabled);
      expect(docHit.version, version);
      expect(docHit.lastEditedBy, lastEditedBy);
      expect(docHit.creator, creator);
      expect(docHit.createdDate, createdDate);
      expect(docHit.fragment, fragment);

      final docHitMeta = docHit.metadatas.first;
      expect(docHitMeta.section, section);
      expect(docHitMeta.keyValuePairs.first.key, key);
      expect(docHitMeta.keyValuePairs.first.value, value);

      final docHitAcl = docHit.acl!;
      expect(docHitAcl.internalGrantExpiry, internalGrantExpiry);
      expect(docHitAcl.guestGrantExpiry, guestGrantExpiry);

      final docHitGrant = docHitAcl.grants.first;
      expect(docHitGrant.perm, perm);
      expect(docHitGrant.granteeType, GrantGranteeType.all);
      expect(docHitGrant.granteeId, granteeId);
      expect(docHitGrant.expiry, expiry);
      expect(docHitGrant.granteeName, granteeName);
      expect(docHitGrant.guestPassword, guestPassword);
      expect(docHitGrant.accessKey, accessKey);

      final wikiHit = response.wikiHits.first;
      expect(wikiHit.sortField, sortField);
      expect(wikiHit.id, id);
      expect(wikiHit.uuid, uuid);
      expect(wikiHit.name, name);
      expect(wikiHit.size, size);
      expect(wikiHit.date, date);
      expect(wikiHit.folderId, folderId);
      expect(wikiHit.folderUuid, folderUuid);
      expect(wikiHit.modifiedSequence, modifiedSequence);
      expect(wikiHit.metadataVersion, metadataVersion);
      expect(wikiHit.changeDate, changeDate);
      expect(wikiHit.revision, revision);
      expect(wikiHit.flags, flags);
      expect(wikiHit.tags, tags);
      expect(wikiHit.tagNames, tagNames);
      expect(wikiHit.description, description);
      expect(wikiHit.contentType, contentType);
      expect(wikiHit.descEnabled, descEnabled);
      expect(wikiHit.version, version);
      expect(wikiHit.lastEditedBy, lastEditedBy);
      expect(wikiHit.creator, creator);
      expect(wikiHit.createdDate, createdDate);
      expect(wikiHit.fragment, fragment);

      final wikiHitMeta = wikiHit.metadatas.first;
      expect(wikiHitMeta.section, section);
      expect(wikiHitMeta.keyValuePairs.first.key, key);
      expect(wikiHitMeta.keyValuePairs.first.value, value);

      final wikiHitAcl = wikiHit.acl!;
      expect(wikiHitAcl.internalGrantExpiry, internalGrantExpiry);
      expect(wikiHitAcl.guestGrantExpiry, guestGrantExpiry);

      final wikiHitGrant = wikiHitAcl.grants.first;
      expect(wikiHitGrant.perm, perm);
      expect(wikiHitGrant.granteeType, GrantGranteeType.all);
      expect(wikiHitGrant.granteeId, granteeId);
      expect(wikiHitGrant.expiry, expiry);
      expect(wikiHitGrant.granteeName, granteeName);
      expect(wikiHitGrant.guestPassword, guestPassword);
      expect(wikiHitGrant.accessKey, accessKey);

      final apptHit = response.appointmentHits.first;
      expect(apptHit.sortField, sortField);
      expect(apptHit.date, date);
      expect(apptHit.contentMatched, contentMatched);
      expect(apptHit.nextAlarm, nextAlarm);
      expect(apptHit.fragment, fragment);
      expect(apptHit.xUid, xUid);
      expect(apptHit.uid, uid);
      expect(apptHit.flags, flags);
      expect(apptHit.tags, tags);
      expect(apptHit.tagNames, tagNames);
      expect(apptHit.folderId, folderId);
      expect(apptHit.size, size);
      expect(apptHit.changeDate, changeDate);
      expect(apptHit.modifiedSequence, modifiedSequence);
      expect(apptHit.revision, revision);
      expect(apptHit.id, id);
      expect(apptHit.duration, duration);
      expect(apptHit.partStat, partStat);
      expect(apptHit.recurIdZ, recurIdZ);
      expect(apptHit.tzOffset, tzOffset);
      expect(apptHit.freeBusyActual, FreeBusyStatus.free);
      expect(apptHit.taskPercentComplete, taskPercentComplete);
      expect(apptHit.isRecurring, isRecurring);
      expect(apptHit.hasExceptions, hasExceptions);
      expect(apptHit.priority, priority);
      expect(apptHit.freeBusyIntended, FreeBusyStatus.free);
      expect(apptHit.transparency, Transparency.opaque);
      expect(apptHit.name, name);
      expect(apptHit.location, location);
      expect(apptHit.hasOtherAttendees, hasOtherAttendees);
      expect(apptHit.hasAlarm, hasAlarm);
      expect(apptHit.isOrganizer, isOrganizer);
      expect(apptHit.invId, invId.toString());
      expect(apptHit.componentNum, componentNum);
      expect(apptHit.status, InviteStatus.completed);
      expect(apptHit.calClass, InviteClass.public);
      expect(apptHit.allDay, allDay);
      expect(apptHit.draft, draft);
      expect(apptHit.neverSent, neverSent);
      expect(apptHit.taskDueDate, taskDueDate);
      expect(apptHit.taskTzOffsetDue, taskTzOffsetDue);
      expect(apptHit.categories.first, category);

      final apptHitOrganizer = apptHit.organizer!;
      expect(apptHitOrganizer.address, address);
      expect(apptHitOrganizer.url, url);
      expect(apptHitOrganizer.displayName, displayName);
      expect(apptHitOrganizer.sentBy, sentBy);
      expect(apptHitOrganizer.dir, dir);
      expect(apptHitOrganizer.language, language);
      expect(apptHitOrganizer.xParams.first.name, name);
      expect(apptHitOrganizer.xParams.first.value, value);

      final apptHitGeo = apptHit.geo!;
      expect(apptHitGeo.latitude, latitude);
      expect(apptHitGeo.longitude, longitude);

      final apptHitInst = apptHit.instances.first;
      expect(apptHitInst.startTime, startTime);
      expect(apptHitInst.isException, isException);
      expect(apptHitInst.fragment, fragment);
      expect(apptHitInst.duration, duration);
      expect(apptHitInst.partStat, partStat);
      expect(apptHitInst.recurIdZ, recurIdZ);
      expect(apptHitInst.tzOffset, tzOffset);
      expect(apptHitInst.freeBusyActual, FreeBusyStatus.free);
      expect(apptHitInst.taskPercentComplete, taskPercentComplete);
      expect(apptHitInst.isRecurring, isRecurring);
      expect(apptHitInst.hasExceptions, hasExceptions);
      expect(apptHitInst.priority, priority);
      expect(apptHitInst.freeBusyIntended, FreeBusyStatus.free);
      expect(apptHitInst.transparency, Transparency.opaque);
      expect(apptHitInst.name, name);
      expect(apptHitInst.location, location);
      expect(apptHitInst.hasOtherAttendees, hasOtherAttendees);
      expect(apptHitInst.hasAlarm, hasAlarm);
      expect(apptHitInst.isOrganizer, isOrganizer);
      expect(apptHitInst.invId, invId.toString());
      expect(apptHitInst.componentNum, componentNum);
      expect(apptHitInst.status, InviteStatus.completed);
      expect(apptHitInst.calClass, InviteClass.public);
      expect(apptHitInst.allDay, allDay);
      expect(apptHitInst.draft, draft);
      expect(apptHitInst.neverSent, neverSent);
      expect(apptHitInst.taskDueDate, taskDueDate);
      expect(apptHitInst.taskTzOffsetDue, taskTzOffsetDue);
      expect(apptHitInst.categories.first, category);

      final apptHitInstOrganizer = apptHitInst.organizer!;
      expect(apptHitInstOrganizer.address, address);
      expect(apptHitInstOrganizer.url, url);
      expect(apptHitInstOrganizer.displayName, displayName);
      expect(apptHitInstOrganizer.sentBy, sentBy);
      expect(apptHitInstOrganizer.dir, dir);
      expect(apptHitInstOrganizer.language, language);
      expect(apptHitInstOrganizer.xParams.first.name, name);
      expect(apptHitInstOrganizer.xParams.first.value, value);

      final apptHitInstEeo = apptHitInst.geo!;
      expect(apptHitInstEeo.latitude, latitude);
      expect(apptHitInstEeo.longitude, longitude);

      final apptHitAlarmData = apptHit.alarmData!;
      expect(apptHitAlarmData.nextAlarm, nextAlarm);
      expect(apptHitAlarmData.alarmInstanceStart, alarmInstanceStart);
      expect(apptHitAlarmData.invId, invId);
      expect(apptHitAlarmData.componentNum, componentNum);
      expect(apptHitAlarmData.name, name);
      expect(apptHitAlarmData.location, location);

      final apptHitAlarm = apptHitAlarmData.alarm!;
      expect(apptHitAlarm.action, AlarmAction.display);
      expect(apptHitAlarm.description, description);
      expect(apptHitAlarm.summary, summary);
      expect(apptHitAlarm.attach!.uri, uri);
      expect(apptHitAlarm.attach!.contentType, contentType);
      expect(apptHitAlarm.attach!.binaryB64Data, binaryB64Data);

      final apptHitAlarmAt = apptHitAlarm.attendees.first;
      expect(apptHitAlarmAt.address, address);
      expect(apptHitAlarmAt.url, url);
      expect(apptHitAlarmAt.displayName, displayName);
      expect(apptHitAlarmAt.sentBy, sentBy);
      expect(apptHitAlarmAt.dir, dir);
      expect(apptHitAlarmAt.language, language);
      expect(apptHitAlarmAt.cuType, cuType);
      expect(apptHitAlarmAt.role, role);
      expect(apptHitAlarmAt.partStat, partStat);
      expect(apptHitAlarmAt.rsvp, rsvp);
      expect(apptHitAlarmAt.member, member);
      expect(apptHitAlarmAt.delegatedTo, delegatedTo);
      expect(apptHitAlarmAt.delegatedFrom, delegatedFrom);
      expect(apptHitAlarmAt.xParams.first.name, name);
      expect(apptHitAlarmAt.xParams.first.value, value);

      final apptHitAlarmXProp = apptHitAlarm.xProps.first;
      expect(apptHitAlarmXProp.name, name);
      expect(apptHitAlarmXProp.value, value);
      expect(apptHitAlarmXProp.xParams.first.name, name);
      expect(apptHitAlarmXProp.xParams.first.value, value);

      final apptHitInvite = apptHit.invites.first;
      expect(apptHitInvite.calItemType, calItemType);
      expect(apptHitInvite.sequence, sequence);
      expect(apptHitInvite.id, id);
      expect(apptHitInvite.componentNum, componentNum);
      expect(apptHitInvite.recurrenceId, recurrenceId);

      final apptHitInviteTz = apptHitInvite.timezones.first;
      expect(apptHitInviteTz.id, id);
      expect(apptHitInviteTz.tzStdOffset, tzStdOffset);
      expect(apptHitInviteTz.tzDayOffset, tzDayOffset);
      expect(apptHitInviteTz.standardTZName, standardTZName);
      expect(apptHitInviteTz.daylightTZName, daylightTZName);

      final apptHitInviteTzStandard = apptHitInviteTz.standardTzOnset!;
      expect(apptHitInviteTzStandard.month, month);
      expect(apptHitInviteTzStandard.hour, hour);
      expect(apptHitInviteTzStandard.minute, minute);
      expect(apptHitInviteTzStandard.second, second);
      expect(apptHitInviteTzStandard.dayOfMonth, dayOfMonth);
      expect(apptHitInviteTzStandard.week, week);
      expect(apptHitInviteTzStandard.dayOfWeek, dayOfWeek);

      final apptHitInviteTzDaylight = apptHitInviteTz.daylightTzOnset!;
      expect(apptHitInviteTzDaylight.month, month);
      expect(apptHitInviteTzDaylight.hour, hour);
      expect(apptHitInviteTzDaylight.minute, minute);
      expect(apptHitInviteTzDaylight.second, second);
      expect(apptHitInviteTzDaylight.dayOfMonth, dayOfMonth);
      expect(apptHitInviteTzDaylight.week, week);
      expect(apptHitInviteTzDaylight.dayOfWeek, dayOfWeek);

      final apptHitComp = apptHitInvite.inviteComponent!;
      expect(apptHitComp.method, method);
      expect(apptHitComp.componentNum, componentNum);
      expect(apptHitComp.rsvp, rsvp);
      expect(apptHitComp.priority, priority);
      expect(apptHitComp.name, name);
      expect(apptHitComp.location, location);
      expect(apptHitComp.percentComplete, percentComplete);
      expect(apptHitComp.completed, completed);
      expect(apptHitComp.noBlob, noBlob);
      expect(apptHitComp.freeBusyActual, FreeBusyStatus.free);
      expect(apptHitComp.freeBusy, FreeBusyStatus.free);
      expect(apptHitComp.transparency, Transparency.opaque);
      expect(apptHitComp.isOrganizer, isOrganizer);
      expect(apptHitComp.xUid, xUid);
      expect(apptHitComp.uid, uid);
      expect(apptHitComp.sequence, sequence);
      expect(apptHitComp.dateTime, dateTime);
      expect(apptHitComp.calItemId, calItemId);
      expect(apptHitComp.deprecatedApptId, deprecatedApptId);
      expect(apptHitComp.calItemFolder, calItemFolder);
      expect(apptHitComp.status, InviteStatus.completed);
      expect(apptHitComp.calClass, InviteClass.public);
      expect(apptHitComp.url, url);
      expect(apptHitComp.isException, isException);
      expect(apptHitComp.recurIdZ, recurIdZ);
      expect(apptHitComp.isAllDay, isAllDay);
      expect(apptHitComp.isDraft, isDraft);
      expect(apptHitComp.neverSent, neverSent);
      expect(apptHitComp.changes, changes);
      expect(apptHitComp.fragment, fragment);
      expect(apptHitComp.description, description);
      expect(apptHitComp.htmlDescription, htmlDescription);
      expect(apptHitComp.categories.first, category);
      expect(apptHitComp.comments.first, comment);
      expect(apptHitComp.contacts.first, contact);

      final apptHitCompGeo = apptHitComp.geo!;
      expect(apptHitCompGeo.latitude, latitude);
      expect(apptHitCompGeo.longitude, longitude);

      final apptHitCompAt = apptHitComp.attendees.first;
      expect(apptHitCompAt.address, address);
      expect(apptHitCompAt.url, url);
      expect(apptHitCompAt.displayName, displayName);
      expect(apptHitCompAt.sentBy, sentBy);
      expect(apptHitCompAt.dir, dir);
      expect(apptHitCompAt.language, language);
      expect(apptHitCompAt.cuType, cuType);
      expect(apptHitCompAt.role, role);
      expect(apptHitCompAt.partStat, partStat);
      expect(apptHitCompAt.rsvp, rsvp);
      expect(apptHitCompAt.member, member);
      expect(apptHitCompAt.delegatedTo, delegatedTo);
      expect(apptHitCompAt.delegatedFrom, delegatedFrom);
      expect(apptHitCompAt.xParams.first.name, name);
      expect(apptHitCompAt.xParams.first.value, value);

      final apptHitCompAlarm = apptHitComp.alarms.first;
      expect(apptHitCompAlarm.action, AlarmAction.display);
      expect(apptHitCompAlarm.description, description);
      expect(apptHitCompAlarm.summary, summary);
      expect(apptHitCompAlarm.attach!.uri, uri);
      expect(apptHitCompAlarm.attach!.contentType, contentType);
      expect(apptHitCompAlarm.attach!.binaryB64Data, binaryB64Data);

      final apptHitCompAlarmAt = apptHitCompAlarm.attendees.first;
      expect(apptHitCompAlarmAt.address, address);
      expect(apptHitCompAlarmAt.url, url);
      expect(apptHitCompAlarmAt.displayName, displayName);
      expect(apptHitCompAlarmAt.sentBy, sentBy);
      expect(apptHitCompAlarmAt.dir, dir);
      expect(apptHitCompAlarmAt.language, language);
      expect(apptHitCompAlarmAt.cuType, cuType);
      expect(apptHitCompAlarmAt.role, role);
      expect(apptHitCompAlarmAt.partStat, partStat);
      expect(apptHitCompAlarmAt.rsvp, rsvp);
      expect(apptHitCompAlarmAt.member, member);
      expect(apptHitCompAlarmAt.delegatedTo, delegatedTo);
      expect(apptHitCompAlarmAt.delegatedFrom, delegatedFrom);
      expect(apptHitCompAlarmAt.xParams.first.name, name);
      expect(apptHitCompAlarmAt.xParams.first.value, value);

      final apptHitCompAlarmXProp = apptHitCompAlarm.xProps.first;
      expect(apptHitCompAlarmXProp.name, name);
      expect(apptHitCompAlarmXProp.value, value);
      expect(apptHitCompAlarmXProp.xParams.first.name, name);
      expect(apptHitCompAlarmXProp.xParams.first.value, value);

      final apptHitCompXProp = apptHitComp.xProps.first;
      expect(apptHitCompXProp.name, name);
      expect(apptHitCompXProp.value, value);
      expect(apptHitCompXProp.xParams.first.name, name);
      expect(apptHitCompXProp.xParams.first.value, value);

      final apptHitCompOrganizer = apptHitComp.organizer!;
      expect(apptHitCompOrganizer.address, address);
      expect(apptHitCompOrganizer.url, url);
      expect(apptHitCompOrganizer.displayName, displayName);
      expect(apptHitCompOrganizer.sentBy, sentBy);
      expect(apptHitCompOrganizer.dir, dir);
      expect(apptHitCompOrganizer.language, language);
      expect(apptHitCompOrganizer.xParams.first.name, name);
      expect(apptHitCompOrganizer.xParams.first.value, value);

      final apptHitRecurrence = apptHitComp.recurrence!;
      expect(apptHitRecurrence.add.first, isA<AddRecurrenceInfo>());
      expect(apptHitRecurrence.exclude.first, isA<ExcludeRecurrenceInfo>());

      final apptHitExcept = apptHitRecurrence.except.first;
      expect(apptHitExcept.recurrenceRangeType, recurrenceRangeType);
      expect(apptHitExcept.recurrenceId, recurrenceId);
      expect(apptHitExcept.timezone, timezone);
      expect(apptHitExcept.recurIdZ, recurIdZ);
      expect(apptHitExcept.add, isA<RecurrenceInfo>());
      expect(apptHitExcept.exclude, isA<RecurrenceInfo>());

      final apptHitCancel = apptHitRecurrence.cancel.first;
      expect(apptHitCancel.recurrenceRangeType, recurrenceRangeType);
      expect(apptHitCancel.recurrenceId, recurrenceId);
      expect(apptHitCancel.timezone, timezone);
      expect(apptHitCancel.recurIdZ, recurIdZ);

      final apptHitDates = apptHitRecurrence.dates.first;
      expect(apptHitDates.timezone, timezone);

      final apptHitStartTime = apptHitDates.dtVals.first.startTime!;
      expect(apptHitStartTime.dateTime, dateTimeString);
      expect(apptHitStartTime.timezone, timezone);
      expect(apptHitStartTime.utcTime, utcTime);

      final apptHitEndTime = apptHitDates.dtVals.first.endTime!;
      expect(apptHitEndTime.dateTime, dateTimeString);
      expect(apptHitEndTime.timezone, timezone);
      expect(apptHitEndTime.utcTime, utcTime);

      final apptHitDuration = apptHitDates.dtVals.first.duration!;
      expect(apptHitDuration.durationNegative, durationNegative);
      expect(apptHitDuration.weeks, weeks);
      expect(apptHitDuration.days, days);
      expect(apptHitDuration.hours, hours);
      expect(apptHitDuration.minutes, minutes);
      expect(apptHitDuration.seconds, seconds);
      expect(apptHitDuration.related, AlarmRelated.start);
      expect(apptHitDuration.repeatCount, repeatCount);

      final apptHitSimple = apptHitRecurrence.simple.first;
      expect(apptHitSimple.until!.dateTime, dateTimeString);
      expect(apptHitSimple.count!.num, num);
      expect(apptHitSimple.interval!.ival, ival);
      expect(apptHitSimple.bySecond!.list, list);
      expect(apptHitSimple.byMinute!.list, list);
      expect(apptHitSimple.byHour!.list, list);
      expect(apptHitSimple.byDay!.days.first.day, WeekDay.sunday);
      expect(apptHitSimple.byDay!.days.first.ordWk, ordWk);
      expect(apptHitSimple.byMonthDay!.list, list);
      expect(apptHitSimple.byYearDay!.list, list);
      expect(apptHitSimple.byWeekNo!.list, list);
      expect(apptHitSimple.byMonth!.list, list);
      expect(apptHitSimple.bySetPose!.list, list);
      expect(apptHitSimple.weekStart!.day, WeekDay.sunday);
      expect(apptHitSimple.xNames.first.name, name);
      expect(apptHitSimple.xNames.first.value, value);

      final apptHitExceptionId = apptHitComp.exceptionId!;
      expect(apptHitExceptionId.dateTime, dateTimeString);
      expect(apptHitExceptionId.timezone, timezone);
      expect(apptHitExceptionId.recurrenceRangeType, recurrenceRangeType);

      final apptHitDtStart = apptHitComp.dtStart!;
      expect(apptHitDtStart.dateTime, dateTimeString);
      expect(apptHitDtStart.timezone, timezone);
      expect(apptHitDtStart.utcTime, utcTime);

      final apptHitDtEnd = apptHitComp.dtEnd!;
      expect(apptHitDtEnd.dateTime, dateTimeString);
      expect(apptHitDtEnd.timezone, timezone);
      expect(apptHitDtEnd.utcTime, utcTime);

      final apptHitInviteDuration = apptHitComp.duration!;
      expect(apptHitInviteDuration.durationNegative, durationNegative);
      expect(apptHitInviteDuration.weeks, weeks);
      expect(apptHitInviteDuration.days, days);
      expect(apptHitInviteDuration.hours, hours);
      expect(apptHitInviteDuration.minutes, minutes);
      expect(apptHitInviteDuration.seconds, seconds);
      expect(apptHitInviteDuration.related, AlarmRelated.start);
      expect(apptHitInviteDuration.repeatCount, repeatCount);

      final apptHitInviteMp = apptHitInvite.partInfos.first;
      expect(apptHitInviteMp.part, part);
      expect(apptHitInviteMp.contentType, contentType);
      expect(apptHitInviteMp.size, size);
      expect(apptHitInviteMp.contentDisposition, contentDisposition);
      expect(apptHitInviteMp.contentFilename, contentFilename);
      expect(apptHitInviteMp.contentId, contentId);
      expect(apptHitInviteMp.location, location);
      expect(apptHitInviteMp.body, body);
      expect(apptHitInviteMp.truncatedContent, truncatedContent);
      expect(apptHitInviteMp.content, content);

      final apptHitInviteMpMimePart = apptHitInviteMp.mimeParts.first;
      expect(apptHitInviteMpMimePart.part, part);
      expect(apptHitInviteMpMimePart.contentType, contentType);
      expect(apptHitInviteMpMimePart.size, size);
      expect(apptHitInviteMpMimePart.contentDisposition, contentDisposition);
      expect(apptHitInviteMpMimePart.contentFilename, contentFilename);
      expect(apptHitInviteMpMimePart.contentId, contentId);
      expect(apptHitInviteMpMimePart.location, location);
      expect(apptHitInviteMpMimePart.body, body);
      expect(apptHitInviteMpMimePart.truncatedContent, truncatedContent);
      expect(apptHitInviteMpMimePart.content, content);

      final apptHitInviteShr = apptHitInvite.shareNotifications.first;
      expect(apptHitInviteShr.content, content);
      expect(apptHitInviteShr.truncatedContent, truncatedContent);

      final apptHitInviteDlSubs = apptHitInvite.dlSubsNotifications.first;
      expect(apptHitInviteDlSubs.content, content);
      expect(apptHitInviteDlSubs.truncatedContent, truncatedContent);

      final apptHitReply = apptHit.replies.first;
      expect(apptHitReply.recurrenceRangeType, recurrenceRangeType);
      expect(apptHitReply.recurrenceId, recurrenceId);
      expect(apptHitReply.sequence, sequence);
      expect(apptHitReply.date, date);
      expect(apptHitReply.attendee, attendee);
      expect(apptHitReply.sentBy, sentBy);
      expect(apptHitReply.partStat, partStat);
      expect(apptHitReply.timezone, timezone);
      expect(apptHitReply.recurIdZ, recurIdZ);

      final taskHit = response.taskHits.first;
      expect(taskHit, isA<CalendarItemHitInfo>());
      expect(taskHit.sortField, sortField);
      expect(taskHit.date, date);
      expect(taskHit.contentMatched, contentMatched);
      expect(taskHit.nextAlarm, nextAlarm);
      expect(taskHit.fragment, fragment);
      expect(taskHit.xUid, xUid);
      expect(taskHit.uid, uid);
      expect(taskHit.flags, flags);
      expect(taskHit.tags, tags);
      expect(taskHit.tagNames, tagNames);
      expect(taskHit.folderId, folderId);
      expect(taskHit.size, size);
      expect(taskHit.changeDate, changeDate);
      expect(taskHit.modifiedSequence, modifiedSequence);
      expect(taskHit.revision, revision);
      expect(taskHit.id, id);
      expect(taskHit.duration, duration);
      expect(taskHit.partStat, partStat);
      expect(taskHit.recurIdZ, recurIdZ);
      expect(taskHit.tzOffset, tzOffset);
      expect(taskHit.freeBusyActual, FreeBusyStatus.free);
      expect(taskHit.taskPercentComplete, taskPercentComplete);
      expect(taskHit.isRecurring, isRecurring);
      expect(taskHit.hasExceptions, hasExceptions);
      expect(taskHit.priority, priority);
      expect(taskHit.freeBusyIntended, FreeBusyStatus.free);
      expect(taskHit.transparency, Transparency.opaque);
      expect(taskHit.name, name);
      expect(taskHit.location, location);
      expect(taskHit.hasOtherAttendees, hasOtherAttendees);
      expect(taskHit.hasAlarm, hasAlarm);
      expect(taskHit.isOrganizer, isOrganizer);
      expect(taskHit.invId, invId.toString());
      expect(taskHit.componentNum, componentNum);
      expect(taskHit.status, InviteStatus.completed);
      expect(taskHit.calClass, InviteClass.public);
      expect(taskHit.allDay, allDay);
      expect(taskHit.draft, draft);
      expect(taskHit.neverSent, neverSent);
      expect(taskHit.taskDueDate, taskDueDate);
      expect(taskHit.taskTzOffsetDue, taskTzOffsetDue);

      final queryInfo = response.queryInfo!;
      expect(queryInfo.suggests.first.suggestedQueryString, suggestedQueryString);
      expect(queryInfo.wildcards.first.wildcardString, wildcardString);
      expect(queryInfo.wildcards.first.expanded, expanded);
      expect(queryInfo.wildcards.first.numExpanded, numExpanded);
    }));
  }));
}
