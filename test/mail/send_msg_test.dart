import 'dart:math';

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
import 'package:zimbra_api/src/common/enum/participation_status.dart';
import 'package:zimbra_api/src/common/enum/reply_type.dart';
import 'package:zimbra_api/src/common/enum/transparency.dart';
import 'package:zimbra_api/src/common/enum/week_day.dart';
import 'package:zimbra_api/src/common/type/tz_onset_info.dart';
import 'package:zimbra_api/src/mail/message/send_msg_envelope.dart';
import 'package:zimbra_api/src/mail/message/send_msg_request.dart';
import 'package:zimbra_api/src/mail/type/add_recurrence_info.dart';
import 'package:zimbra_api/src/mail/type/alarm_info.dart';
import 'package:zimbra_api/src/mail/type/alarm_trigger_info.dart';
import 'package:zimbra_api/src/mail/type/attachments_info.dart';
import 'package:zimbra_api/src/mail/type/by_day_rule.dart';
import 'package:zimbra_api/src/mail/type/by_hour_rule.dart';
import 'package:zimbra_api/src/mail/type/by_minute_rule.dart';
import 'package:zimbra_api/src/mail/type/by_month_day_rule.dart';
import 'package:zimbra_api/src/mail/type/by_month_rule.dart';
import 'package:zimbra_api/src/mail/type/by_second_rule.dart';
import 'package:zimbra_api/src/mail/type/by_set_pos_rule.dart';
import 'package:zimbra_api/src/mail/type/by_week_no_rule.dart';
import 'package:zimbra_api/src/mail/type/by_year_day_rule.dart';
import 'package:zimbra_api/src/mail/type/cal_organizer.dart';
import 'package:zimbra_api/src/mail/type/cal_tz_info.dart';
import 'package:zimbra_api/src/mail/type/calendar_attach.dart';
import 'package:zimbra_api/src/mail/type/calendar_attendee.dart';
import 'package:zimbra_api/src/mail/type/cancel_rule_info.dart';
import 'package:zimbra_api/src/mail/type/contact_attach_spec.dart';
import 'package:zimbra_api/src/mail/type/date_attr.dart';
import 'package:zimbra_api/src/mail/type/date_time_string_attr.dart';
import 'package:zimbra_api/src/mail/type/doc_attach_spec.dart';
import 'package:zimbra_api/src/mail/type/dt_time_info.dart';
import 'package:zimbra_api/src/mail/type/dt_val.dart';
import 'package:zimbra_api/src/mail/type/duration_info.dart';
import 'package:zimbra_api/src/mail/type/email_addr_info.dart';
import 'package:zimbra_api/src/mail/type/exception_recur_id_info.dart';
import 'package:zimbra_api/src/mail/type/exception_rule_info.dart';
import 'package:zimbra_api/src/mail/type/exclude_recurrence_info.dart';
import 'package:zimbra_api/src/mail/type/geo_info.dart';
import 'package:zimbra_api/src/mail/type/header.dart';
import 'package:zimbra_api/src/mail/type/interval_rule.dart';
import 'package:zimbra_api/src/mail/type/invitation_info.dart';
import 'package:zimbra_api/src/mail/type/invite_component.dart';
import 'package:zimbra_api/src/mail/type/mime_part_attach_spec.dart';
import 'package:zimbra_api/src/mail/type/mime_part_info.dart';
import 'package:zimbra_api/src/mail/type/msg_attach_spec.dart';
import 'package:zimbra_api/src/mail/type/msg_to_send.dart';
import 'package:zimbra_api/src/mail/type/num_attr.dart';
import 'package:zimbra_api/src/mail/type/raw_invite.dart';
import 'package:zimbra_api/src/mail/type/recurrence_info.dart';
import 'package:zimbra_api/src/mail/type/simple_repeating_rule.dart';
import 'package:zimbra_api/src/mail/type/single_dates.dart';
import 'package:zimbra_api/src/mail/type/wk_day.dart';
import 'package:zimbra_api/src/mail/type/wkst_rule.dart';
import 'package:zimbra_api/src/mail/type/xname_rule.dart';
import 'package:zimbra_api/src/mail/type/xparam.dart';
import 'package:zimbra_api/src/mail/type/xprop.dart';

