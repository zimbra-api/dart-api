import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/alarm_action.dart';
import 'package:zimbra_api/src/common/enum/alarm_related.dart';
import 'package:zimbra_api/src/common/enum/free_busy_status.dart';
import 'package:zimbra_api/src/common/enum/invite_class.dart';
import 'package:zimbra_api/src/common/enum/invite_status.dart';
import 'package:zimbra_api/src/common/enum/participation_status.dart';
import 'package:zimbra_api/src/common/enum/transparency.dart';
import 'package:zimbra_api/src/mail/message/get_calendar_item_summaries_envelope.dart';
import 'package:zimbra_api/src/mail/message/get_calendar_item_summaries_request.dart';
import 'package:zimbra_api/src/mail/message/get_calendar_item_summaries_response.dart';
import 'package:zimbra_api/src/mail/type/legacy_calendaring_data.dart';

void main() {
  final faker = Faker();

  group('Get calendar item summaries tests', (() {
    test('Get calendar item summaries request', (() {
      final startTime = faker.date.dateTime().millisecondsSinceEpoch;
      final endTime = faker.date.dateTime().millisecondsSinceEpoch;
      final folderId = faker.guid.guid();

      final request = GetCalendarItemSummariesRequest(startTime, endTime, folderId: folderId);
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'GetCalendarItemSummariesRequest': {
            '_jsns': 'urn:zimbraMail',
            's': startTime,
            'e': endTime,
            'l': folderId,
          }
        },
      });
    }));

    test('Get calendar item summaries response', (() {
      final id = faker.guid.guid();
      final name = faker.lorem.word();
      final value = faker.lorem.word();
      final category = faker.lorem.word();
      final fragment = faker.lorem.word();
      final description = faker.lorem.word();
      final summary = faker.lorem.word();

      final address = faker.internet.email();
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

      final latitude = faker.randomGenerator.decimal().toString();
      final longitude = faker.randomGenerator.decimal().toString();

      final partStat = faker.randomGenerator.element(ParticipationStatus.values);
      final xUid = faker.guid.guid();
      final uid = faker.guid.guid();
      final flags = faker.lorem.word();
      final tags = faker.lorem.word();
      final tagNames = faker.lorem.word();
      final folderId = faker.guid.guid();
      final size = faker.randomGenerator.integer(100);
      final changeDate = faker.date.dateTime().millisecondsSinceEpoch;
      final modifiedSequence = faker.randomGenerator.integer(100);
      final revision = faker.randomGenerator.integer(100);
      final duration = faker.randomGenerator.integer(100);
      final recurIdZ = faker.date.dateTime().toString();
      final tzOffset = faker.randomGenerator.integer(100);
      final taskPercentComplete = faker.lorem.word();
      final isRecurring = faker.randomGenerator.boolean();
      final hasExceptions = faker.randomGenerator.boolean();
      final isException = faker.randomGenerator.boolean();
      final priority = faker.lorem.word();
      final location = faker.lorem.word();
      final hasOtherAttendees = faker.randomGenerator.boolean();
      final hasAlarm = faker.randomGenerator.boolean();
      final isOrganizer = faker.randomGenerator.boolean();
      final invId = faker.randomGenerator.integer(100);
      final componentNum = faker.randomGenerator.integer(100);
      final allDay = faker.randomGenerator.boolean();
      final draft = faker.randomGenerator.boolean();
      final neverSent = faker.randomGenerator.boolean();
      final taskDueDate = faker.randomGenerator.integer(100);
      final taskTzOffsetDue = faker.randomGenerator.integer(100);

      final nextAlarm = faker.date.dateTime().millisecondsSinceEpoch;
      final alarmInstanceStart = faker.date.dateTime().millisecondsSinceEpoch;
      final dateTimeString = faker.date.dateTime().toString();
      final startTime = faker.date.dateTime().millisecondsSinceEpoch;

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

      final data = {
        'Body': {
          'GetCalendarItemSummariesResponse': {
            '_jsns': 'urn:zimbraMail',
            'appt': [
              {
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
                'category': [
                  {'_content': category}
                ],
                'geo': {
                  'lat': latitude,
                  'lon': longitude,
                },
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
                  },
                },
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
                          'value': value,
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
                    'd': duration,
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
              }
            ],
            'task': [
              {
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
          }
        }
      };
      final envelope = GetCalendarItemSummariesEnvelope.fromMap(data);
      final response = envelope.body.response as GetCalendarItemSummariesResponse;

      final appt = response.apptEntries.first;
      expect(appt.fragment, fragment);
      expect(appt.xUid, xUid);
      expect(appt.uid, uid);
      expect(appt.flags, flags);
      expect(appt.tags, tags);
      expect(appt.tagNames, tagNames);
      expect(appt.folderId, folderId);
      expect(appt.size, size);
      expect(appt.changeDate, changeDate);
      expect(appt.modifiedSequence, modifiedSequence);
      expect(appt.revision, revision);
      expect(appt.id, id);
      expect(appt.partStat, partStat);
      expect(appt.recurIdZ, recurIdZ);
      expect(appt.tzOffset, tzOffset);
      expect(appt.freeBusyActual, FreeBusyStatus.free);
      expect(appt.taskPercentComplete, taskPercentComplete);
      expect(appt.isRecurring, isRecurring);
      expect(appt.hasExceptions, hasExceptions);
      expect(appt.priority, priority);
      expect(appt.freeBusyIntended, FreeBusyStatus.free);
      expect(appt.transparency, Transparency.opaque);
      expect(appt.name, name);
      expect(appt.location, location);
      expect(appt.hasOtherAttendees, hasOtherAttendees);
      expect(appt.hasAlarm, hasAlarm);
      expect(appt.isOrganizer, isOrganizer);
      expect(appt.invId, invId.toString());
      expect(appt.componentNum, componentNum);
      expect(appt.status, InviteStatus.completed);
      expect(appt.calClass, InviteClass.public);
      expect(appt.allDay, allDay);
      expect(appt.draft, draft);
      expect(appt.neverSent, neverSent);
      expect(appt.taskDueDate, taskDueDate);
      expect(appt.taskTzOffsetDue, taskTzOffsetDue);
      expect(appt.categories.first, category);

      final or = appt.organizer!;
      expect(or.address, address);
      expect(or.url, url);
      expect(or.displayName, displayName);
      expect(or.sentBy, sentBy);
      expect(or.dir, dir);
      expect(or.language, language);
      expect(or.xParams.first.name, name);
      expect(or.xParams.first.value, value);

      final geo = appt.geo!;
      expect(geo.latitude, latitude);
      expect(geo.longitude, longitude);

      final inst = appt.instances.first;
      expect(inst.startTime, startTime);
      expect(inst.fragment, fragment);
      expect(inst.isException, isException);
      expect(inst.duration, duration);
      expect(inst.partStat, partStat);
      expect(inst.recurIdZ, recurIdZ);
      expect(inst.tzOffset, tzOffset);
      expect(inst.freeBusyActual, FreeBusyStatus.free);
      expect(inst.taskPercentComplete, taskPercentComplete);
      expect(inst.isRecurring, isRecurring);
      expect(inst.hasExceptions, hasExceptions);
      expect(inst.priority, priority);
      expect(inst.freeBusyIntended, FreeBusyStatus.free);
      expect(inst.transparency, Transparency.opaque);
      expect(inst.name, name);
      expect(inst.location, location);
      expect(inst.hasOtherAttendees, hasOtherAttendees);
      expect(inst.hasAlarm, hasAlarm);
      expect(inst.isOrganizer, isOrganizer);
      expect(inst.invId, invId.toString());
      expect(inst.componentNum, componentNum);
      expect(inst.status, InviteStatus.completed);
      expect(inst.calClass, InviteClass.public);
      expect(inst.allDay, allDay);
      expect(inst.draft, draft);
      expect(inst.neverSent, neverSent);
      expect(inst.taskDueDate, taskDueDate);
      expect(inst.taskTzOffsetDue, taskTzOffsetDue);
      expect(inst.categories.first, category);

      final orInst = inst.organizer!;
      expect(orInst.address, address);
      expect(orInst.url, url);
      expect(orInst.displayName, displayName);
      expect(orInst.sentBy, sentBy);
      expect(orInst.dir, dir);
      expect(orInst.language, language);
      expect(orInst.xParams.first.name, name);
      expect(orInst.xParams.first.value, value);

      final geoInst = inst.geo!;
      expect(geoInst.latitude, latitude);
      expect(geoInst.longitude, longitude);

      final alarmData = appt.alarmData!;
      expect(alarmData.nextAlarm, nextAlarm);
      expect(alarmData.alarmInstanceStart, alarmInstanceStart);
      expect(alarmData.invId, invId);
      expect(alarmData.componentNum, componentNum);
      expect(alarmData.name, name);
      expect(alarmData.location, location);

      final alarm = alarmData.alarm!;
      expect(alarm.action, AlarmAction.display);
      expect(alarm.description, description);
      expect(alarm.summary, summary);

      final trigger = alarm.trigger!;
      expect(trigger.absolute!.date, dateTimeString);
      expect(trigger.relative!.date, dateTimeString);

      final repeat = alarm.repeat!;
      expect(repeat.durationNegative, durationNegative);
      expect(repeat.weeks, weeks);
      expect(repeat.days, days);
      expect(repeat.hours, hours);
      expect(repeat.minutes, minutes);
      expect(repeat.seconds, seconds);
      expect(repeat.related, AlarmRelated.start);
      expect(repeat.repeatCount, repeatCount);

      final attach = alarm.attach!;
      expect(attach.uri, uri);
      expect(attach.contentType, contentType);
      expect(attach.binaryB64Data, binaryB64Data);

      final at = alarm.attendees.first;
      expect(at.address, address);
      expect(at.url, url);
      expect(at.displayName, displayName);
      expect(at.sentBy, sentBy);
      expect(at.dir, dir);
      expect(at.language, language);
      expect(at.cuType, cuType);
      expect(at.role, role);
      expect(at.partStat, partStat);
      expect(at.rsvp, rsvp);
      expect(at.member, member);
      expect(at.delegatedTo, delegatedTo);
      expect(at.delegatedFrom, delegatedFrom);
      expect(at.xParams.first.name, name);
      expect(at.xParams.first.value, value);

      final xprop = alarm.xProps.first;
      expect(xprop.name, name);
      expect(xprop.value, value);
      expect(xprop.xParams.first.name, name);
      expect(xprop.xParams.first.value, value);

      final task = response.taskEntries.first;
      expect(task, isA<LegacyCalendaringData>());
      expect(task.xUid, xUid);
      expect(task.uid, uid);
      expect(task.flags, flags);
      expect(task.tags, tags);
      expect(task.tagNames, tagNames);
      expect(task.folderId, folderId);
      expect(task.size, size);
      expect(task.changeDate, changeDate);
      expect(task.modifiedSequence, modifiedSequence);
      expect(task.revision, revision);
      expect(task.id, id);
      expect(task.partStat, partStat);
      expect(task.recurIdZ, recurIdZ);
      expect(task.tzOffset, tzOffset);
      expect(task.freeBusyActual, FreeBusyStatus.free);
      expect(task.taskPercentComplete, taskPercentComplete);
      expect(task.isRecurring, isRecurring);
      expect(task.hasExceptions, hasExceptions);
      expect(task.priority, priority);
      expect(task.freeBusyIntended, FreeBusyStatus.free);
      expect(task.transparency, Transparency.opaque);
      expect(task.name, name);
      expect(task.location, location);
      expect(task.hasOtherAttendees, hasOtherAttendees);
      expect(task.hasAlarm, hasAlarm);
      expect(task.isOrganizer, isOrganizer);
      expect(task.invId, invId.toString());
      expect(task.componentNum, componentNum);
      expect(task.status, InviteStatus.completed);
      expect(task.calClass, InviteClass.public);
      expect(task.allDay, allDay);
      expect(task.draft, draft);
      expect(task.neverSent, neverSent);
      expect(task.taskDueDate, taskDueDate);
      expect(task.taskTzOffsetDue, taskTzOffsetDue);
    }));
  }));
}
