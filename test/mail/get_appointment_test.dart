import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/alarm_action.dart';
import 'package:zimbra_api/src/common/enum/alarm_related.dart';
import 'package:zimbra_api/src/common/enum/free_busy_status.dart';
import 'package:zimbra_api/src/common/enum/frequency.dart';
import 'package:zimbra_api/src/common/enum/invite_class.dart';
import 'package:zimbra_api/src/common/enum/invite_status.dart';
import 'package:zimbra_api/src/common/enum/invite_type.dart';
import 'package:zimbra_api/src/common/enum/participation_status.dart';
import 'package:zimbra_api/src/common/enum/transparency.dart';
import 'package:zimbra_api/src/common/enum/week_day.dart';
import 'package:zimbra_api/src/mail/message/get_appointment_envelope.dart';
import 'package:zimbra_api/src/mail/message/get_appointment_request.dart';
import 'package:zimbra_api/src/mail/type/add_recurrence_info.dart';
import 'package:zimbra_api/src/mail/type/calendar_item_info.dart';
import 'package:zimbra_api/src/mail/type/exclude_recurrence_info.dart';
import 'package:zimbra_api/src/mail/type/recurrence_info.dart';
import 'package:zimbra_api/src/mail/type/task_item_info.dart';

void main() {
  final faker = Faker();

  group('Get appointment tests', (() {
    test('Get appointment request', (() {
      final uid = faker.guid.guid();
      final id = faker.guid.guid();
      final sync = faker.randomGenerator.boolean();
      final includeContent = faker.randomGenerator.boolean();
      final includeInvites = faker.randomGenerator.boolean();

      final request = GetAppointmentRequest(
        uid: uid,
        id: id,
        sync: sync,
        includeContent: includeContent,
        includeInvites: includeInvites,
      );
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'GetAppointmentRequest': {
            '_jsns': 'urn:zimbraMail',
            'uid': uid,
            'id': id,
            'sync': sync,
            'includeContent': includeContent,
            'includeInvites': includeInvites,
          }
        },
      });
    }));

    test('Get appointment response', (() {
      final id = faker.guid.guid();
      final uid = faker.guid.guid();
      final name = faker.lorem.word();
      final key = faker.lorem.word();
      final value = faker.lorem.word();
      final section = faker.lorem.word();

      final flags = faker.lorem.word();
      final tags = faker.lorem.word();
      final tagNames = faker.lorem.word();
      final revision = faker.randomGenerator.integer(100);
      final size = faker.randomGenerator.integer(100);
      final date = faker.date.dateTime().millisecondsSinceEpoch;
      final folder = faker.guid.guid();
      final changeDate = faker.date.dateTime().millisecondsSinceEpoch;
      final modifiedSequence = faker.randomGenerator.integer(100);
      final nextAlarm = faker.date.dateTime().millisecondsSinceEpoch;
      final orphan = faker.randomGenerator.boolean();

      final sequence = faker.randomGenerator.integer(100);
      final componentNum = faker.randomGenerator.integer(100);
      final recurrenceId = faker.date.dateTime().toString();

      final tzStdOffset = faker.randomGenerator.integer(100);
      final tzDayOffset = faker.randomGenerator.integer(100);
      final standardTZName = faker.lorem.word();
      final daylightTZName = faker.lorem.word();

      final recurrenceRangeType = faker.randomGenerator.integer(3, min: 1);
      final attendee = faker.internet.email();
      final sentBy = faker.internet.email();
      final timezone = faker.lorem.word();
      final recurIdZ = faker.date.dateTime().toString();

      final month = faker.date.dateTime().month;
      final hour = faker.date.dateTime().hour;
      final minute = faker.date.dateTime().minute;
      final second = faker.date.dateTime().second;
      final dayOfMonth = faker.randomGenerator.integer(31, min: 1);
      final week = faker.randomGenerator.integer(4, min: 1);
      final dayOfWeek = faker.randomGenerator.integer(7, min: 1);

      final category = faker.lorem.word();
      final comment = faker.lorem.word();
      final contact = faker.lorem.word();
      final latitude = faker.randomGenerator.decimal().toString();
      final longitude = faker.randomGenerator.decimal().toString();

      final address = faker.internet.email();
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
      final fragment = faker.lorem.word();
      final description = faker.lorem.word();
      final htmlDescription = faker.lorem.word();
      final binaryB64Data = faker.lorem.word();

      final num = faker.randomGenerator.integer(100);
      final ival = faker.randomGenerator.integer(100);
      final list = faker.randomGenerator.amount((_) => random.integer(10), 10).join(',');
      final ordWk = faker.randomGenerator.integer(100);

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
      final dateTime = faker.randomGenerator.integer(100);
      final calItemFolder = faker.lorem.word();
      final url = faker.internet.httpsUrl();
      final uri = faker.internet.uri('http');
      final isException = faker.randomGenerator.boolean();
      final isAllDay = faker.randomGenerator.boolean();
      final isDraft = faker.randomGenerator.boolean();
      final neverSent = faker.randomGenerator.boolean();
      final changes = faker.lorem.words(3).join(',');

      final part = faker.lorem.word();
      final contentDisposition = faker.lorem.word();
      final contentFilename = faker.lorem.word();
      final contentId = faker.guid.guid();
      final body = faker.randomGenerator.boolean();
      final truncatedContent = faker.randomGenerator.boolean();

      final json = {
        'Body': {
          'GetAppointmentResponse': {
            '_jsns': 'urn:zimbraMail',
            'appt': {
              'f': flags,
              't': tags,
              'tn': tagNames,
              'uid': uid,
              'id': id,
              'rev': revision,
              's': size,
              'd': date,
              'l': folder,
              'md': changeDate,
              'ms': modifiedSequence,
              'nextAlarm': nextAlarm,
              'orphan': orphan,
              'inv': [
                {
                  'type': InviteType.appt.name,
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
                    'seq': sequence,
                    'd': date,
                    'at': attendee,
                    'sentBy': sentBy,
                    'ptst': ParticipationStatus.accept.name,
                    'tz': timezone,
                    'ridZ': recurIdZ,
                  }
                ]
              },
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
            },
            'task': {
              'f': flags,
              't': tags,
              'tn': tagNames,
              'uid': uid,
              'id': id,
              'rev': revision,
              's': size,
              'd': date,
              'l': folder,
              'md': changeDate,
              'ms': modifiedSequence,
              'nextAlarm': nextAlarm,
              'orphan': orphan,
            },
          }
        }
      };
      final envelope = GetAppointmentEnvelope.fromJson(json);
      final response = envelope.getAppointmentBody.getAppointmentResponse!;
      final appt = response.appt!;

      expect(appt.flags, flags);
      expect(appt.tags, tags);
      expect(appt.tagNames, tagNames);
      expect(appt.uid, uid);
      expect(appt.id, id);
      expect(appt.revision, revision);
      expect(appt.size, size);
      expect(appt.date, date);
      expect(appt.folder, folder);
      expect(appt.changeDate, changeDate);
      expect(appt.modifiedSequence, modifiedSequence);
      expect(appt.nextAlarm, nextAlarm);
      expect(appt.orphan, orphan);

      final inv = appt.invites.first;
      expect(inv.calItemType, InviteType.appt);
      expect(inv.sequence, sequence);
      expect(inv.id, id);
      expect(inv.componentNum, componentNum);
      expect(inv.recurrenceId, recurrenceId);

      final invTz = inv.timezones.first;
      expect(invTz.id, id);
      expect(invTz.tzStdOffset, tzStdOffset);
      expect(invTz.tzDayOffset, tzDayOffset);
      expect(invTz.standardTZName, standardTZName);
      expect(invTz.daylightTZName, daylightTZName);

      final invTzStandard = invTz.standardTzOnset!;
      expect(invTzStandard.month, month);
      expect(invTzStandard.hour, hour);
      expect(invTzStandard.minute, minute);
      expect(invTzStandard.second, second);
      expect(invTzStandard.dayOfMonth, dayOfMonth);
      expect(invTzStandard.week, week);
      expect(invTzStandard.dayOfWeek, dayOfWeek);

      final invTzDaylight = invTz.daylightTzOnset!;
      expect(invTzDaylight.month, month);
      expect(invTzDaylight.hour, hour);
      expect(invTzDaylight.minute, minute);
      expect(invTzDaylight.second, second);
      expect(invTzDaylight.dayOfMonth, dayOfMonth);
      expect(invTzDaylight.week, week);
      expect(invTzDaylight.dayOfWeek, dayOfWeek);

      final partInfo = inv.partInfos.first;
      expect(partInfo.part, part);
      expect(partInfo.contentType, contentType);
      expect(partInfo.size, size);
      expect(partInfo.contentDisposition, contentDisposition);
      expect(partInfo.contentFilename, contentFilename);
      expect(partInfo.contentId, contentId);
      expect(partInfo.location, location);
      expect(partInfo.body, body);
      expect(partInfo.truncatedContent, truncatedContent);
      expect(partInfo.content, content);
      expect(partInfo.body, body);
      final mpPartInfo = partInfo.mimeParts.first;
      expect(mpPartInfo.part, part);
      expect(mpPartInfo.contentType, contentType);
      expect(mpPartInfo.size, size);
      expect(mpPartInfo.contentDisposition, contentDisposition);
      expect(mpPartInfo.contentFilename, contentFilename);
      expect(mpPartInfo.contentId, contentId);
      expect(mpPartInfo.location, location);
      expect(mpPartInfo.body, body);
      expect(mpPartInfo.truncatedContent, truncatedContent);
      expect(mpPartInfo.content, content);
      expect(mpPartInfo.body, body);

      final shr = inv.shareNotifications.first;
      expect(shr.truncatedContent, truncatedContent);
      expect(shr.content, content);

      final dlSubs = inv.dlSubsNotifications.first;
      expect(dlSubs.truncatedContent, truncatedContent);
      expect(dlSubs.content, content);

      final comp = inv.inviteComponent!;
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

      final reply = appt.calendarReplies.first;
      expect(reply.recurrenceRangeType, recurrenceRangeType);
      expect(reply.recurrenceId, recurrenceId);
      expect(reply.seq, sequence);
      expect(reply.date, date);
      expect(reply.attendee, attendee);
      expect(reply.sentBy, sentBy);
      expect(reply.partStat, ParticipationStatus.accept);
      expect(reply.timezone, timezone);
      expect(reply.recurIdZ, recurIdZ);

      final meta = appt.metadatas.first;
      expect(meta.section, section);
      expect(meta.keyValuePairs.first.key, key);
      expect(meta.keyValuePairs.first.value, value);

      final task = response.task!;
      expect(task, isA<TaskItemInfo>());
      expect(task, isA<CalendarItemInfo>());
      expect(task.flags, flags);
      expect(task.tags, tags);
      expect(task.tagNames, tagNames);
      expect(task.uid, uid);
      expect(task.id, id);
      expect(task.revision, revision);
      expect(task.size, size);
      expect(task.date, date);
      expect(task.folder, folder);
      expect(task.changeDate, changeDate);
      expect(task.modifiedSequence, modifiedSequence);
      expect(task.nextAlarm, nextAlarm);
      expect(task.orphan, orphan);
    }));
  }));
}
