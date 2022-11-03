import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/alarm_action.dart';
import 'package:zimbra_api/src/common/enum/alarm_related.dart';
import 'package:zimbra_api/src/common/enum/participation_status.dart';
import 'package:zimbra_api/src/mail/message/dismiss_calendar_item_alarm_envelope.dart';
import 'package:zimbra_api/src/mail/message/dismiss_calendar_item_alarm_request.dart';
import 'package:zimbra_api/src/mail/message/dismiss_calendar_item_alarm_response.dart';
import 'package:zimbra_api/src/mail/type/dismiss_alarm.dart';
import 'package:zimbra_api/src/mail/type/updated_alarm_info.dart';

void main() {
  final faker = Faker();

  group('Dismiss calendar item alarm tests', (() {
    test('Dismiss calendar item alarm request', (() {
      final id = faker.guid.guid();
      final dismissedAt = faker.date.dateTime().millisecond;

      final request = DismissCalendarItemAlarmRequest(
        apptAlarms: [DismissAlarm(id, dismissedAt)],
        taskAlarms: [DismissAlarm(id, dismissedAt)],
      );
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'DismissCalendarItemAlarmRequest': {
            '_jsns': 'urn:zimbraMail',
            'appt': [
              {
                'id': id,
                'dismissedAt': dismissedAt,
              }
            ],
            'task': [
              {
                'id': id,
                'dismissedAt': dismissedAt,
              }
            ],
          }
        },
      });
    }));

    test('Dismiss calendar item alarm response', (() {
      final calItemId = faker.guid.guid();
      final nextAlarm = faker.randomGenerator.integer(100);
      final alarmInstanceStart = faker.randomGenerator.integer(100);
      final invId = faker.randomGenerator.integer(100);
      final componentNum = faker.randomGenerator.integer(100);
      final name = faker.lorem.word();
      final value = faker.lorem.word();
      final location = faker.lorem.word();

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
      final dateString = faker.date.dateTime().toString();
      final description = faker.lorem.word();
      final summary = faker.lorem.word();

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
          'DismissCalendarItemAlarmResponse': {
            '_jsns': 'urn:zimbraMail',
            'appt': [
              {
                'calItemId': calItemId,
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
                  },
                },
              }
            ],
            'task': [
              {
                'calItemId': calItemId,
              }
            ],
          }
        }
      };
      final envelope = DismissCalendarItemAlarmEnvelope.fromMap(data);
      final response = envelope.body.response as DismissCalendarItemAlarmResponse;

      final appt = response.apptUpdatedAlarms.first;
      expect(appt.calItemId, calItemId);

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
      final absolute = trigger.absolute!;
      final relative = trigger.relative!;
      expect(absolute.date, dateString);
      expect(relative.date, dateString);

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

      final attendee = alarm.attendees.first;
      expect(attendee.address, address);
      expect(attendee.url, url);
      expect(attendee.displayName, displayName);
      expect(attendee.sentBy, sentBy);
      expect(attendee.dir, dir);
      expect(attendee.language, language);
      expect(attendee.cuType, cuType);
      expect(attendee.role, role);
      expect(attendee.partStat, ParticipationStatus.accept);
      expect(attendee.rsvp, rsvp);
      expect(attendee.member, member);
      expect(attendee.delegatedTo, delegatedTo);
      expect(attendee.delegatedFrom, delegatedFrom);
      expect(attendee.xParams.first.name, name);
      expect(attendee.xParams.first.value, value);

      final xprop = alarm.xProps.first;
      expect(xprop.name, name);
      expect(xprop.value, value);
      expect(xprop.xParams.first.name, name);
      expect(xprop.xParams.first.value, value);

      final task = response.taskUpdatedAlarms.first;
      expect(task.calItemId, calItemId);
      expect(task, isA<UpdatedAlarmInfo>());
    }));
  }));
}
