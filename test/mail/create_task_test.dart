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
import 'package:zimbra_api/src/mail/message/create_task_envelope.dart';
import 'package:zimbra_api/src/mail/message/create_task_request.dart';
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

  group('Create task tests', (() {
    test('Create task request', (() {
      final echo = faker.randomGenerator.boolean();
      final maxSize = faker.randomGenerator.integer(100);
      final wantHtml = faker.randomGenerator.boolean();
      final neuter = faker.randomGenerator.boolean();
      final forceSend = faker.randomGenerator.boolean();

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

      final id = faker.guid.guid();
      final uid = faker.guid.guid();
      final name = faker.lorem.word();
      final value = faker.lorem.word();

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
      final utcTime = faker.date.dateTime().millisecond;

      final durationNegative = faker.randomGenerator.boolean();
      final weeks = faker.randomGenerator.integer(100);
      final days = faker.randomGenerator.integer(100);
      final hours = faker.randomGenerator.integer(100);
      final minutes = faker.randomGenerator.integer(100);
      final seconds = faker.randomGenerator.integer(100);
      final repeatCount = faker.randomGenerator.integer(100);

      final recurrenceRangeType = faker.randomGenerator.integer(3, min: 1);
      final recurrenceId = faker.guid.guid();
      final dateTimeString = faker.date.dateTime().toString();
      final timezone = faker.lorem.word();
      final num = faker.randomGenerator.integer(100);
      final ival = faker.randomGenerator.integer(100);
      final list = faker.randomGenerator.amount((_) => random.integer(10), 10).join(',');
      final ordWk = faker.randomGenerator.integer(100);

      final request = CreateTaskRequest(
        echo: echo,
        maxSize: maxSize,
        wantHtml: wantHtml,
        neuter: neuter,
        forceSend: forceSend,
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
                partStat: ParticipationStatus.accept,
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
                    partStat: ParticipationStatus.accept,
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
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'CreateTaskRequest': {
            '_jsns': 'urn:zimbraMail',
            'echo': echo,
            'max': maxSize,
            'want': wantHtml,
            'neuter': neuter,
            'forcesend': forceSend,
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
                    'ptst': ParticipationStatus.accept.name,
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
                        'ptst': ParticipationStatus.accept.name,
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

    test('Create task response', (() {
      final id = faker.guid.guid();
      final uid = faker.guid.guid();
      final name = faker.lorem.word();
      final key = faker.lorem.word();
      final value = faker.lorem.word();
      final calItemId = faker.guid.guid();
      final deprecatedApptId = faker.guid.guid();
      final calInvId = faker.guid.guid();
      final modifiedSequence = faker.randomGenerator.integer(100);
      final changeDate = faker.date.dateTime().millisecondsSinceEpoch;
      final revision = faker.randomGenerator.integer(100);

      final part = faker.lorem.word();
      final sentDate = faker.date.dateTime().millisecondsSinceEpoch;
      final subject = faker.lorem.word();
      final messageIdHeader = faker.guid.guid();

      final address = faker.internet.email();
      final display = faker.person.name();
      final personal = faker.person.name();
      final isGroup = faker.randomGenerator.boolean();
      final canExpandGroupMembers = faker.randomGenerator.boolean();

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
      final date = faker.date.dateTime().millisecond;
      final attendee = faker.internet.email();
      final sentBy = faker.internet.email();
      final timezone = faker.lorem.word();
      final recurIdZ = faker.date.dateTime().toString();

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

      final content = faker.lorem.word();
      final contentType = faker.lorem.word();
      final contentDisposition = faker.lorem.word();
      final contentFilename = faker.lorem.word();
      final contentId = faker.guid.guid();
      final summary = faker.guid.guid();
      final fragment = faker.lorem.word();
      final description = faker.lorem.word();
      final htmlDescription = faker.lorem.word();
      final binaryB64Data = faker.lorem.word();

      final body = faker.randomGenerator.boolean();
      final truncatedContent = faker.randomGenerator.boolean();
      final size = faker.randomGenerator.integer(100);
      final num = faker.randomGenerator.integer(100);
      final ival = faker.randomGenerator.integer(100);
      final list = faker.randomGenerator.amount((_) => random.integer(10), 10).join(',');
      final ordWk = faker.randomGenerator.integer(100);

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
      final calItemFolder = faker.lorem.word();
      final url = faker.internet.httpsUrl();
      final uri = faker.internet.uri('http');
      final isException = faker.randomGenerator.boolean();
      final isAllDay = faker.randomGenerator.boolean();
      final isDraft = faker.randomGenerator.boolean();
      final neverSent = faker.randomGenerator.boolean();
      final changes = faker.lorem.words(3).join(',');

      final folder = faker.guid.guid();
      final conversationId = faker.guid.guid();
      final flags = faker.lorem.word();
      final tags = faker.lorem.word();
      final tagNames = faker.lorem.word();
      final section = faker.lorem.word();

      final json = {
        'Body': {
          'CreateTaskResponse': {
            '_jsns': 'urn:zimbraMail',
            'calItemId': calItemId,
            'apptId': deprecatedApptId,
            'invId': calInvId,
            'ms': modifiedSequence,
            'rev': revision,
            'm': {'id': id},
            'echo': {
              'm': {
                'id': id,
                'part': part,
                'sd': sentDate,
                'e': [
                  {
                    'a': address,
                    'd': display,
                    'p': personal,
                    't': AddressType.from.name,
                    'isGroup': isGroup,
                    'exp': canExpandGroupMembers,
                  }
                ],
                'su': {'_content': subject},
                'mid': {'_content': messageIdHeader},
                'inv': {
                  'type': InviteType.appt.name,
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
                  'replies': {
                    'reply': [
                      {
                        'rangeType': recurrenceRangeType,
                        'recurId': recurrenceId,
                        'seq': seq,
                        'd': date,
                        'at': attendee,
                        'sentBy': sentBy,
                        'ptst': ParticipationStatus.accept.name,
                        'tz': timezone,
                        'ridZ': recurIdZ,
                      }
                    ],
                  },
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
                          'ptst': ParticipationStatus.accept.name,
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
                              'ptst': ParticipationStatus.accept.name,
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
            },
          }
        }
      };
      final envelope = CreateTaskEnvelope.fromJson(json);
      final response = envelope.createTaskBody.createTaskResponse!;

      expect(response.calItemId, calItemId);
      expect(response.deprecatedApptId, deprecatedApptId);
      expect(response.calInvId, calInvId);
      expect(response.modifiedSequence, modifiedSequence);
      expect(response.msg!.id, id);

      final echo = response.echo!;
      final invite = echo.invite!;

      expect(invite.id, id);
      expect(invite.part, part);
      expect(invite.sentDate, sentDate);
      expect(invite.subject, subject);
      expect(invite.messageIdHeader, messageIdHeader);
      expect(invite.size, size);
      expect(invite.date, date);
      expect(invite.folder, folder);
      expect(invite.conversationId, conversationId);
      expect(invite.flags, flags);
      expect(invite.tags, tags);
      expect(invite.tagNames, tagNames);
      expect(invite.revision, revision);
      expect(invite.changeDate, changeDate);
      expect(invite.modifiedSequence, modifiedSequence);

      final email = invite.emails.first;
      expect(email.address, address);
      expect(email.display, display);
      expect(email.personal, personal);
      expect(email.addressType, AddressType.from);
      expect(email.isGroup, isGroup);
      expect(email.canExpandGroupMembers, canExpandGroupMembers);

      final header = invite.headers.first;
      expect(header.key, key);
      expect(header.value, value);

      final mpContent = invite.mpContentElems.first;
      expect(mpContent.part, part);
      expect(mpContent.contentType, contentType);
      expect(mpContent.size, size);
      expect(mpContent.contentDisposition, contentDisposition);
      expect(mpContent.contentFilename, contentFilename);
      expect(mpContent.contentId, contentId);
      expect(mpContent.location, location);
      expect(mpContent.body, body);
      expect(mpContent.truncatedContent, truncatedContent);
      expect(mpContent.content, content);

      final mimePart = mpContent.mimeParts.first;
      expect(mimePart.part, part);
      expect(mimePart.contentType, contentType);
      expect(mimePart.size, size);
      expect(mimePart.contentDisposition, contentDisposition);
      expect(mimePart.contentFilename, contentFilename);
      expect(mimePart.contentId, contentId);
      expect(mimePart.location, location);
      expect(mimePart.body, body);
      expect(mimePart.truncatedContent, truncatedContent);
      expect(mimePart.content, content);

      final shr = invite.shrContentElems.first;
      expect(shr.truncatedContent, truncatedContent);
      expect(shr.content, content);

      final dlSubs = invite.dlSubsContentElems.first;
      expect(dlSubs.truncatedContent, truncatedContent);
      expect(dlSubs.content, content);

      final inv = invite.invite!;
      expect(inv.calItemType, InviteType.appt);

      final tz = inv.timezones.first;
      expect(tz.id, id);
      expect(tz.tzStdOffset, tzStdOffset);
      expect(tz.tzDayOffset, tzDayOffset);
      expect(tz.standardTZName, standardTZName);
      expect(tz.daylightTZName, daylightTZName);

      final standard = tz.standardTzOnset!;
      expect(standard.month, month);
      expect(standard.hour, hour);
      expect(standard.minute, minute);
      expect(standard.second, second);
      expect(standard.dayOfMonth, dayOfMonth);
      expect(standard.week, week);
      expect(standard.dayOfWeek, dayOfWeek);

      final daylight = tz.daylightTzOnset!;
      expect(daylight.month, month);
      expect(daylight.hour, hour);
      expect(daylight.minute, minute);
      expect(daylight.second, second);
      expect(daylight.dayOfMonth, dayOfMonth);
      expect(daylight.week, week);
      expect(daylight.dayOfWeek, dayOfWeek);

      final reply = inv.calendarReplies.first;
      expect(reply.recurrenceRangeType, recurrenceRangeType);
      expect(reply.recurrenceId, recurrenceId);
      expect(reply.seq, seq);
      expect(reply.date, date);
      expect(reply.attendee, attendee);
      expect(reply.sentBy, sentBy);
      expect(reply.partStat, ParticipationStatus.accept);
      expect(reply.timezone, timezone);
      expect(reply.recurIdZ, recurIdZ);

      final comp = inv.inviteComponents.first;
      expect(comp.method, method);
      expect(comp.componentNum, componentNum);
      expect(comp.rsvp, rsvp);
      expect(comp.priority, priority);
      expect(comp.name, name);
      expect(comp.location, location);
      expect(comp.percentComplete, percentComplete);
      expect(comp.completed, completed);
      expect(comp.noBlob, noBlob);
      expect(comp.freeBusyActual, FreeBusyStatus.free);
      expect(comp.freeBusy, FreeBusyStatus.free);
      expect(comp.transparency, Transparency.opaque);
      expect(comp.isOrganizer, isOrganizer);
      expect(comp.xUid, xUid);
      expect(comp.uid, uid);
      expect(comp.sequence, sequence);
      expect(comp.dateTime, dateTime);
      expect(comp.calItemId, calItemId);
      expect(comp.deprecatedApptId, deprecatedApptId);
      expect(comp.calItemFolder, calItemFolder);
      expect(comp.status, InviteStatus.completed);
      expect(comp.calClass, InviteClass.public);
      expect(comp.url, url);
      expect(comp.isException, isException);
      expect(comp.recurIdZ, recurIdZ);
      expect(comp.isAllDay, isAllDay);
      expect(comp.isDraft, isDraft);
      expect(comp.neverSent, neverSent);
      expect(comp.changes, changes);

      expect(comp.fragment, fragment);
      expect(comp.description, description);
      expect(comp.htmlDescription, htmlDescription);

      expect(comp.categories.first, category);
      expect(comp.comments.first, comment);
      expect(comp.contacts.first, contact);

      final geo = comp.geo!;
      expect(geo.latitude, latitude);
      expect(geo.longitude, longitude);

      final compAt = comp.attendees.first;
      expect(compAt.address, address);
      expect(compAt.url, url);
      expect(compAt.displayName, displayName);
      expect(compAt.sentBy, sentBy);
      expect(compAt.dir, dir);
      expect(compAt.language, language);
      expect(compAt.cuType, cuType);
      expect(compAt.role, role);
      expect(compAt.partStat, ParticipationStatus.accept);
      expect(compAt.rsvp, rsvp);
      expect(compAt.member, member);
      expect(compAt.delegatedTo, delegatedTo);
      expect(compAt.delegatedFrom, delegatedFrom);
      expect(compAt.xParams.first.name, name);
      expect(compAt.xParams.first.value, value);

      final alarm = comp.alarms.first;
      expect(alarm.action, AlarmAction.display);
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
      expect(alarmAt.partStat, ParticipationStatus.accept);
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

      final compXProp = comp.xProps.first;
      expect(compXProp.name, name);
      expect(compXProp.value, value);
      expect(compXProp.xParams.first.name, name);
      expect(compXProp.xParams.first.value, value);

      final organizer = comp.organizer!;
      expect(organizer.address, address);
      expect(organizer.url, url);
      expect(organizer.displayName, displayName);
      expect(organizer.sentBy, sentBy);
      expect(organizer.dir, dir);
      expect(organizer.language, language);
      expect(organizer.xParams.first.name, name);
      expect(organizer.xParams.first.value, value);

      final recurrence = comp.recurrence!;
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

      final exceptionId = comp.exceptionId!;
      expect(exceptionId.dateTime, dateTimeString);
      expect(exceptionId.timezone, timezone);
      expect(exceptionId.recurrenceRangeType, recurrenceRangeType);

      final dtStart = comp.dtStart!;
      expect(dtStart.dateTime, dateTimeString);
      expect(dtStart.timezone, timezone);
      expect(dtStart.utcTime, utcTime);

      final dtEnd = comp.dtEnd!;
      expect(dtEnd.dateTime, dateTimeString);
      expect(dtEnd.timezone, timezone);
      expect(dtEnd.utcTime, utcTime);

      final inviteDuration = comp.duration!;
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
