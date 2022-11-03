import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/address_type.dart';
import 'package:zimbra_api/src/common/enum/alarm_action.dart';
import 'package:zimbra_api/src/common/enum/alarm_related.dart';
import 'package:zimbra_api/src/common/enum/free_busy_status.dart';
import 'package:zimbra_api/src/common/enum/frequency.dart';
import 'package:zimbra_api/src/common/enum/invite_class.dart';
import 'package:zimbra_api/src/common/enum/invite_status.dart';
import 'package:zimbra_api/src/common/enum/participation_status.dart';
import 'package:zimbra_api/src/common/enum/reply_type.dart';
import 'package:zimbra_api/src/common/enum/transparency.dart';
import 'package:zimbra_api/src/common/enum/week_day.dart';
import 'package:zimbra_api/src/common/type/tz_onset_info.dart';
import 'package:zimbra_api/src/mail/message/forward_appointment_invite_envelope.dart';
import 'package:zimbra_api/src/mail/message/forward_appointment_invite_request.dart';
import 'package:zimbra_api/src/mail/message/forward_appointment_invite_response.dart';
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
import 'package:zimbra_api/src/mail/type/msg.dart';
import 'package:zimbra_api/src/mail/type/msg_attach_spec.dart';
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

  group('Forward appointment invite tests', (() {
    test('Forward appointment invite request', (() {
      final id = faker.guid.guid();
      final uid = faker.guid.guid();
      final name = faker.lorem.word();
      final value = faker.lorem.word();

      final dateTimeString = faker.date.dateTime().toString();
      final timezone = faker.lorem.word();
      final utcTime = faker.date.dateTime().millisecond;

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
      final identityId = faker.guid.guid();
      final subject = faker.lorem.word();
      final inReplyTo = faker.internet.email();
      final folderId = faker.guid.guid();
      final flags = faker.lorem.word();
      final summary = faker.lorem.word();
      final content = faker.lorem.word();
      final contentType = faker.lorem.word();
      final contentId = faker.guid.guid();
      final fragment = faker.lorem.word();
      final description = faker.lorem.word();
      final htmlDescription = faker.lorem.word();
      final binaryB64Data = faker.lorem.word();

      final messageId = faker.guid.guid();
      final part = faker.lorem.word();
      final optional = faker.randomGenerator.boolean();
      final path = faker.lorem.word();
      final version = faker.randomGenerator.integer(100);

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
      final sequence = faker.randomGenerator.integer(100);
      final dateTime = faker.randomGenerator.integer(100);
      final calItemId = faker.guid.guid();
      final deprecatedApptId = faker.guid.guid();
      final calItemFolder = faker.lorem.word();
      final url = faker.internet.httpsUrl();
      final uri = faker.internet.uri('http');
      final isException = faker.randomGenerator.boolean();
      final recurIdZ = faker.date.dateTime().toString();
      final isAllDay = faker.randomGenerator.boolean();
      final isDraft = faker.randomGenerator.boolean();
      final neverSent = faker.randomGenerator.boolean();
      final changes = faker.lorem.words(3).join(',');

      final category = faker.lorem.word();
      final comment = faker.lorem.word();
      final contact = faker.lorem.word();
      final latitude = faker.randomGenerator.decimal().toString();
      final longitude = faker.randomGenerator.decimal().toString();

      final address = faker.internet.email();
      final personal = faker.person.name();
      final displayName = faker.person.name();
      final sentBy = faker.internet.email();
      final dir = faker.lorem.word();
      final language = faker.address.countryCode();
      final cuType = faker.lorem.word();
      final role = faker.lorem.word();
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

      final recurrenceRangeType = faker.randomGenerator.integer(3, min: 1);
      final recurrenceId = faker.guid.guid();
      final num = faker.randomGenerator.integer(100);
      final ival = faker.randomGenerator.integer(100);
      final list = faker.randomGenerator.amount((_) => random.integer(10), 10).join(',');
      final ordWk = faker.randomGenerator.integer(100);

      final request = ForwardAppointmentInviteRequest(
        id: id,
        msg: Msg(
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
            mimeParts: [
              MimePartInfo(
                contentType: contentType,
                content: content,
                contentId: contentId,
              )
            ],
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
                trigger: AlarmTriggerInfo(absolute: DateAttr(dateTimeString), relative: DateAttr(dateTimeString)),
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
                    startTime: DtTimeInfo(dateTime: dateTimeString, timezone: timezone, utcTime: utcTime),
                    endTime: DtTimeInfo(dateTime: dateTimeString, timezone: timezone, utcTime: utcTime),
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
                  until: DateTimeStringAttr(dateTimeString),
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
              dateTime: dateTimeString,
              timezone: timezone,
              recurrenceRangeType: recurrenceRangeType,
            ),
            dtStart: DtTimeInfo(dateTime: dateTimeString, timezone: timezone, utcTime: utcTime),
            dtEnd: DtTimeInfo(dateTime: dateTimeString, timezone: timezone, utcTime: utcTime),
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
      );
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'ForwardAppointmentInviteRequest': {
            '_jsns': 'urn:zimbraMail',
            'id': id,
            'm': {
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
          }
        },
      });
    }));

    test('Forward appointment invite response', (() {
      final data = {
        'Body': {
          'ForwardAppointmentInviteResponse': {
            '_jsns': 'urn:zimbraMail',
          }
        }
      };
      final envelope = ForwardAppointmentInviteEnvelope.fromMap(data);
      expect(envelope.forwardAppointmentInviteBody.forwardAppointmentInviteResponse, isNotNull);
      expect(envelope.forwardAppointmentInviteBody.forwardAppointmentInviteResponse,
          isA<ForwardAppointmentInviteResponse>());
    }));
  }));
}
