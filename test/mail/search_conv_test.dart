import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/address_type.dart';
import 'package:zimbra_api/src/common/enum/alarm_action.dart';
import 'package:zimbra_api/src/common/enum/alarm_related.dart';
import 'package:zimbra_api/src/common/enum/free_busy_status.dart';
import 'package:zimbra_api/src/common/enum/frequency.dart';
import 'package:zimbra_api/src/common/enum/invite_class.dart';
import 'package:zimbra_api/src/common/enum/invite_status.dart';
import 'package:zimbra_api/src/common/enum/invite_type.dart';
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
import 'package:zimbra_api/src/mail/message/search_conv_envelope.dart';
import 'package:zimbra_api/src/mail/message/search_conv_request.dart';
import 'package:zimbra_api/src/mail/message/search_conv_response.dart';
import 'package:zimbra_api/src/mail/type/add_recurrence_info.dart';
import 'package:zimbra_api/src/mail/type/cal_tz_info.dart';
import 'package:zimbra_api/src/mail/type/exclude_recurrence_info.dart';
import 'package:zimbra_api/src/mail/type/recurrence_info.dart';

void main() {
  final faker = Faker();

  group('Search conversation tests', (() {
    test('Search conversation request', (() {
      final id = faker.guid.guid();
      final name = faker.lorem.word();

      final conversationId = faker.guid.guid();
      final nestMessages = faker.randomGenerator.boolean();
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

      final request = SearchConvRequest(
        conversationId,
        nestMessages: nestMessages,
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
          'SearchConvRequest': {
            '_jsns': 'urn:zimbraMail',
            'cid': conversationId,
            'nest': nestMessages,
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
          }
        },
      });
    }));

    test('Search conversation response', (() {
      final id = faker.guid.guid();
      final uid = faker.guid.guid();
      final name = faker.lorem.word();
      final key = faker.lorem.word();
      final value = faker.lorem.word();

      final sortBy = faker.randomGenerator.element(SearchSortBy.values);
      final queryOffset = faker.randomGenerator.integer(100);
      final queryMore = faker.randomGenerator.boolean();

      final num = faker.randomGenerator.integer(100);
      final totalSize = faker.randomGenerator.integer(100);
      final flags = faker.lorem.word();
      final tags = faker.lorem.word();
      final tagNames = faker.lorem.word();

      final sortField = faker.lorem.word();
      final contentMatched = faker.randomGenerator.boolean();
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
      final fragment = faker.lorem.word();
      final subject = faker.lorem.word();
      final messageIdHeader = faker.guid.guid();
      final size = faker.randomGenerator.integer(100);
      final date = faker.date.dateTime().millisecondsSinceEpoch;
      final folder = faker.guid.guid();
      final conversationId = faker.guid.guid();
      final revision = faker.randomGenerator.integer(100);
      final changeDate = faker.date.dateTime().millisecondsSinceEpoch;
      final modifiedSequence = faker.randomGenerator.integer(100);

      final address = faker.internet.email();
      final display = faker.person.name();
      final personal = faker.lorem.word();
      final addressType = faker.randomGenerator.element(AddressType.values);
      final isGroup = faker.randomGenerator.boolean();
      final canExpandGroupMembers = faker.randomGenerator.boolean();
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
      final summary = faker.guid.guid();
      final description = faker.lorem.word();
      final htmlDescription = faker.lorem.word();
      final binaryB64Data = faker.lorem.word();

      final ival = faker.randomGenerator.integer(100);
      final list = faker.randomGenerator.amount((_) => random.integer(10), 10).join(',');
      final ordWk = faker.randomGenerator.integer(100);
      final section = faker.lorem.word();

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
      final isException = faker.randomGenerator.boolean();
      final isAllDay = faker.randomGenerator.boolean();
      final isDraft = faker.randomGenerator.boolean();
      final neverSent = faker.randomGenerator.boolean();
      final changes = faker.lorem.words(3).join(',');

      final contentDisposition = faker.lorem.word();
      final contentFilename = faker.lorem.word();
      final contentId = faker.guid.guid();
      final body = faker.randomGenerator.boolean();
      final truncatedContent = faker.randomGenerator.boolean();

      final suggestedQueryString = faker.lorem.word();
      final wildcardString = faker.lorem.word();
      final expanded = faker.randomGenerator.boolean();
      final numExpanded = faker.randomGenerator.integer(100);

      final data = {
        'Body': {
          'SearchConvResponse': {
            '_jsns': 'urn:zimbraMail',
            'sortBy': sortBy.name,
            'offset': queryOffset,
            'more': queryMore,
            'c': {
              'id': id,
              'n': num,
              'total': totalSize,
              'f': flags,
              't': tags,
              'tn': tagNames,
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
                  'fr': fragment,
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
                  'su': subject,
                  'mid': messageIdHeader,
                  'irt': inReplyTo,
                  's': size,
                  'd': date,
                  'l': folder,
                  'cid': conversationId,
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
                              'value': value,
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
                                  'value': value,
                                }
                              ],
                            }
                          ],
                          'xprop': [
                            {
                              'name': name,
                              'value': value,
                              'xparam': [
                                {
                                  'name': name,
                                  'value': value,
                                }
                              ],
                            }
                          ],
                        }
                      ],
                      'xprop': [
                        {
                          'name': name,
                          'value': value,
                          'xparam': [
                            {
                              'name': name,
                              'value': value,
                            }
                          ],
                        }
                      ],
                      'fr': fragment,
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
                            'value': value,
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
                  '_attrs': {
                    key: value,
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
                      'content': content,
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
                          'content': content,
                        }
                      ],
                    }
                  ],
                  'shr': [
                    {
                      'truncated': truncatedContent,
                      'content': content,
                    }
                  ],
                  'dlSubs': [
                    {
                      'truncated': truncatedContent,
                      'content': content,
                    }
                  ],
                  'meta': [
                    {
                      'section': section,
                      '_attrs': {
                        key: value,
                      },
                    }
                  ],
                }
              ],
              'info': [
                {
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
              ],
            },
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
                'fr': fragment,
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
                'su': subject,
                'mid': messageIdHeader,
                'irt': inReplyTo,
                's': size,
                'd': date,
                'l': folder,
                'cid': conversationId,
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
                            'value': value,
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
                                'value': value,
                              }
                            ],
                          }
                        ],
                        'xprop': [
                          {
                            'name': name,
                            'value': value,
                            'xparam': [
                              {
                                'name': name,
                                'value': value,
                              }
                            ],
                          }
                        ],
                      }
                    ],
                    'xprop': [
                      {
                        'name': name,
                        'value': value,
                        'xparam': [
                          {
                            'name': name,
                            'value': value,
                          }
                        ],
                      }
                    ],
                    'fr': fragment,
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
                          'value': value,
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
                '_attrs': {
                  key: value,
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
                    'content': content,
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
                        'content': content,
                      }
                    ],
                  }
                ],
                'shr': [
                  {
                    'truncated': truncatedContent,
                    'content': content,
                  }
                ],
                'dlSubs': [
                  {
                    'truncated': truncatedContent,
                    'content': content,
                  }
                ],
                'meta': [
                  {
                    'section': section,
                    '_attrs': {
                      key: value,
                    },
                  }
                ],
              }
            ],
            'info': [
              {
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
            ],
          }
        }
      };
      final envelope = SearchConvEnvelope.fromMap(data);
      final response = envelope.body.response as SearchConvResponse;

      expect(response.sortBy, sortBy);
      expect(response.queryOffset, queryOffset);
      expect(response.queryMore, queryMore);

      final conversation = response.conversation!;
      expect(conversation.id, id);
      expect(conversation.num, num);
      expect(conversation.totalSize, totalSize);
      expect(conversation.flags, flags);
      expect(conversation.tags, tags);
      expect(conversation.tagNames, tagNames);

      final convMsg = conversation.messages.first;
      expect(convMsg.sortField, sortField);
      expect(convMsg.id, id);
      expect(convMsg.imapUid, imapUid);
      expect(convMsg.calendarIntendedFor, calendarIntendedFor);
      expect(convMsg.origId, origId);
      expect(convMsg.draftReplyType, draftReplyType);
      expect(convMsg.identityId, identityId);
      expect(convMsg.draftAccountId, draftAccountId);
      expect(convMsg.draftAutoSendTime, draftAutoSendTime);
      expect(convMsg.sentDate, sentDate);
      expect(convMsg.resentDate, resentDate);
      expect(convMsg.part, part);
      expect(convMsg.fragment, fragment);
      expect(convMsg.subject, subject);
      expect(convMsg.messageIdHeader, messageIdHeader);
      expect(convMsg.inReplyTo, inReplyTo);
      expect(convMsg.size, size);
      expect(convMsg.date, date);
      expect(convMsg.folder, folder);
      expect(convMsg.conversationId, conversationId);
      expect(convMsg.flags, flags);
      expect(convMsg.tags, tags);
      expect(convMsg.tagNames, tagNames);
      expect(convMsg.revision, revision);
      expect(convMsg.changeDate, changeDate);
      expect(convMsg.modifiedSequence, modifiedSequence);

      final convHeader = convMsg.headers.first;
      expect(convHeader.key, key);
      expect(convHeader.value, value);

      final convMsgPart = convMsg.messagePartHits.first;
      expect(convMsgPart.part, part);

      final convMsgEmail = convMsg.emails.first;
      expect(convMsgEmail.address, address);
      expect(convMsgEmail.display, display);
      expect(convMsgEmail.personal, personal);
      expect(convMsgEmail.addressType, addressType);
      expect(convMsgEmail.isGroup, isGroup);
      expect(convMsgEmail.canExpandGroupMembers, canExpandGroupMembers);

      final convPartInfo = convMsg.partInfos.first;
      expect(convPartInfo.part, part);
      expect(convPartInfo.contentType, contentType);
      expect(convPartInfo.size, size);
      expect(convPartInfo.contentDisposition, contentDisposition);
      expect(convPartInfo.contentFilename, contentFilename);
      expect(convPartInfo.contentId, contentId);
      expect(convPartInfo.location, location);
      expect(convPartInfo.body, body);
      expect(convPartInfo.truncatedContent, truncatedContent);
      expect(convPartInfo.content, content);

      final convMimePart = convPartInfo.mimeParts.first;
      expect(convMimePart.part, part);
      expect(convMimePart.contentType, contentType);
      expect(convMimePart.size, size);
      expect(convMimePart.contentDisposition, contentDisposition);
      expect(convMimePart.contentFilename, contentFilename);
      expect(convMimePart.contentId, contentId);
      expect(convMimePart.location, location);
      expect(convMimePart.body, body);
      expect(convMimePart.truncatedContent, truncatedContent);
      expect(convMimePart.content, content);

      final convShr = convMsg.shareNotifications.first;
      expect(convShr.content, content);
      expect(convShr.truncatedContent, truncatedContent);

      final convDlSubs = convMsg.dlSubsNotifications.first;
      expect(convDlSubs.content, content);
      expect(convDlSubs.truncatedContent, truncatedContent);

      final convMsgMeta = convMsg.metadatas.first;
      expect(convMsgMeta.section, section);
      expect(convMsgMeta.keyValuePairs.first.key, key);
      expect(convMsgMeta.keyValuePairs.first.value, value);

      final convMsgInvite = convMsg.invite!;
      expect(convMsgInvite.calItemType, calItemType);

      final convTz = convMsgInvite.timezones.first;
      expect(convTz.id, id);
      expect(convTz.tzStdOffset, tzStdOffset);
      expect(convTz.tzDayOffset, tzDayOffset);
      expect(convTz.standardTZName, standardTZName);
      expect(convTz.daylightTZName, daylightTZName);

      final convStandard = convTz.standardTzOnset!;
      expect(convStandard.month, month);
      expect(convStandard.hour, hour);
      expect(convStandard.minute, minute);
      expect(convStandard.second, second);
      expect(convStandard.dayOfMonth, dayOfMonth);
      expect(convStandard.week, week);
      expect(convStandard.dayOfWeek, dayOfWeek);

      final convDaylight = convTz.daylightTzOnset!;
      expect(convDaylight.month, month);
      expect(convDaylight.hour, hour);
      expect(convDaylight.minute, minute);
      expect(convDaylight.second, second);
      expect(convDaylight.dayOfMonth, dayOfMonth);
      expect(convDaylight.week, week);
      expect(convDaylight.dayOfWeek, dayOfWeek);

      final convMsgReply = convMsgInvite.calendarReplies.first;
      expect(convMsgReply.recurrenceRangeType, recurrenceRangeType);
      expect(convMsgReply.recurrenceId, recurrenceId);
      expect(convMsgReply.seq, seq);
      expect(convMsgReply.date, date);
      expect(convMsgReply.attendee, attendee);
      expect(convMsgReply.sentBy, sentBy);
      expect(convMsgReply.partStat, partStat);
      expect(convMsgReply.timezone, timezone);
      expect(convMsgReply.recurIdZ, recurIdZ);

      final convMsgComp = convMsgInvite.inviteComponent!;
      expect(convMsgComp.method, method);
      expect(convMsgComp.componentNum, componentNum);
      expect(convMsgComp.rsvp, rsvp);
      expect(convMsgComp.priority, priority);
      expect(convMsgComp.name, name);
      expect(convMsgComp.location, location);
      expect(convMsgComp.percentComplete, percentComplete);
      expect(convMsgComp.completed, completed);
      expect(convMsgComp.noBlob, noBlob);
      expect(convMsgComp.freeBusyActual, FreeBusyStatus.free);
      expect(convMsgComp.freeBusy, FreeBusyStatus.free);
      expect(convMsgComp.transparency, Transparency.opaque);
      expect(convMsgComp.isOrganizer, isOrganizer);
      expect(convMsgComp.xUid, xUid);
      expect(convMsgComp.uid, uid);
      expect(convMsgComp.sequence, sequence);
      expect(convMsgComp.dateTime, dateTime);
      expect(convMsgComp.calItemId, calItemId);
      expect(convMsgComp.deprecatedApptId, deprecatedApptId);
      expect(convMsgComp.calItemFolder, calItemFolder);
      expect(convMsgComp.status, InviteStatus.completed);
      expect(convMsgComp.calClass, InviteClass.public);
      expect(convMsgComp.url, url);
      expect(convMsgComp.isException, isException);
      expect(convMsgComp.recurIdZ, recurIdZ);
      expect(convMsgComp.isAllDay, isAllDay);
      expect(convMsgComp.isDraft, isDraft);
      expect(convMsgComp.neverSent, neverSent);
      expect(convMsgComp.changes, changes);

      expect(convMsgComp.fragment, fragment);
      expect(convMsgComp.description, description);
      expect(convMsgComp.htmlDescription, htmlDescription);

      expect(convMsgComp.categories.first, category);
      expect(convMsgComp.comments.first, comment);
      expect(convMsgComp.contacts.first, contact);

      final convMsgGeo = convMsgComp.geo!;
      expect(convMsgGeo.latitude, latitude);
      expect(convMsgGeo.longitude, longitude);

      final convMsgCompAt = convMsgComp.attendees.first;
      expect(convMsgCompAt.address, address);
      expect(convMsgCompAt.url, url);
      expect(convMsgCompAt.displayName, displayName);
      expect(convMsgCompAt.sentBy, sentBy);
      expect(convMsgCompAt.dir, dir);
      expect(convMsgCompAt.language, language);
      expect(convMsgCompAt.cuType, cuType);
      expect(convMsgCompAt.role, role);
      expect(convMsgCompAt.partStat, partStat);
      expect(convMsgCompAt.rsvp, rsvp);
      expect(convMsgCompAt.member, member);
      expect(convMsgCompAt.delegatedTo, delegatedTo);
      expect(convMsgCompAt.delegatedFrom, delegatedFrom);
      expect(convMsgCompAt.xParams.first.name, name);
      expect(convMsgCompAt.xParams.first.value, value);

      final convMsgAlarm = convMsgComp.alarms.first;
      expect(convMsgAlarm.action, AlarmAction.display);
      expect(convMsgAlarm.description, description);
      expect(convMsgAlarm.summary, summary);
      expect(convMsgAlarm.attach!.uri, uri);
      expect(convMsgAlarm.attach!.contentType, contentType);
      expect(convMsgAlarm.attach!.binaryB64Data, binaryB64Data);

      final convMsgAlarmAt = convMsgAlarm.attendees.first;
      expect(convMsgAlarmAt.address, address);
      expect(convMsgAlarmAt.url, url);
      expect(convMsgAlarmAt.displayName, displayName);
      expect(convMsgAlarmAt.sentBy, sentBy);
      expect(convMsgAlarmAt.dir, dir);
      expect(convMsgAlarmAt.language, language);
      expect(convMsgAlarmAt.cuType, cuType);
      expect(convMsgAlarmAt.role, role);
      expect(convMsgAlarmAt.partStat, partStat);
      expect(convMsgAlarmAt.rsvp, rsvp);
      expect(convMsgAlarmAt.member, member);
      expect(convMsgAlarmAt.delegatedTo, delegatedTo);
      expect(convMsgAlarmAt.delegatedFrom, delegatedFrom);
      expect(convMsgAlarmAt.xParams.first.name, name);
      expect(convMsgAlarmAt.xParams.first.value, value);

      final convMsgAlarmXProp = convMsgAlarm.xProps.first;
      expect(convMsgAlarmXProp.name, name);
      expect(convMsgAlarmXProp.value, value);
      expect(convMsgAlarmXProp.xParams.first.name, name);
      expect(convMsgAlarmXProp.xParams.first.value, value);

      final convMsgCompXProp = convMsgComp.xProps.first;
      expect(convMsgCompXProp.name, name);
      expect(convMsgCompXProp.value, value);
      expect(convMsgCompXProp.xParams.first.name, name);
      expect(convMsgCompXProp.xParams.first.value, value);

      final convMsgOrganizer = convMsgComp.organizer!;
      expect(convMsgOrganizer.address, address);
      expect(convMsgOrganizer.url, url);
      expect(convMsgOrganizer.displayName, displayName);
      expect(convMsgOrganizer.sentBy, sentBy);
      expect(convMsgOrganizer.dir, dir);
      expect(convMsgOrganizer.language, language);
      expect(convMsgOrganizer.xParams.first.name, name);
      expect(convMsgOrganizer.xParams.first.value, value);

      final convMsgRecurrence = convMsgComp.recurrence!;
      expect(convMsgRecurrence.add.first, isA<AddRecurrenceInfo>());
      expect(convMsgRecurrence.exclude.first, isA<ExcludeRecurrenceInfo>());

      final convMsgExcept = convMsgRecurrence.except.first;
      expect(convMsgExcept.recurrenceRangeType, recurrenceRangeType);
      expect(convMsgExcept.recurrenceId, recurrenceId);
      expect(convMsgExcept.timezone, timezone);
      expect(convMsgExcept.recurIdZ, recurIdZ);
      expect(convMsgExcept.add, isA<RecurrenceInfo>());
      expect(convMsgExcept.exclude, isA<RecurrenceInfo>());

      final convMsgCancel = convMsgRecurrence.cancel.first;
      expect(convMsgCancel.recurrenceRangeType, recurrenceRangeType);
      expect(convMsgCancel.recurrenceId, recurrenceId);
      expect(convMsgCancel.timezone, timezone);
      expect(convMsgCancel.recurIdZ, recurIdZ);

      final convMsgDates = convMsgRecurrence.dates.first;
      expect(convMsgDates.timezone, timezone);

      final convMsgStartTime = convMsgDates.dtVals.first.startTime!;
      expect(convMsgStartTime.dateTime, dateTimeString);
      expect(convMsgStartTime.timezone, timezone);
      expect(convMsgStartTime.utcTime, utcTime);

      final convMsgEndTime = convMsgDates.dtVals.first.endTime!;
      expect(convMsgEndTime.dateTime, dateTimeString);
      expect(convMsgEndTime.timezone, timezone);
      expect(convMsgEndTime.utcTime, utcTime);

      final convMsgDuration = convMsgDates.dtVals.first.duration!;
      expect(convMsgDuration.durationNegative, durationNegative);
      expect(convMsgDuration.weeks, weeks);
      expect(convMsgDuration.days, days);
      expect(convMsgDuration.hours, hours);
      expect(convMsgDuration.minutes, minutes);
      expect(convMsgDuration.seconds, seconds);
      expect(convMsgDuration.related, AlarmRelated.start);
      expect(convMsgDuration.repeatCount, repeatCount);

      final convMsgSimple = convMsgRecurrence.simple.first;
      expect(convMsgSimple.until!.dateTime, dateTimeString);
      expect(convMsgSimple.count!.num, num);
      expect(convMsgSimple.interval!.ival, ival);
      expect(convMsgSimple.bySecond!.list, list);
      expect(convMsgSimple.byMinute!.list, list);
      expect(convMsgSimple.byHour!.list, list);
      expect(convMsgSimple.byDay!.days.first.day, WeekDay.sunday);
      expect(convMsgSimple.byDay!.days.first.ordWk, ordWk);
      expect(convMsgSimple.byMonthDay!.list, list);
      expect(convMsgSimple.byYearDay!.list, list);
      expect(convMsgSimple.byWeekNo!.list, list);
      expect(convMsgSimple.byMonth!.list, list);
      expect(convMsgSimple.bySetPose!.list, list);
      expect(convMsgSimple.weekStart!.day, WeekDay.sunday);
      expect(convMsgSimple.xNames.first.name, name);
      expect(convMsgSimple.xNames.first.value, value);

      final convMsgExceptionId = convMsgComp.exceptionId!;
      expect(convMsgExceptionId.dateTime, dateTimeString);
      expect(convMsgExceptionId.timezone, timezone);
      expect(convMsgExceptionId.recurrenceRangeType, recurrenceRangeType);

      final convMsgDtStart = convMsgComp.dtStart!;
      expect(convMsgDtStart.dateTime, dateTimeString);
      expect(convMsgDtStart.timezone, timezone);
      expect(convMsgDtStart.utcTime, utcTime);

      final convMsgDtEnd = convMsgComp.dtEnd!;
      expect(convMsgDtEnd.dateTime, dateTimeString);
      expect(convMsgDtEnd.timezone, timezone);
      expect(convMsgDtEnd.utcTime, utcTime);

      final convMsgInviteDuration = convMsgComp.duration!;
      expect(convMsgInviteDuration.durationNegative, durationNegative);
      expect(convMsgInviteDuration.weeks, weeks);
      expect(convMsgInviteDuration.days, days);
      expect(convMsgInviteDuration.hours, hours);
      expect(convMsgInviteDuration.minutes, minutes);
      expect(convMsgInviteDuration.seconds, seconds);
      expect(convMsgInviteDuration.related, AlarmRelated.start);
      expect(convMsgInviteDuration.repeatCount, repeatCount);

      final convQueryInfo = conversation.queryInfo!;
      expect(convQueryInfo.suggests.first.suggestedQueryString, suggestedQueryString);
      expect(convQueryInfo.wildcards.first.wildcardString, wildcardString);
      expect(convQueryInfo.wildcards.first.expanded, expanded);
      expect(convQueryInfo.wildcards.first.numExpanded, numExpanded);

      final resMsg = response.messages.first;
      expect(resMsg.sortField, sortField);
      expect(resMsg.id, id);
      expect(resMsg.imapUid, imapUid);
      expect(resMsg.calendarIntendedFor, calendarIntendedFor);
      expect(resMsg.origId, origId);
      expect(resMsg.draftReplyType, draftReplyType);
      expect(resMsg.identityId, identityId);
      expect(resMsg.draftAccountId, draftAccountId);
      expect(resMsg.draftAutoSendTime, draftAutoSendTime);
      expect(resMsg.sentDate, sentDate);
      expect(resMsg.resentDate, resentDate);
      expect(resMsg.part, part);
      expect(resMsg.fragment, fragment);
      expect(resMsg.subject, subject);
      expect(resMsg.messageIdHeader, messageIdHeader);
      expect(resMsg.inReplyTo, inReplyTo);
      expect(resMsg.size, size);
      expect(resMsg.date, date);
      expect(resMsg.folder, folder);
      expect(resMsg.conversationId, conversationId);
      expect(resMsg.flags, flags);
      expect(resMsg.tags, tags);
      expect(resMsg.tagNames, tagNames);
      expect(resMsg.revision, revision);
      expect(resMsg.changeDate, changeDate);
      expect(resMsg.modifiedSequence, modifiedSequence);

      final resMsgHeader = resMsg.headers.first;
      expect(resMsgHeader.key, key);
      expect(resMsgHeader.value, value);

      final resMsgPart = resMsg.messagePartHits.first;
      expect(resMsgPart.part, part);

      final resMsgEmail = resMsg.emails.first;
      expect(resMsgEmail.address, address);
      expect(resMsgEmail.display, display);
      expect(resMsgEmail.personal, personal);
      expect(resMsgEmail.addressType, addressType);
      expect(resMsgEmail.isGroup, isGroup);
      expect(resMsgEmail.canExpandGroupMembers, canExpandGroupMembers);

      final resMsgPartInfo = resMsg.partInfos.first;
      expect(resMsgPartInfo.part, part);
      expect(resMsgPartInfo.contentType, contentType);
      expect(resMsgPartInfo.size, size);
      expect(resMsgPartInfo.contentDisposition, contentDisposition);
      expect(resMsgPartInfo.contentFilename, contentFilename);
      expect(resMsgPartInfo.contentId, contentId);
      expect(resMsgPartInfo.location, location);
      expect(resMsgPartInfo.body, body);
      expect(resMsgPartInfo.truncatedContent, truncatedContent);
      expect(resMsgPartInfo.content, content);

      final resMsgMimePart = resMsgPartInfo.mimeParts.first;
      expect(resMsgMimePart.part, part);
      expect(resMsgMimePart.contentType, contentType);
      expect(resMsgMimePart.size, size);
      expect(resMsgMimePart.contentDisposition, contentDisposition);
      expect(resMsgMimePart.contentFilename, contentFilename);
      expect(resMsgMimePart.contentId, contentId);
      expect(resMsgMimePart.location, location);
      expect(resMsgMimePart.body, body);
      expect(resMsgMimePart.truncatedContent, truncatedContent);
      expect(resMsgMimePart.content, content);

      final resMsgShr = resMsg.shareNotifications.first;
      expect(resMsgShr.content, content);
      expect(resMsgShr.truncatedContent, truncatedContent);

      final resMsgDlSubs = resMsg.dlSubsNotifications.first;
      expect(resMsgDlSubs.content, content);
      expect(resMsgDlSubs.truncatedContent, truncatedContent);

      final resMsgMeta = resMsg.metadatas.first;
      expect(resMsgMeta.section, section);
      expect(resMsgMeta.keyValuePairs.first.key, key);
      expect(resMsgMeta.keyValuePairs.first.value, value);

      final resMsgInvite = resMsg.invite!;
      expect(resMsgInvite.calItemType, calItemType);

      final resMsgTz = resMsgInvite.timezones.first;
      expect(resMsgTz.id, id);
      expect(resMsgTz.tzStdOffset, tzStdOffset);
      expect(resMsgTz.tzDayOffset, tzDayOffset);
      expect(resMsgTz.standardTZName, standardTZName);
      expect(resMsgTz.daylightTZName, daylightTZName);

      final resMsgStandard = resMsgTz.standardTzOnset!;
      expect(resMsgStandard.month, month);
      expect(resMsgStandard.hour, hour);
      expect(resMsgStandard.minute, minute);
      expect(resMsgStandard.second, second);
      expect(resMsgStandard.dayOfMonth, dayOfMonth);
      expect(resMsgStandard.week, week);
      expect(resMsgStandard.dayOfWeek, dayOfWeek);

      final resMsgDaylight = resMsgTz.daylightTzOnset!;
      expect(resMsgDaylight.month, month);
      expect(resMsgDaylight.hour, hour);
      expect(resMsgDaylight.minute, minute);
      expect(resMsgDaylight.second, second);
      expect(resMsgDaylight.dayOfMonth, dayOfMonth);
      expect(resMsgDaylight.week, week);
      expect(resMsgDaylight.dayOfWeek, dayOfWeek);

      final resMsgReply = resMsgInvite.calendarReplies.first;
      expect(resMsgReply.recurrenceRangeType, recurrenceRangeType);
      expect(resMsgReply.recurrenceId, recurrenceId);
      expect(resMsgReply.seq, seq);
      expect(resMsgReply.date, date);
      expect(resMsgReply.attendee, attendee);
      expect(resMsgReply.sentBy, sentBy);
      expect(resMsgReply.partStat, partStat);
      expect(resMsgReply.timezone, timezone);
      expect(resMsgReply.recurIdZ, recurIdZ);

      final resMsgComp = resMsgInvite.inviteComponent!;
      expect(resMsgComp.method, method);
      expect(resMsgComp.componentNum, componentNum);
      expect(resMsgComp.rsvp, rsvp);
      expect(resMsgComp.priority, priority);
      expect(resMsgComp.name, name);
      expect(resMsgComp.location, location);
      expect(resMsgComp.percentComplete, percentComplete);
      expect(resMsgComp.completed, completed);
      expect(resMsgComp.noBlob, noBlob);
      expect(resMsgComp.freeBusyActual, FreeBusyStatus.free);
      expect(resMsgComp.freeBusy, FreeBusyStatus.free);
      expect(resMsgComp.transparency, Transparency.opaque);
      expect(resMsgComp.isOrganizer, isOrganizer);
      expect(resMsgComp.xUid, xUid);
      expect(resMsgComp.uid, uid);
      expect(resMsgComp.sequence, sequence);
      expect(resMsgComp.dateTime, dateTime);
      expect(resMsgComp.calItemId, calItemId);
      expect(resMsgComp.deprecatedApptId, deprecatedApptId);
      expect(resMsgComp.calItemFolder, calItemFolder);
      expect(resMsgComp.status, InviteStatus.completed);
      expect(resMsgComp.calClass, InviteClass.public);
      expect(resMsgComp.url, url);
      expect(resMsgComp.isException, isException);
      expect(resMsgComp.recurIdZ, recurIdZ);
      expect(resMsgComp.isAllDay, isAllDay);
      expect(resMsgComp.isDraft, isDraft);
      expect(resMsgComp.neverSent, neverSent);
      expect(resMsgComp.changes, changes);
      expect(resMsgComp.fragment, fragment);
      expect(resMsgComp.description, description);
      expect(resMsgComp.htmlDescription, htmlDescription);
      expect(resMsgComp.categories.first, category);
      expect(resMsgComp.comments.first, comment);
      expect(resMsgComp.contacts.first, contact);

      final resMsgGeo = resMsgComp.geo!;
      expect(resMsgGeo.latitude, latitude);
      expect(resMsgGeo.longitude, longitude);

      final resMsgCompAt = resMsgComp.attendees.first;
      expect(resMsgCompAt.address, address);
      expect(resMsgCompAt.url, url);
      expect(resMsgCompAt.displayName, displayName);
      expect(resMsgCompAt.sentBy, sentBy);
      expect(resMsgCompAt.dir, dir);
      expect(resMsgCompAt.language, language);
      expect(resMsgCompAt.cuType, cuType);
      expect(resMsgCompAt.role, role);
      expect(resMsgCompAt.partStat, partStat);
      expect(resMsgCompAt.rsvp, rsvp);
      expect(resMsgCompAt.member, member);
      expect(resMsgCompAt.delegatedTo, delegatedTo);
      expect(resMsgCompAt.delegatedFrom, delegatedFrom);
      expect(resMsgCompAt.xParams.first.name, name);
      expect(resMsgCompAt.xParams.first.value, value);

      final resMsgAlarm = resMsgComp.alarms.first;
      expect(resMsgAlarm.action, AlarmAction.display);
      expect(resMsgAlarm.description, description);
      expect(resMsgAlarm.summary, summary);
      expect(resMsgAlarm.attach!.uri, uri);
      expect(resMsgAlarm.attach!.contentType, contentType);
      expect(resMsgAlarm.attach!.binaryB64Data, binaryB64Data);

      final resMsgAlarmAt = resMsgAlarm.attendees.first;
      expect(resMsgAlarmAt.address, address);
      expect(resMsgAlarmAt.url, url);
      expect(resMsgAlarmAt.displayName, displayName);
      expect(resMsgAlarmAt.sentBy, sentBy);
      expect(resMsgAlarmAt.dir, dir);
      expect(resMsgAlarmAt.language, language);
      expect(resMsgAlarmAt.cuType, cuType);
      expect(resMsgAlarmAt.role, role);
      expect(resMsgAlarmAt.partStat, partStat);
      expect(resMsgAlarmAt.rsvp, rsvp);
      expect(resMsgAlarmAt.member, member);
      expect(resMsgAlarmAt.delegatedTo, delegatedTo);
      expect(resMsgAlarmAt.delegatedFrom, delegatedFrom);
      expect(resMsgAlarmAt.xParams.first.name, name);
      expect(resMsgAlarmAt.xParams.first.value, value);

      final resMsgAlarmXProp = resMsgAlarm.xProps.first;
      expect(resMsgAlarmXProp.name, name);
      expect(resMsgAlarmXProp.value, value);
      expect(resMsgAlarmXProp.xParams.first.name, name);
      expect(resMsgAlarmXProp.xParams.first.value, value);

      final resMsgCompXProp = resMsgComp.xProps.first;
      expect(resMsgCompXProp.name, name);
      expect(resMsgCompXProp.value, value);
      expect(resMsgCompXProp.xParams.first.name, name);
      expect(resMsgCompXProp.xParams.first.value, value);

      final resMsgOrganizer = resMsgComp.organizer!;
      expect(resMsgOrganizer.address, address);
      expect(resMsgOrganizer.url, url);
      expect(resMsgOrganizer.displayName, displayName);
      expect(resMsgOrganizer.sentBy, sentBy);
      expect(resMsgOrganizer.dir, dir);
      expect(resMsgOrganizer.language, language);
      expect(resMsgOrganizer.xParams.first.name, name);
      expect(resMsgOrganizer.xParams.first.value, value);

      final resMsgRecurrence = resMsgComp.recurrence!;
      expect(resMsgRecurrence.add.first, isA<AddRecurrenceInfo>());
      expect(resMsgRecurrence.exclude.first, isA<ExcludeRecurrenceInfo>());

      final resMsgExcept = resMsgRecurrence.except.first;
      expect(resMsgExcept.recurrenceRangeType, recurrenceRangeType);
      expect(resMsgExcept.recurrenceId, recurrenceId);
      expect(resMsgExcept.timezone, timezone);
      expect(resMsgExcept.recurIdZ, recurIdZ);
      expect(resMsgExcept.add, isA<RecurrenceInfo>());
      expect(resMsgExcept.exclude, isA<RecurrenceInfo>());

      final resMsgCancel = resMsgRecurrence.cancel.first;
      expect(resMsgCancel.recurrenceRangeType, recurrenceRangeType);
      expect(resMsgCancel.recurrenceId, recurrenceId);
      expect(resMsgCancel.timezone, timezone);
      expect(resMsgCancel.recurIdZ, recurIdZ);

      final resMsgDates = resMsgRecurrence.dates.first;
      expect(resMsgDates.timezone, timezone);

      final resMsgStartTime = resMsgDates.dtVals.first.startTime!;
      expect(resMsgStartTime.dateTime, dateTimeString);
      expect(resMsgStartTime.timezone, timezone);
      expect(resMsgStartTime.utcTime, utcTime);

      final resMsgEndTime = resMsgDates.dtVals.first.endTime!;
      expect(resMsgEndTime.dateTime, dateTimeString);
      expect(resMsgEndTime.timezone, timezone);
      expect(resMsgEndTime.utcTime, utcTime);

      final resMsgDuration = resMsgDates.dtVals.first.duration!;
      expect(resMsgDuration.durationNegative, durationNegative);
      expect(resMsgDuration.weeks, weeks);
      expect(resMsgDuration.days, days);
      expect(resMsgDuration.hours, hours);
      expect(resMsgDuration.minutes, minutes);
      expect(resMsgDuration.seconds, seconds);
      expect(resMsgDuration.related, AlarmRelated.start);
      expect(resMsgDuration.repeatCount, repeatCount);

      final resMsgSimple = resMsgRecurrence.simple.first;
      expect(resMsgSimple.until!.dateTime, dateTimeString);
      expect(resMsgSimple.count!.num, num);
      expect(resMsgSimple.interval!.ival, ival);
      expect(resMsgSimple.bySecond!.list, list);
      expect(resMsgSimple.byMinute!.list, list);
      expect(resMsgSimple.byHour!.list, list);
      expect(resMsgSimple.byDay!.days.first.day, WeekDay.sunday);
      expect(resMsgSimple.byDay!.days.first.ordWk, ordWk);
      expect(resMsgSimple.byMonthDay!.list, list);
      expect(resMsgSimple.byYearDay!.list, list);
      expect(resMsgSimple.byWeekNo!.list, list);
      expect(resMsgSimple.byMonth!.list, list);
      expect(resMsgSimple.bySetPose!.list, list);
      expect(resMsgSimple.weekStart!.day, WeekDay.sunday);
      expect(resMsgSimple.xNames.first.name, name);
      expect(resMsgSimple.xNames.first.value, value);

      final resMsgExceptionId = resMsgComp.exceptionId!;
      expect(resMsgExceptionId.dateTime, dateTimeString);
      expect(resMsgExceptionId.timezone, timezone);
      expect(resMsgExceptionId.recurrenceRangeType, recurrenceRangeType);

      final resMsgDtStart = resMsgComp.dtStart!;
      expect(resMsgDtStart.dateTime, dateTimeString);
      expect(resMsgDtStart.timezone, timezone);
      expect(resMsgDtStart.utcTime, utcTime);

      final resMsgDtEnd = resMsgComp.dtEnd!;
      expect(resMsgDtEnd.dateTime, dateTimeString);
      expect(resMsgDtEnd.timezone, timezone);
      expect(resMsgDtEnd.utcTime, utcTime);

      final resMsgInviteDuration = resMsgComp.duration!;
      expect(resMsgInviteDuration.durationNegative, durationNegative);
      expect(resMsgInviteDuration.weeks, weeks);
      expect(resMsgInviteDuration.days, days);
      expect(resMsgInviteDuration.hours, hours);
      expect(resMsgInviteDuration.minutes, minutes);
      expect(resMsgInviteDuration.seconds, seconds);
      expect(resMsgInviteDuration.related, AlarmRelated.start);
      expect(resMsgInviteDuration.repeatCount, repeatCount);

      final resMsgQueryInfo = response.queryInfo!;
      expect(resMsgQueryInfo.suggests.first.suggestedQueryString, suggestedQueryString);
      expect(resMsgQueryInfo.wildcards.first.wildcardString, wildcardString);
      expect(resMsgQueryInfo.wildcards.first.expanded, expanded);
      expect(resMsgQueryInfo.wildcards.first.numExpanded, numExpanded);
    }));
  }));
}