void main() {
  final faker = Faker();

  group('Send msg tests', (() {
    test('Send msg request', (() {
      final needCalendarSentByFixup = faker.randomGenerator.boolean();
      final isCalendarForward = faker.randomGenerator.boolean();
      final noSaveToSent = faker.randomGenerator.boolean();
      final fetchSavedMsg = faker.randomGenerator.boolean();
      final sendUid = faker.guid.guid();
      final deliveryReport = faker.randomGenerator.boolean();

      final draftId = faker.guid.guid();
      final sendFromDraft = faker.randomGenerator.boolean();
      final dataSourceId = faker.guid.guid();

      final id = faker.guid.guid();
      final componentNum = faker.randomGenerator.integer(100);
      final identityId = faker.guid.guid();

      final dateString = faker.date.dateTime().toString();
      final timezone = faker.lorem.word();
      final utcTime = faker.date.dateTime().millisecondsSinceEpoch;

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

      final attachmentId = faker.guid.guid();
      final origId = faker.guid.guid();
      final subject = faker.lorem.word();
      final inReplyTo = faker.internet.email();
      final folderId = faker.guid.guid();
      final flags = faker.lorem.word();
      final content = faker.lorem.word();
      final fragment = faker.lorem.word();
      final description = faker.lorem.word();
      final htmlDescription = faker.lorem.word();

      final name = faker.lorem.word();
      final value = faker.lorem.word();

      final contentType = faker.lorem.word();
      final contentId = faker.guid.guid();

      final messageId = faker.guid.guid();
      final part = faker.lorem.word();
      final path = faker.lorem.word();
      final version = faker.randomGenerator.integer(100);
      final optional = faker.randomGenerator.boolean();
      final uid = faker.guid.guid();
      final summary = faker.lorem.word();

      final address = faker.internet.email();
      final personal = faker.person.name();

      final category = faker.lorem.word();
      final comment = faker.lorem.word();
      final contact = faker.lorem.word();
      final latitude = faker.randomGenerator.decimal().toString();
      final longitude = faker.randomGenerator.decimal().toString();

      final url = faker.internet.httpsUrl();
      final displayName = faker.person.name();
      final sentBy = faker.internet.email();
      final dir = faker.lorem.word();
      final language = faker.address.countryCode();
      final cuType = faker.lorem.word();
      final role = faker.lorem.word();
      final rsvp = faker.randomGenerator.boolean();
      final member = faker.internet.email();
      final delegatedTo = faker.internet.email();
      final delegatedFrom = faker.internet.email();

      final durationNegative = faker.randomGenerator.boolean();
      final weeks = faker.randomGenerator.integer(100);
      final days = faker.randomGenerator.integer(100);
      final hours = faker.randomGenerator.integer(100);
      final minutes = faker.randomGenerator.integer(100);
      final seconds = faker.randomGenerator.integer(100);
      final repeatCount = faker.randomGenerator.integer(100);

      final uri = faker.internet.uri('http');
      final binaryB64Data = faker.lorem.word();

      final recurrenceRangeType = faker.randomGenerator.integer(3, min: 1);
      final recurrenceId = faker.guid.guid();
      final recurIdZ = faker.date.dateTime().toString();
      final num = faker.randomGenerator.integer(100);
      final ival = faker.randomGenerator.integer(100);
      final list = faker.randomGenerator.amount((_) => random.integer(10), 10).join(',');
      final ordWk = faker.randomGenerator.integer(100);

      final partStat = faker.randomGenerator.element(ParticipationStatus.values);
      final method = faker.lorem.word();
      final priority = faker.randomGenerator.integer(9).toString();
      final location = faker.address.streetAddress();
      final percentComplete = faker.randomGenerator.integer(100).toString();
      final completed = faker.date.dateTime().toString();
      final noBlob = faker.randomGenerator.boolean();
      final isOrganizer = faker.randomGenerator.boolean();
      final xUid = faker.guid.guid();
      final sequence = faker.randomGenerator.integer(100);
      final dateTime = faker.randomGenerator.integer(100);
      final calItemId = faker.guid.guid();
      final deprecatedApptId = faker.guid.guid();
      final calItemFolder = faker.lorem.word();
      final isException = faker.randomGenerator.boolean();
      final isAllDay = faker.randomGenerator.boolean();
      final isDraft = faker.randomGenerator.boolean();
      final neverSent = faker.randomGenerator.boolean();
      final changes = faker.lorem.words(3).join(',');

      final request = SendMsgRequest(
        MsgToSend(
          draftId: draftId,
          sendFromDraft: sendFromDraft,
          dataSourceId: dataSourceId,
          attachmentId: attachmentId,
          origId: origId,
          replyType: ReplyType.replied,
          identityId: identityId,
          subject: subject,
          headers: [Header(name, value: value)],
          inReplyTo: inReplyTo,
          folderId: folderId,
          flags: flags,
          content: content,
          mimePart: MimePartInfo(
            contentType: contentType,
            content: content,
            contentId: contentId,
            attachments: AttachmentsInfo(
              attachmentId,
              mpAttachments: [MimePartAttachSpec(messageId, part, optional: optional)],
              msgAttachments: [MsgAttachSpec(id, optional: optional)],
              cnAttachments: [ContactAttachSpec(id, optional: optional)],
              docAttachments: [DocAttachSpec(path: path, id: id, version: version, optional: optional)],
            ),
            mimeParts: [MimePartInfo(contentType: contentType, content: content, contentId: contentId)],
          ),
          attachments: AttachmentsInfo(
            attachmentId,
            mpAttachments: [MimePartAttachSpec(messageId, part, optional: optional)],
            msgAttachments: [MsgAttachSpec(id, optional: optional)],
            cnAttachments: [ContactAttachSpec(id, optional: optional)],
            docAttachments: [DocAttachSpec(path: path, id: id, version: version, optional: optional)],
          ),
          invite: InvitationInfo(
            id: id,
            contentType: contentType,
            contentId: contentId,
            content: RawInvite(uid: uid, summary: summary, content: content),
            inviteComponent: InviteComponent(
              method: method,
              componentNum: componentNum,
              rsvp: rsvp,
              priority: priority,
              name: name,
              location: location,
              percentComplete: percentComplete,
              completed: completed,
              noBlob: noBlob,
              freeBusyActual: FreeBusyStatus.free,
              freeBusy: FreeBusyStatus.free,
              transparency: Transparency.opaque,
              isOrganizer: isOrganizer,
              xUid: xUid,
              uid: uid,
              sequence: sequence,
              dateTime: dateTime,
              calItemId: calItemId,
              deprecatedApptId: deprecatedApptId,
              calItemFolder: calItemFolder,
              status: InviteStatus.completed,
              calClass: InviteClass.public,
              url: url,
              isException: isException,
              recurIdZ: recurIdZ,
              isAllDay: isAllDay,
              isDraft: isDraft,
              neverSent: neverSent,
              changes: changes,
            ),
            timezones: [
              CalTZInfo(
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
              )
            ],
            mimeParts: [
              MimePartInfo(
                contentType: contentType,
                content: content,
                contentId: contentId,
              )
            ],
            attachments: AttachmentsInfo(attachmentId),
            categories: [category],
            comments: [comment],
            contacts: [contact],
            geo: GeoInfo(latitude: latitude, longitude: longitude),
            attendees: [
              CalendarAttendee(
                address: address,
                url: url,
                displayName: displayName,
                sentBy: sentBy,
                dir: dir,
                language: language,
                cuType: cuType,
                role: role,
                partStat: partStat,
                rsvp: rsvp,
                member: member,
                delegatedTo: delegatedTo,
                delegatedFrom: delegatedFrom,
                xParams: [XParam(name, value: value)],
              )
            ],
            alarms: [
              AlarmInfo(
                action: AlarmAction.display,
                trigger: AlarmTriggerInfo(absolute: DateAttr(dateString), relative: DateAttr(dateString)),
                repeat: DurationInfo(
                  durationNegative: durationNegative,
                  weeks: weeks,
                  days: days,
                  hours: hours,
                  minutes: minutes,
                  seconds: seconds,
                  related: AlarmRelated.start,
                  repeatCount: repeatCount,
                ),
                description: description,
                attach: CalendarAttach(uri: uri, contentType: contentType, binaryB64Data: binaryB64Data),
                summary: summary,
                attendees: [
                  CalendarAttendee(
                    address: address,
                    url: url,
                    displayName: displayName,
                    sentBy: sentBy,
                    dir: dir,
                    language: language,
                    cuType: cuType,
                    role: role,
                    partStat: partStat,
                    rsvp: rsvp,
                    member: member,
                    delegatedTo: delegatedTo,
                    delegatedFrom: delegatedFrom,
                    xParams: [XParam(name, value: value)],
                  )
                ],
                xProps: [
                  XProp(name, value: value, xParams: [XParam(name, value: value)])
                ],
              )
            ],
            xProps: [
              XProp(name, value: value, xParams: [XParam(name, value: value)])
            ],
            fragment: fragment,
            description: description,
            htmlDescription: htmlDescription,
            organizer: CalOrganizer(
              address: address,
              url: url,
              displayName: displayName,
              sentBy: sentBy,
              dir: dir,
              language: language,
              xParams: [XParam(name, value: value)],
            ),
            recurrence: RecurrenceInfo(
              add: [AddRecurrenceInfo()],
              exclude: [ExcludeRecurrenceInfo()],
              except: [
                ExceptionRuleInfo(
                  recurrenceRangeType,
                  recurrenceId,
                  timezone: timezone,
                  recurIdZ: recurIdZ,
                  add: RecurrenceInfo(),
                  exclude: RecurrenceInfo(),
                )
              ],
              cancel: [CancelRuleInfo(recurrenceRangeType, recurrenceId, timezone: timezone, recurIdZ: recurIdZ)],
              dates: [
                SingleDates(timezone: timezone, dtVals: [
                  DtVal(
                    startTime: DtTimeInfo(dateTime: dateString, timezone: timezone, utcTime: utcTime),
                    endTime: DtTimeInfo(dateTime: dateString, timezone: timezone, utcTime: utcTime),
                    duration: DurationInfo(
                      durationNegative: durationNegative,
                      weeks: weeks,
                      days: days,
                      hours: hours,
                      minutes: minutes,
                      seconds: seconds,
                      related: AlarmRelated.start,
                      repeatCount: repeatCount,
                    ),
                  )
                ])
              ],
              simple: [
                SimpleRepeatingRule(
                  frequency: Frequency.second,
                  until: DateTimeStringAttr(dateString),
                  count: NumAttr(num),
                  interval: IntervalRule(ival),
                  bySecond: BySecondRule(list),
                  byMinute: ByMinuteRule(list),
                  byHour: ByHourRule(list),
                  byDay: ByDayRule(days: [WkDay(WeekDay.sunday, ordWk: ordWk)]),
                  byMonthDay: ByMonthDayRule(list),
                  byYearDay: ByYearDayRule(list),
                  byWeekNo: ByWeekNoRule(list),
                  byMonth: ByMonthRule(list),
                  bySetPose: BySetPosRule(list),
                  weekStart: WkstRule(WeekDay.sunday),
                  xNames: [XNameRule(name: name, value: value)],
                ),
              ],
            ),
            exceptionId: ExceptionRecurIdInfo(
              dateTime: dateString,
              timezone: timezone,
              recurrenceRangeType: recurrenceRangeType,
            ),
            dtStart: DtTimeInfo(dateTime: dateString, timezone: timezone, utcTime: utcTime),
            dtEnd: DtTimeInfo(dateTime: dateString, timezone: timezone, utcTime: utcTime),
            duration: DurationInfo(
              durationNegative: durationNegative,
              weeks: weeks,
              days: days,
              hours: hours,
              minutes: minutes,
              seconds: seconds,
              related: AlarmRelated.start,
              repeatCount: repeatCount,
            ),
            method: method,
            componentNum: componentNum,
            rsvp: rsvp,
            priority: priority,
            name: name,
            location: location,
            percentComplete: percentComplete,
            completed: completed,
            noBlob: noBlob,
            freeBusyActual: FreeBusyStatus.free,
            freeBusy: FreeBusyStatus.free,
            transparency: Transparency.opaque,
            isOrganizer: isOrganizer,
            xUid: xUid,
            uid: uid,
            sequence: sequence,
            dateTime: dateTime,
            calItemId: calItemId,
            deprecatedApptId: deprecatedApptId,
            calItemFolder: calItemFolder,
            status: InviteStatus.completed,
            calClass: InviteClass.public,
            url: url,
            isException: isException,
            recurIdZ: recurIdZ,
            isAllDay: isAllDay,
            isDraft: isDraft,
            neverSent: neverSent,
            changes: changes,
          ),
          emailAddresses: [EmailAddrInfo(address, addressType: AddressType.from, personal: personal)],
          timezones: [
            CalTZInfo(
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
            )
          ],
          fragment: fragment,
        ),
        needCalendarSentByFixup: needCalendarSentByFixup,
        isCalendarForward: isCalendarForward,
        noSaveToSent: noSaveToSent,
        fetchSavedMsg: fetchSavedMsg,
        sendUid: sendUid,
        deliveryReport: deliveryReport,
      );
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'SendMsgRequest': {
            '_jsns': 'urn:zimbraMail',
            'm': {
              'did': draftId,
              'sfd': sendFromDraft,
              'dsId': dataSourceId,
              'aid': attachmentId,
              'origid': origId,
              'rt': ReplyType.replied.name,
              'idnt': identityId,
              'su': subject,
              'header': [
                {
                  'name': name,
                  '_content': value,
                }
              ],
              'irt': inReplyTo,
              'l': folderId,
              'f': flags,
              'content': {'_content': content},
              'mp': {
                'ct': contentType,
                'content': content,
                'ci': contentId,
                'attach': {
                  'aid': attachmentId,
                  'mp': [
                    {
                      'mid': messageId,
                      'part': part,
                      'optional': optional,
                    }
                  ],
                  'm': [
                    {
                      'id': id,
                      'optional': optional,
                    }
                  ],
                  'cn': [
                    {
                      'id': id,
                      'optional': optional,
                    }
                  ],
                  'doc': [
                    {
                      'path': path,
                      'id': id,
                      'ver': version,
                      'optional': optional,
                    }
                  ],
                },
                'mp': [
                  {
                    'ct': contentType,
                    'content': content,
                    'ci': contentId,
                  }
                ],
              },
              'attach': {
                'aid': attachmentId,
                'mp': [
                  {
                    'mid': messageId,
                    'part': part,
                    'optional': optional,
                  }
                ],
                'm': [
                  {
                    'id': id,
                    'optional': optional,
                  }
                ],
                'cn': [
                  {
                    'id': id,
                    'optional': optional,
                  }
                ],
                'doc': [
                  {
                    'path': path,
                    'id': id,
                    'ver': version,
                    'optional': optional,
                  }
                ],
              },
              'inv': {
                'id': id,
                'ct': contentType,
                'ci': contentId,
                'content': {
                  'uid': uid,
                  'summary': summary,
                  '_content': content,
                },
                'comp': {
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
                'mp': [
                  {
                    'ct': contentType,
                    'content': content,
                    'ci': contentId,
                  }
                ],
                'attach': {
                  'aid': attachmentId,
                },
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
                        'd': dateString,
                      },
                      'rel': {
                        'd': dateString,
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
                  'add': [{}],
                  'exclude': [{}],
                  'except': [
                    {
                      'rangeType': recurrenceRangeType,
                      'recurId': recurrenceId,
                      'tz': timezone,
                      'ridZ': recurIdZ,
                      'add': {},
                      'exclude': {},
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
                            'd': dateString,
                            'tz': timezone,
                            'u': utcTime,
                          },
                          'e': {
                            'd': dateString,
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
                        'd': dateString,
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
                  'd': dateString,
                  'tz': timezone,
                  'rangeType': recurrenceRangeType,
                },
                's': {
                  'd': dateString,
                  'tz': timezone,
                  'u': utcTime,
                },
                'e': {
                  'd': dateString,
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
              'e': [
                {
                  'a': address,
                  't': AddressType.from.name,
                  'p': personal,
                }
              ],
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
              'fr': {'_content': fragment},
            },
            'needCalendarSentByFixup': needCalendarSentByFixup,
            'isCalendarForward': isCalendarForward,
            'noSave': noSaveToSent,
            'fetchSavedMsg': fetchSavedMsg,
            'suid': sendUid,
            'deliveryReport': deliveryReport,
          }
        },
      });
    }));

    test('Send msg response', (() {
      final id = faker.guid.guid();
      final imapUid = faker.randomGenerator.integer(100);
      final calendarIntendedFor = faker.lorem.word();
      final origId = faker.guid.guid();
      final identityId = faker.guid.guid();
      final draftAccountId = faker.guid.guid();
      final draftAutoSendTime = faker.randomGenerator.integer(100);
      final sentDate = faker.date.dateTime().millisecondsSinceEpoch;
      final resentDate = faker.date.dateTime().millisecondsSinceEpoch;
      final part = faker.lorem.word();
      final fragment = faker.lorem.word();
      final subject = faker.lorem.word();
      final messageIdHeader = faker.guid.guid();
      final inReplyTo = faker.internet.email();
      final size = faker.randomGenerator.integer(100);
      final date = faker.date.dateTime().millisecondsSinceEpoch;
      final folder = faker.guid.guid();
      final conversationId = faker.guid.guid();
      final flags = faker.lorem.word();
      final tags = faker.lorem.word();
      final tagNames = faker.lorem.word();
      final revision = faker.randomGenerator.integer(100);
      final changeDate = faker.date.dateTime().millisecondsSinceEpoch;
      final modifiedSequence = faker.randomGenerator.integer(100);
      final calItemType = faker.randomGenerator.element(InviteType.values);
      final dateTimeString = faker.date.dateTime().toString();

      final address = faker.internet.email();
      final display = faker.person.name();
      final personal = faker.person.name();
      final addressType = faker.randomGenerator.element(AddressType.values);
      final isGroup = faker.randomGenerator.boolean();
      final canExpandGroupMembers = faker.randomGenerator.boolean();

      final section = faker.lorem.word();
      final name = faker.lorem.word();
      final key = faker.lorem.word();
      final value = faker.lorem.word();
      final description = faker.lorem.word();
      final htmlDescription = faker.lorem.word();
      final summary = faker.lorem.word();
      final binaryB64Data = faker.lorem.word();

      final content = faker.lorem.word();
      final contentType = faker.lorem.word();
      final contentId = faker.guid.guid();
      final attachmentId = faker.guid.guid();
      final messageId = faker.guid.guid();
      final optional = faker.randomGenerator.boolean();
      final path = faker.lorem.word();
      final version = faker.randomGenerator.integer(100);
      final truncatedContent = faker.randomGenerator.boolean();
      final url = faker.internet.httpsUrl();
      final uri = faker.lorem.word();

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
      final recurrenceId = faker.guid.guid();
      final seq = faker.randomGenerator.integer(100);
      final attendee = faker.internet.email();
      final timezone = faker.lorem.word();
      final utcTime = faker.date.dateTime().millisecondsSinceEpoch;
      final recurIdZ = faker.date.dateTime().toString();

      final durationNegative = faker.randomGenerator.boolean();
      final weeks = faker.randomGenerator.integer(100);
      final days = faker.randomGenerator.integer(100);
      final hours = faker.randomGenerator.integer(100);
      final minutes = faker.randomGenerator.integer(100);
      final seconds = faker.randomGenerator.integer(100);
      final related = faker.randomGenerator.element(AlarmRelated.values);
      final repeatCount = faker.randomGenerator.integer(100);

      final displayName = faker.person.name();
      final sentBy = faker.internet.email();
      final dir = faker.lorem.word();
      final language = faker.address.countryCode();
      final cuType = faker.lorem.word();
      final role = faker.lorem.word();
      final member = faker.internet.email();
      final delegatedTo = faker.internet.email();
      final delegatedFrom = faker.internet.email();

      final category = faker.lorem.word();
      final comment = faker.lorem.word();
      final contact = faker.lorem.word();
      final latitude = faker.randomGenerator.decimal().toString();
      final longitude = faker.randomGenerator.decimal().toString();

      final alarmAction = faker.randomGenerator.element(AlarmAction.values);
      final list = faker.randomGenerator.amount((_) => random.integer(10), 10).join(',');
      final ordWk = faker.randomGenerator.integer(100);
      final ival = faker.randomGenerator.integer(100);
      final num = faker.randomGenerator.integer(100);

      final partStat = faker.randomGenerator.element(ParticipationStatus.values);
      final method = faker.lorem.word();
      final componentNum = faker.randomGenerator.integer(100);
      final rsvp = faker.randomGenerator.boolean();
      final priority = faker.randomGenerator.integer(9).toString();
      final location = faker.address.streetAddress();
      final percentComplete = faker.randomGenerator.integer(100).toString();
      final completed = faker.date.dateTime().toString();
      final noBlob = faker.randomGenerator.boolean();
      final isOrganizer = faker.randomGenerator.boolean();
      final xUid = faker.guid.guid();
      final uid = faker.guid.guid();
      final calItemId = faker.guid.guid();
      final deprecatedApptId = faker.guid.guid();
      final sequence = faker.randomGenerator.integer(100);
      final dateTime = faker.randomGenerator.integer(100);
      final calItemFolder = faker.lorem.word();
      final isException = faker.randomGenerator.boolean();
      final isAllDay = faker.randomGenerator.boolean();
      final isDraft = faker.randomGenerator.boolean();
      final neverSent = faker.randomGenerator.boolean();
      final changes = faker.lorem.words(3).join(',');

      final json = {
        'Body': {
          'SendMsgResponse': {
            '_jsns': 'urn:zimbraMail',
            'm': {
              'id': id,
              'i4uid': imapUid,
              'cif': calendarIntendedFor,
              'origid': origId,
              'rt': ReplyType.replied.name,
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
              'irt': {'_content': inReplyTo},
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
                'comp': [
                  {
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
                        'action': alarmAction.name,
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
                          'related': related.name,
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
                  }
                ],
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
                },
              },
              'header': [
                {
                  'n': key,
                  '_content': value,
                }
              ],
              'mp': {
                'ct': contentType,
                'content': content,
                'ci': contentId,
                'attach': {
                  'aid': attachmentId,
                  'mp': [
                    {
                      'mid': messageId,
                      'part': part,
                      'optional': optional,
                    }
                  ],
                  'm': [
                    {
                      'id': id,
                      'optional': optional,
                    }
                  ],
                  'cn': [
                    {
                      'id': id,
                      'optional': optional,
                    }
                  ],
                  'doc': [
                    {
                      'path': path,
                      'id': id,
                      'ver': version,
                      'optional': optional,
                    }
                  ],
                },
                'mp': [
                  {
                    'ct': contentType,
                    'content': content,
                    'ci': contentId,
                  }
                ],
              },
              'shr': {
                'truncated': truncatedContent,
                'content': {'_content': content},
              },
              'dlSubs': {
                'truncated': truncatedContent,
                'content': {'_content': content},
              },
              'content': {
                'url': url,
                '_content': value,
              },
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
              'meta': [
                {
                  'section': section,
                  'a': [
                    {
                      'n': key,
                      '_content': value,
                    }
                  ]
                }
              ],
            },
          }
        }
      };
      final envelope = SendMsgEnvelope.fromJson(json);
      final response = envelope.sendMsgBody.sendMsgResponse!;
      final msg = response.msg!;

      expect(msg.id, id);
      expect(msg.imapUid, imapUid);
      expect(msg.calendarIntendedFor, calendarIntendedFor);
      expect(msg.origId, origId);
      expect(msg.draftReplyType, ReplyType.replied);
      expect(msg.identityId, identityId);
      expect(msg.draftAccountId, draftAccountId);
      expect(msg.draftAutoSendTime, draftAutoSendTime);
      expect(msg.sentDate, sentDate);
      expect(msg.resentDate, resentDate);
      expect(msg.part, part);
      expect(msg.fragment, fragment);
      expect(msg.subject, subject);
      expect(msg.messageIdHeader, messageIdHeader);
      expect(msg.inReplyTo, inReplyTo);
      expect(msg.size, size);
      expect(msg.date, date);
      expect(msg.folder, folder);
      expect(msg.conversationId, conversationId);
      expect(msg.flags, flags);
      expect(msg.tags, tags);
      expect(msg.tagNames, tagNames);
      expect(msg.revision, revision);
      expect(msg.changeDate, changeDate);
      expect(msg.modifiedSequence, modifiedSequence);

      final msgEmail = msg.emails.first;
      expect(msgEmail.address, address);
      expect(msgEmail.display, display);
      expect(msgEmail.personal, personal);
      expect(msgEmail.addressType, addressType);
      expect(msgEmail.isGroup, isGroup);
      expect(msgEmail.canExpandGroupMembers, canExpandGroupMembers);

      final msgHeader = msg.headers.first;
      expect(msgHeader.key, key);
      expect(msgHeader.value, value);

      final msgMimePart = msg.mimePart!;
      expect(msgMimePart.contentType, contentType);
      expect(msgMimePart.content, content);
      expect(msgMimePart.contentId, contentId);

      final msgAttach = msgMimePart.attachments!;
      expect(msgAttach.attachmentId, attachmentId);

      final mpAttach = msgAttach.mpAttachments.first;
      expect(mpAttach.messageId, messageId);
      expect(mpAttach.part, part);
      expect(mpAttach.optional, optional);

      final mAttach = msgAttach.msgAttachments.first;
      expect(mAttach.id, id);
      expect(mAttach.optional, optional);

      final cnAttach = msgAttach.cnAttachments.first;
      expect(cnAttach.id, id);
      expect(cnAttach.optional, optional);

      final doc = msgAttach.docAttachments.first;
      expect(doc.path, path);
      expect(doc.id, id);
      expect(doc.version, version);
      expect(doc.optional, optional);

      final msgShr = msg.shrNotification!;
      expect(msgShr.truncatedContent, truncatedContent);
      expect(msgShr.content, content);

      final msgDlSubs = msg.dlSubsNotification!;
      expect(msgDlSubs.truncatedContent, truncatedContent);
      expect(msgDlSubs.content, content);

      final msgContent = msg.content!;
      expect(msgContent.url, url);
      expect(msgContent.value, value);

      final msgMeta = msg.metadatas.first;
      expect(msgMeta.section, section);
      expect(msgMeta.keyValuePairs.first.key, key);
      expect(msgMeta.keyValuePairs.first.value, value);

      final invite = msg.invite!;
      expect(invite.calItemType, calItemType);

      final inviteTz = invite.timezones.first;
      expect(inviteTz.id, id);
      expect(inviteTz.tzStdOffset, tzStdOffset);
      expect(inviteTz.tzDayOffset, tzDayOffset);
      expect(inviteTz.standardTZName, standardTZName);
      expect(inviteTz.daylightTZName, daylightTZName);

      final inviteTzStandard = inviteTz.standardTzOnset!;
      expect(inviteTzStandard.month, month);
      expect(inviteTzStandard.hour, hour);
      expect(inviteTzStandard.minute, minute);
      expect(inviteTzStandard.second, second);
      expect(inviteTzStandard.dayOfMonth, dayOfMonth);
      expect(inviteTzStandard.week, week);
      expect(inviteTzStandard.dayOfWeek, dayOfWeek);

      final inviteTzDaylight = inviteTz.daylightTzOnset!;
      expect(inviteTzDaylight.month, month);
      expect(inviteTzDaylight.hour, hour);
      expect(inviteTzDaylight.minute, minute);
      expect(inviteTzDaylight.second, second);
      expect(inviteTzDaylight.dayOfMonth, dayOfMonth);
      expect(inviteTzDaylight.week, week);
      expect(inviteTzDaylight.dayOfWeek, dayOfWeek);

      final inviteComp = invite.inviteComponents.first;
      expect(inviteComp.categories.first, category);
      expect(inviteComp.comments.first, comment);
      expect(inviteComp.contacts.first, contact);
      expect(inviteComp.fragment, fragment);
      expect(inviteComp.description, description);
      expect(inviteComp.htmlDescription, htmlDescription);
      expect(inviteComp.method, method);
      expect(inviteComp.componentNum, componentNum);
      expect(inviteComp.rsvp, rsvp);
      expect(inviteComp.priority, priority);
      expect(inviteComp.name, name);
      expect(inviteComp.location, location);
      expect(inviteComp.percentComplete, percentComplete);
      expect(inviteComp.completed, completed);
      expect(inviteComp.noBlob, noBlob);
      expect(inviteComp.freeBusyActual, FreeBusyStatus.free);
      expect(inviteComp.freeBusy, FreeBusyStatus.free);
      expect(inviteComp.transparency, Transparency.opaque);
      expect(inviteComp.isOrganizer, isOrganizer);
      expect(inviteComp.xUid, xUid);
      expect(inviteComp.uid, uid);
      expect(inviteComp.sequence, sequence);
      expect(inviteComp.dateTime, dateTime);
      expect(inviteComp.calItemId, calItemId);
      expect(inviteComp.deprecatedApptId, deprecatedApptId);
      expect(inviteComp.calItemFolder, calItemFolder);
      expect(inviteComp.status, InviteStatus.completed);
      expect(inviteComp.calClass, InviteClass.public);
      expect(inviteComp.url, url);
      expect(inviteComp.isException, isException);
      expect(inviteComp.recurIdZ, recurIdZ);
      expect(inviteComp.isAllDay, isAllDay);
      expect(inviteComp.isDraft, isDraft);
      expect(inviteComp.neverSent, neverSent);
      expect(inviteComp.changes, changes);

      final compGeo = inviteComp.geo!;
      expect(compGeo.latitude, latitude);
      expect(compGeo.longitude, longitude);

      final compAt = inviteComp.attendees.first;
      expect(compAt.address, address);
      expect(compAt.url, url);
      expect(compAt.displayName, displayName);
      expect(compAt.sentBy, sentBy);
      expect(compAt.dir, dir);
      expect(compAt.language, language);
      expect(compAt.cuType, cuType);
      expect(compAt.role, role);
      expect(compAt.partStat, partStat);
      expect(compAt.rsvp, rsvp);
      expect(compAt.member, member);
      expect(compAt.delegatedTo, delegatedTo);
      expect(compAt.delegatedFrom, delegatedFrom);
      expect(compAt.xParams.first.name, name);
      expect(compAt.xParams.first.value, value);

      final alarm = inviteComp.alarms.first;
      expect(alarm.action, alarmAction);
      expect(alarm.description, description);
      expect(alarm.summary, summary);
      expect(alarm.attach!.uri, uri);
      expect(alarm.attach!.contentType, contentType);
      expect(alarm.attach!.binaryB64Data, binaryB64Data);

      final alarmAt = alarm.attendees.first;
      expect(alarmAt.address, address);
      expect(alarmAt.url, url);
      expect(alarmAt.displayName, displayName);
      expect(alarmAt.sentBy, sentBy);
      expect(alarmAt.dir, dir);
      expect(alarmAt.language, language);
      expect(alarmAt.cuType, cuType);
      expect(alarmAt.role, role);
      expect(alarmAt.partStat, partStat);
      expect(alarmAt.rsvp, rsvp);
      expect(alarmAt.member, member);
      expect(alarmAt.delegatedTo, delegatedTo);
      expect(alarmAt.delegatedFrom, delegatedFrom);
      expect(alarmAt.xParams.first.name, name);
      expect(alarmAt.xParams.first.value, value);

      final alarmXProp = alarm.xProps.first;
      expect(alarmXProp.name, name);
      expect(alarmXProp.value, value);
      expect(alarmXProp.xParams.first.name, name);
      expect(alarmXProp.xParams.first.value, value);

      final compXProp = inviteComp.xProps.first;
      expect(compXProp.name, name);
      expect(compXProp.value, value);
      expect(compXProp.xParams.first.name, name);
      expect(compXProp.xParams.first.value, value);

      final organizer = inviteComp.organizer!;
      expect(organizer.address, address);
      expect(organizer.url, url);
      expect(organizer.displayName, displayName);
      expect(organizer.sentBy, sentBy);
      expect(organizer.dir, dir);
      expect(organizer.language, language);
      expect(organizer.xParams.first.name, name);
      expect(organizer.xParams.first.value, value);

      final recurrence = inviteComp.recurrence!;
      expect(recurrence.add.first, isA<AddRecurrenceInfo>());
      expect(recurrence.exclude.first, isA<ExcludeRecurrenceInfo>());

      final except = recurrence.except.first;
      expect(except.recurrenceRangeType, recurrenceRangeType);
      expect(except.recurrenceId, recurrenceId);
      expect(except.timezone, timezone);
      expect(except.recurIdZ, recurIdZ);
      expect(except.add, isA<RecurrenceInfo>());
      expect(except.exclude, isA<RecurrenceInfo>());

      final cancel = recurrence.cancel.first;
      expect(cancel.recurrenceRangeType, recurrenceRangeType);
      expect(cancel.recurrenceId, recurrenceId);
      expect(cancel.timezone, timezone);
      expect(cancel.recurIdZ, recurIdZ);

      final dates = recurrence.dates.first;
      expect(dates.timezone, timezone);

      final startTime = dates.dtVals.first.startTime!;
      expect(startTime.dateTime, dateTimeString);
      expect(startTime.timezone, timezone);
      expect(startTime.utcTime, utcTime);

      final endTime = dates.dtVals.first.endTime!;
      expect(endTime.dateTime, dateTimeString);
      expect(endTime.timezone, timezone);
      expect(endTime.utcTime, utcTime);

      final duration = dates.dtVals.first.duration!;
      expect(duration.durationNegative, durationNegative);
      expect(duration.weeks, weeks);
      expect(duration.days, days);
      expect(duration.hours, hours);
      expect(duration.minutes, minutes);
      expect(duration.seconds, seconds);
      expect(duration.related, AlarmRelated.start);
      expect(duration.repeatCount, repeatCount);

      final simple = recurrence.simple.first;
      expect(simple.until!.dateTime, dateTimeString);
      expect(simple.count!.num, num);
      expect(simple.interval!.ival, ival);
      expect(simple.bySecond!.list, list);
      expect(simple.byMinute!.list, list);
      expect(simple.byHour!.list, list);
      expect(simple.byDay!.days.first.day, WeekDay.sunday);
      expect(simple.byDay!.days.first.ordWk, ordWk);
      expect(simple.byMonthDay!.list, list);
      expect(simple.byYearDay!.list, list);
      expect(simple.byWeekNo!.list, list);
      expect(simple.byMonth!.list, list);
      expect(simple.bySetPose!.list, list);
      expect(simple.weekStart!.day, WeekDay.sunday);
      expect(simple.xNames.first.name, name);
      expect(simple.xNames.first.value, value);

      final exceptionId = inviteComp.exceptionId!;
      expect(exceptionId.dateTime, dateTimeString);
      expect(exceptionId.timezone, timezone);
      expect(exceptionId.recurrenceRangeType, recurrenceRangeType);

      final dtStart = inviteComp.dtStart!;
      expect(dtStart.dateTime, dateTimeString);
      expect(dtStart.timezone, timezone);
      expect(dtStart.utcTime, utcTime);

      final dtEnd = inviteComp.dtEnd!;
      expect(dtEnd.dateTime, dateTimeString);
      expect(dtEnd.timezone, timezone);
      expect(dtEnd.utcTime, utcTime);

      final inviteDuration = inviteComp.duration!;
      expect(inviteDuration.durationNegative, durationNegative);
      expect(inviteDuration.weeks, weeks);
      expect(inviteDuration.days, days);
      expect(inviteDuration.hours, hours);
      expect(inviteDuration.minutes, minutes);
      expect(inviteDuration.seconds, seconds);
      expect(inviteDuration.related, AlarmRelated.start);
      expect(inviteDuration.repeatCount, repeatCount);
    }));
  }));
}
