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
import 'package:zimbra_api/src/common/enum/transparency.dart';
import 'package:zimbra_api/src/common/enum/week_day.dart';
import 'package:zimbra_api/src/mail/message/add_msg_envelope.dart';
import 'package:zimbra_api/src/mail/message/add_msg_request.dart';
import 'package:zimbra_api/src/mail/type/add_msg_spec.dart';
import 'package:zimbra_api/src/mail/type/add_recurrence_info.dart';
import 'package:zimbra_api/src/mail/type/exclude_recurrence_info.dart';
import 'package:zimbra_api/src/mail/type/recurrence_info.dart';

void main() {
  final faker = Faker();

  group('Add msg tests', (() {
    test('Add msg request', (() {
      final flags = faker.lorem.word();
      final tags = faker.lorem.word();
      final tagNames = faker.lorem.word();
      final folder = faker.guid.guid();
      final noICal = faker.randomGenerator.boolean();
      final dateReceived = faker.randomGenerator.integer(100);
      final attachmentId = faker.guid.guid();
      final content = faker.lorem.word();
      final filterSent = faker.randomGenerator.boolean();

      final request = AddMsgRequest(
          AddMsgSpec(
              flags: flags,
              tags: tags,
              tagNames: tagNames,
              folder: folder,
              noICal: noICal,
              dateReceived: dateReceived,
              attachmentId: attachmentId,
              content: content),
          filterSent: filterSent);
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'AddMsgRequest': {
            '_jsns': 'urn:zimbraMail',
            'm': {
              'f': flags,
              't': tags,
              'tn': tagNames,
              'l': folder,
              'noICal': noICal,
              'd': dateReceived,
              'aid': attachmentId,
              'content': {'_content': content},
            },
            'filterSent': filterSent,
          }
        },
      });
    }));

    test('Add msg response', (() {
      final id = faker.guid.guid();
      final autoSendTime = faker.randomGenerator.integer(100);
      final subject = faker.lorem.word();
      final fragment = faker.lorem.word();
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

      final address = faker.internet.email();
      final display = faker.person.name();
      final personal = faker.internet.userName();
      final isGroup = faker.randomGenerator.boolean();
      final canExpandGroupMembers = faker.randomGenerator.boolean();

      final section = faker.lorem.word();
      final name = faker.lorem.word();
      final key = faker.lorem.word();
      final value = faker.lorem.word();

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
      final dateString = faker.date.dateTime().toString();
      final utcTime = faker.date.dateTime().toUtc().millisecond;

      final durationNegative = faker.randomGenerator.boolean();
      final weeks = faker.randomGenerator.integer(100);
      final days = faker.randomGenerator.integer(100);
      final hours = faker.randomGenerator.integer(100);
      final minutes = faker.randomGenerator.integer(100);
      final seconds = faker.randomGenerator.integer(100);
      final repeatCount = faker.randomGenerator.integer(100);

      final uri = faker.internet.uri('http');
      final contentType = faker.lorem.word();
      final binaryB64Data = faker.lorem.word();

      final recurrenceRangeType = faker.randomGenerator.integer(3, min: 1);
      final recurrenceId = faker.guid.guid();
      final timezone = faker.lorem.word();
      final recurIdZ = faker.date.dateTime().toString();
      final seq = faker.randomGenerator.integer(100);
      final attendee = faker.internet.email();
      final sentBy = faker.internet.email();

      final num = faker.randomGenerator.integer(100);
      final ival = faker.randomGenerator.integer(100);
      final list = faker.randomGenerator.amount((_) => random.integer(10), 10).join(',');
      final ordWk = faker.randomGenerator.integer(100);

      final category = faker.lorem.word();
      final comment = faker.lorem.word();
      final contact = faker.internet.email();

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

      final partStat = faker.randomGenerator.element(ParticipationStatus.values);
      final summary = faker.lorem.word();
      final description = faker.lorem.word();
      final htmlDescription = faker.lorem.word();
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
      final sequence = faker.randomGenerator.integer(100);
      final dateTime = faker.randomGenerator.integer(100);
      final calItemId = faker.guid.guid();
      final deprecatedApptId = faker.guid.guid();
      final calItemFolder = faker.lorem.word();
      final isException = faker.randomGenerator.boolean();
      final url = faker.internet.httpsUrl();
      final isAllDay = faker.randomGenerator.boolean();
      final isDraft = faker.randomGenerator.boolean();
      final neverSent = faker.randomGenerator.boolean();
      final changes = faker.lorem.words(3).join(',');

      final json = {
        'Body': {
          'AddMsgResponse': {
            '_jsns': 'urn:zimbraAccount',
            'message': {
              'id': id,
              'autoSendTime': autoSendTime,
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
              'fr': {'_content': fragment},
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
                  ],
                }
              ],
            },
            'chat': {
              'id': id,
              'autoSendTime': autoSendTime,
              'su': {'_content': subject},
              'fr': {'_content': fragment},
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
            },
          }
        }
      };
      final envelope = AddMsgEnvelope.fromJson(json);
      final response = envelope.addMsgBody.addMsgResponse!;
      final chatMessage = response.chatMessage!;
      final message = response.message!;

      expect(chatMessage.id, id);
      expect(chatMessage.autoSendTime, autoSendTime);
      expect(chatMessage.subject, subject);
      expect(chatMessage.fragment, fragment);
      expect(chatMessage.size, size);
      expect(chatMessage.date, date);
      expect(chatMessage.folder, folder);
      expect(chatMessage.conversationId, conversationId);
      expect(chatMessage.flags, flags);
      expect(chatMessage.tags, tags);
      expect(chatMessage.tagNames, tagNames);
      expect(chatMessage.revision, revision);
      expect(chatMessage.changeDate, changeDate);
      expect(chatMessage.modifiedSequence, modifiedSequence);

      expect(message.id, id);
      expect(message.autoSendTime, autoSendTime);
      expect(message.subject, subject);
      expect(message.fragment, fragment);
      expect(message.size, size);
      expect(message.date, date);
      expect(message.folder, folder);
      expect(message.conversationId, conversationId);
      expect(message.flags, flags);
      expect(message.tags, tags);
      expect(message.tagNames, tagNames);
      expect(message.revision, revision);
      expect(message.changeDate, changeDate);
      expect(message.modifiedSequence, modifiedSequence);

      final email = message.emails.first;
      expect(email.address, address);
      expect(email.display, display);
      expect(email.personal, personal);
      expect(email.addressType, AddressType.from);
      expect(email.isGroup, isGroup);
      expect(email.canExpandGroupMembers, canExpandGroupMembers);

      final meta = message.metadatas.first;
      expect(meta.section, section);
      expect(meta.keyValuePairs.first.key, key);
      expect(meta.keyValuePairs.first.value, value);

      final invite = message.invite!;
      expect(invite.calItemType, InviteType.appt);

      final tz = invite.timezones.first;
      expect(tz.id, id);
      expect(tz.tzStdOffset, tzStdOffset);
      expect(tz.tzDayOffset, tzDayOffset);
      expect(tz.standardTZName, standardTZName);
      expect(tz.daylightTZName, daylightTZName);

      final standardTzOnset = tz.standardTzOnset!;
      expect(standardTzOnset.month, month);
      expect(standardTzOnset.hour, hour);
      expect(standardTzOnset.minute, minute);
      expect(standardTzOnset.second, second);
      expect(standardTzOnset.dayOfMonth, dayOfMonth);
      expect(standardTzOnset.week, week);
      expect(standardTzOnset.dayOfWeek, dayOfWeek);

      final daylightTzOnset = tz.daylightTzOnset!;
      expect(daylightTzOnset.month, month);
      expect(daylightTzOnset.hour, hour);
      expect(daylightTzOnset.minute, minute);
      expect(daylightTzOnset.second, second);
      expect(daylightTzOnset.dayOfMonth, dayOfMonth);
      expect(daylightTzOnset.week, week);
      expect(daylightTzOnset.dayOfWeek, dayOfWeek);

      final reply = invite.calendarReplies.first;
      expect(reply.recurrenceRangeType, recurrenceRangeType);
      expect(reply.recurrenceId, recurrenceId);
      expect(reply.seq, seq);
      expect(reply.date, date);
      expect(reply.attendee, attendee);
      expect(reply.sentBy, sentBy);
      expect(reply.partStat, partStat);
      expect(reply.timezone, timezone);
      expect(reply.recurIdZ, recurIdZ);

      final inviteComponent = invite.inviteComponent!;

      expect(inviteComponent.method, method);
      expect(inviteComponent.componentNum, componentNum);
      expect(inviteComponent.rsvp, rsvp);
      expect(inviteComponent.priority, priority);
      expect(inviteComponent.name, name);
      expect(inviteComponent.location, location);
      expect(inviteComponent.percentComplete, percentComplete);
      expect(inviteComponent.completed, completed);
      expect(inviteComponent.noBlob, noBlob);
      expect(inviteComponent.freeBusyActual, FreeBusyStatus.free);
      expect(inviteComponent.freeBusy, FreeBusyStatus.free);
      expect(inviteComponent.transparency, Transparency.opaque);
      expect(inviteComponent.isOrganizer, isOrganizer);
      expect(inviteComponent.xUid, xUid);
      expect(inviteComponent.uid, uid);
      expect(inviteComponent.sequence, sequence);
      expect(inviteComponent.dateTime, dateTime);
      expect(inviteComponent.calItemId, calItemId);
      expect(inviteComponent.deprecatedApptId, deprecatedApptId);
      expect(inviteComponent.calItemFolder, calItemFolder);
      expect(inviteComponent.status, InviteStatus.completed);
      expect(inviteComponent.calClass, InviteClass.public);
      expect(inviteComponent.url, url);
      expect(inviteComponent.isException, isException);
      expect(inviteComponent.recurIdZ, recurIdZ);
      expect(inviteComponent.isAllDay, isAllDay);
      expect(inviteComponent.isDraft, isDraft);
      expect(inviteComponent.neverSent, neverSent);
      expect(inviteComponent.changes, changes);

      expect(inviteComponent.fragment, fragment);
      expect(inviteComponent.description, description);
      expect(inviteComponent.htmlDescription, htmlDescription);

      expect(inviteComponent.categories.first, category);
      expect(inviteComponent.comments.first, comment);
      expect(inviteComponent.contacts.first, contact);

      final geo = inviteComponent.geo!;
      expect(geo.latitude, latitude);
      expect(geo.longitude, longitude);

      final inviteAt = inviteComponent.attendees.first;
      expect(inviteAt.address, address);
      expect(inviteAt.url, url);
      expect(inviteAt.displayName, displayName);
      expect(inviteAt.sentBy, sentBy);
      expect(inviteAt.dir, dir);
      expect(inviteAt.language, language);
      expect(inviteAt.cuType, cuType);
      expect(inviteAt.role, role);
      expect(inviteAt.partStat, partStat);
      expect(inviteAt.rsvp, rsvp);
      expect(inviteAt.member, member);
      expect(inviteAt.delegatedTo, delegatedTo);
      expect(inviteAt.delegatedFrom, delegatedFrom);
      expect(inviteAt.xParams.first.name, name);
      expect(inviteAt.xParams.first.value, value);

      final alarm = inviteComponent.alarms.first;
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

      final inviteXProp = inviteComponent.xProps.first;
      expect(inviteXProp.name, name);
      expect(inviteXProp.value, value);
      expect(inviteXProp.xParams.first.name, name);
      expect(inviteXProp.xParams.first.value, value);

      final organizer = inviteComponent.organizer!;
      expect(organizer.address, address);
      expect(organizer.url, url);
      expect(organizer.displayName, displayName);
      expect(organizer.sentBy, sentBy);
      expect(organizer.dir, dir);
      expect(organizer.language, language);
      expect(organizer.xParams.first.name, name);
      expect(organizer.xParams.first.value, value);

      final recurrence = inviteComponent.recurrence!;
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
      expect(startTime.dateTime, dateString);
      expect(startTime.timezone, timezone);
      expect(startTime.utcTime, utcTime);

      final endTime = dates.dtVals.first.endTime!;
      expect(endTime.dateTime, dateString);
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
      expect(simple.until!.dateTime, dateString);
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

      final exceptionId = inviteComponent.exceptionId!;
      expect(exceptionId.dateTime, dateString);
      expect(exceptionId.timezone, timezone);
      expect(exceptionId.recurrenceRangeType, recurrenceRangeType);

      final dtStart = inviteComponent.dtStart!;
      expect(dtStart.dateTime, dateString);
      expect(dtStart.timezone, timezone);
      expect(dtStart.utcTime, utcTime);

      final dtEnd = inviteComponent.dtEnd!;
      expect(dtEnd.dateTime, dateString);
      expect(dtEnd.timezone, timezone);
      expect(dtEnd.utcTime, utcTime);

      final inviteDuration = inviteComponent.duration!;
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
