import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/alarm_related.dart';
import 'package:zimbra_api/src/common/enum/frequency.dart';
import 'package:zimbra_api/src/common/enum/week_day.dart';
import 'package:zimbra_api/src/mail/message/get_recur_envelope.dart';
import 'package:zimbra_api/src/mail/message/get_recur_request.dart';
import 'package:zimbra_api/src/mail/type/add_recurrence_info.dart';
import 'package:zimbra_api/src/mail/type/exclude_recurrence_info.dart';
import 'package:zimbra_api/src/mail/type/recurrence_info.dart';

void main() {
  final faker = Faker();

  group('Get recurrence tests', (() {
    test('Get recurrence request', (() {
      final id = faker.guid.guid();
      final request = GetRecurRequest(id);
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'GetRecurRequest': {
            '_jsns': 'urn:zimbraMail',
            'id': id,
          }
        },
      });
    }));

    test('Get recurrence resonse', (() {
      final id = faker.guid.guid();
      final name = faker.lorem.word();
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

      final dateTimeString = faker.date.dateTime().toString();
      final timezone = faker.address.countryCode();
      final recurrenceRangeType = faker.randomGenerator.integer(3, min: 1);
      final utcTime = faker.date.dateTime().millisecondsSinceEpoch;
      final recurIdZ = faker.date.dateTime().toString();
      final recurrenceId = faker.date.dateTime().toString();

      final durationNegative = faker.randomGenerator.boolean();
      final weeks = faker.randomGenerator.integer(100);
      final days = faker.randomGenerator.integer(100);
      final hours = faker.randomGenerator.integer(100);
      final minutes = faker.randomGenerator.integer(100);
      final seconds = faker.randomGenerator.integer(100);
      final repeatCount = faker.randomGenerator.integer(100);

      final num = faker.randomGenerator.integer(100);
      final ival = faker.randomGenerator.integer(100);
      final list = faker.randomGenerator.amount((_) => random.integer(10), 10).join(',');
      final ordWk = faker.randomGenerator.integer(100);

      final data = {
        'Body': {
          'GetRecurResponse': {
            '_jsns': 'urn:zimbraMail',
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
            'comp': {
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
            },
            'cancel': {
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
            },
            'except': {
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
            },
          }
        }
      };
      final envelope = GetRecurEnvelope.fromMap(data);
      final response = envelope.getRecurBody.getRecurResponse!;

      final tz = response.timezone!;
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

      final inviteComponent = response.inviteComponent!;

      final exceptionId = inviteComponent.exceptionId!;
      expect(exceptionId.dateTime, dateTimeString);
      expect(exceptionId.timezone, timezone);
      expect(exceptionId.recurrenceRangeType, recurrenceRangeType);

      final inviteDtStart = inviteComponent.dtStart!;
      expect(inviteDtStart.dateTime, dateTimeString);
      expect(inviteDtStart.timezone, timezone);
      expect(inviteDtStart.utcTime, utcTime);

      final inviteDtEnd = inviteComponent.dtEnd!;
      expect(inviteDtEnd.dateTime, dateTimeString);
      expect(inviteDtEnd.timezone, timezone);
      expect(inviteDtEnd.utcTime, utcTime);

      final inviteDuration = inviteComponent.duration!;
      expect(inviteDuration.durationNegative, durationNegative);
      expect(inviteDuration.weeks, weeks);
      expect(inviteDuration.days, days);
      expect(inviteDuration.hours, hours);
      expect(inviteDuration.minutes, minutes);
      expect(inviteDuration.seconds, seconds);
      expect(inviteDuration.related, AlarmRelated.start);
      expect(inviteDuration.repeatCount, repeatCount);

      final inviteRecurrence = inviteComponent.recurrence!;
      expect(inviteRecurrence.add.first, isA<AddRecurrenceInfo>());
      expect(inviteRecurrence.exclude.first, isA<ExcludeRecurrenceInfo>());

      final inviteExcept = inviteRecurrence.except.first;
      expect(inviteExcept.recurrenceRangeType, recurrenceRangeType);
      expect(inviteExcept.recurrenceId, recurrenceId);
      expect(inviteExcept.timezone, timezone);
      expect(inviteExcept.recurIdZ, recurIdZ);
      expect(inviteExcept.add, isA<RecurrenceInfo>());
      expect(inviteExcept.exclude, isA<RecurrenceInfo>());

      final inviteCancel = inviteRecurrence.cancel.first;
      expect(inviteCancel.recurrenceRangeType, recurrenceRangeType);
      expect(inviteCancel.recurrenceId, recurrenceId);
      expect(inviteCancel.timezone, timezone);
      expect(inviteCancel.recurIdZ, recurIdZ);

      final inviteDates = inviteRecurrence.dates.first;
      expect(inviteDates.timezone, timezone);

      final inviteDateStartTime = inviteDates.dtVals.first.startTime!;
      expect(inviteDateStartTime.dateTime, dateTimeString);
      expect(inviteDateStartTime.timezone, timezone);
      expect(inviteDateStartTime.utcTime, utcTime);

      final inviteDateEndTime = inviteDates.dtVals.first.endTime!;
      expect(inviteDateEndTime.dateTime, dateTimeString);
      expect(inviteDateEndTime.timezone, timezone);
      expect(inviteDateEndTime.utcTime, utcTime);

      final inviteDateDuration = inviteDates.dtVals.first.duration!;
      expect(inviteDateDuration.durationNegative, durationNegative);
      expect(inviteDateDuration.weeks, weeks);
      expect(inviteDateDuration.days, days);
      expect(inviteDateDuration.hours, hours);
      expect(inviteDateDuration.minutes, minutes);
      expect(inviteDateDuration.seconds, seconds);
      expect(inviteDateDuration.related, AlarmRelated.start);
      expect(inviteDateDuration.repeatCount, repeatCount);

      final inviteSimple = inviteRecurrence.simple.first;
      expect(inviteSimple.until!.dateTime, dateTimeString);
      expect(inviteSimple.count!.num, num);
      expect(inviteSimple.interval!.ival, ival);
      expect(inviteSimple.bySecond!.list, list);
      expect(inviteSimple.byMinute!.list, list);
      expect(inviteSimple.byHour!.list, list);
      expect(inviteSimple.byDay!.days.first.day, WeekDay.sunday);
      expect(inviteSimple.byDay!.days.first.ordWk, ordWk);
      expect(inviteSimple.byMonthDay!.list, list);
      expect(inviteSimple.byYearDay!.list, list);
      expect(inviteSimple.byWeekNo!.list, list);
      expect(inviteSimple.byMonth!.list, list);
      expect(inviteSimple.bySetPose!.list, list);
      expect(inviteSimple.weekStart!.day, WeekDay.sunday);
      expect(inviteSimple.xNames.first.name, name);
      expect(inviteSimple.xNames.first.value, value);

      final cancelComponent = response.cancelComponent!;
      final cancelDtStart = cancelComponent.dtStart!;
      expect(cancelDtStart.dateTime, dateTimeString);
      expect(cancelDtStart.timezone, timezone);
      expect(cancelDtStart.utcTime, utcTime);

      final cancelDtEnd = cancelComponent.dtEnd!;
      expect(cancelDtEnd.dateTime, dateTimeString);
      expect(cancelDtEnd.timezone, timezone);
      expect(cancelDtEnd.utcTime, utcTime);

      final exceptComponent = response.exceptComponent!;
      final exceptDtStart = exceptComponent.dtStart!;
      expect(exceptDtStart.dateTime, dateTimeString);
      expect(exceptDtStart.timezone, timezone);
      expect(exceptDtStart.utcTime, utcTime);

      final exceptDtEnd = exceptComponent.dtEnd!;
      expect(exceptDtEnd.dateTime, dateTimeString);
      expect(exceptDtEnd.timezone, timezone);
      expect(exceptDtEnd.utcTime, utcTime);
    }));
  }));
}
