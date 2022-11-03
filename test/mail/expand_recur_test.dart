import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/alarm_related.dart';
import 'package:zimbra_api/src/common/enum/frequency.dart';
import 'package:zimbra_api/src/common/enum/recurrence_range.dart';
import 'package:zimbra_api/src/common/enum/week_day.dart';
import 'package:zimbra_api/src/common/type/tz_onset_info.dart';
import 'package:zimbra_api/src/mail/message/expand_recur_envelope.dart';
import 'package:zimbra_api/src/mail/message/expand_recur_request.dart';
import 'package:zimbra_api/src/mail/message/expand_recur_response.dart';
import 'package:zimbra_api/src/mail/type/add_recurrence_info.dart';
import 'package:zimbra_api/src/mail/type/by_day_rule.dart';
import 'package:zimbra_api/src/mail/type/by_hour_rule.dart';
import 'package:zimbra_api/src/mail/type/by_minute_rule.dart';
import 'package:zimbra_api/src/mail/type/by_month_day_rule.dart';
import 'package:zimbra_api/src/mail/type/by_month_rule.dart';
import 'package:zimbra_api/src/mail/type/by_second_rule.dart';
import 'package:zimbra_api/src/mail/type/by_set_pos_rule.dart';
import 'package:zimbra_api/src/mail/type/by_week_no_rule.dart';
import 'package:zimbra_api/src/mail/type/by_year_day_rule.dart';
import 'package:zimbra_api/src/mail/type/cal_tz_info.dart';
import 'package:zimbra_api/src/mail/type/cancel_rule_info.dart';
import 'package:zimbra_api/src/mail/type/date_time_string_attr.dart';
import 'package:zimbra_api/src/mail/type/dt_time_info.dart';
import 'package:zimbra_api/src/mail/type/dt_val.dart';
import 'package:zimbra_api/src/mail/type/duration_info.dart';
import 'package:zimbra_api/src/mail/type/exception_rule_info.dart';
import 'package:zimbra_api/src/mail/type/exclude_recurrence_info.dart';
import 'package:zimbra_api/src/mail/type/expanded_recurrence_cancel.dart';
import 'package:zimbra_api/src/mail/type/expanded_recurrence_exception.dart';
import 'package:zimbra_api/src/mail/type/expanded_recurrence_invite.dart';
import 'package:zimbra_api/src/mail/type/instance_recur_id_info.dart';
import 'package:zimbra_api/src/mail/type/interval_rule.dart';
import 'package:zimbra_api/src/mail/type/num_attr.dart';
import 'package:zimbra_api/src/mail/type/recurrence_info.dart';
import 'package:zimbra_api/src/mail/type/simple_repeating_rule.dart';
import 'package:zimbra_api/src/mail/type/single_dates.dart';
import 'package:zimbra_api/src/mail/type/wk_day.dart';
import 'package:zimbra_api/src/mail/type/wkst_rule.dart';
import 'package:zimbra_api/src/mail/type/xname_rule.dart';

void main() {
  final faker = Faker();

  group('Expand recurrences tests', (() {
    test('Expand recurrences request', (() {
      final id = faker.guid.guid();
      final name = faker.lorem.word();
      final value = faker.lorem.word();
      final startTime = faker.date.dateTime().millisecondsSinceEpoch;
      final endTime = faker.date.dateTime().millisecondsSinceEpoch;

      final tzStdOffset = faker.date.dateTime().minute;
      final tzDayOffset = faker.date.dateTime().minute;
      final standardTZName = faker.lorem.word();
      final daylightTZName = faker.lorem.word();

      final month = faker.date.dateTime().month;
      final hour = faker.date.dateTime().hour;
      final minute = faker.date.dateTime().minute;
      final second = faker.date.dateTime().second;
      final dayOfMonth = faker.randomGenerator.integer(31, min: 1);
      final week = faker.randomGenerator.integer(4, min: 1);
      final dayOfWeek = faker.randomGenerator.integer(7, min: 1);

      final durationNegative = faker.randomGenerator.boolean();
      final weeks = faker.randomGenerator.integer(100);
      final days = faker.randomGenerator.integer(100);
      final hours = faker.randomGenerator.integer(100);
      final minutes = faker.randomGenerator.integer(100);
      final seconds = faker.randomGenerator.integer(100);
      final repeatCount = faker.randomGenerator.integer(100);

      final dateTimeString = faker.date.dateTime().toString();
      final timezone = faker.lorem.word();
      final recurIdZ = faker.date.dateTime().toString();
      final utcTime = faker.date.dateTime().millisecond;

      final recurrenceRangeType = faker.randomGenerator.integer(3, min: 1);
      final recurrenceId = faker.guid.guid();
      final num = faker.randomGenerator.integer(100);
      final ival = faker.randomGenerator.integer(100);
      final list = faker.randomGenerator.amount((_) => random.integer(10), 10).join(',');
      final ordWk = faker.randomGenerator.integer(100);

      final request = ExpandRecurRequest(
        startTime,
        endTime,
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
        cancelComponents: [
          ExpandedRecurrenceCancel(
            exceptionId: InstanceRecurIdInfo(
              range: RecurrenceRange.thisAndFuture,
              dateTime: dateTimeString,
              timezone: timezone,
            ),
            startTime: startTime,
            endTime: endTime,
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
              cancel: [
                CancelRuleInfo(
                  recurrenceRangeType,
                  recurrenceId,
                  timezone: timezone,
                  recurIdZ: recurIdZ,
                )
              ],
              dates: [
                SingleDates(
                  timezone: timezone,
                  dtVals: [
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
                  ],
                )
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
                )
              ],
            ),
          )
        ],
        inviteComponents: [
          ExpandedRecurrenceInvite(
            exceptionId: InstanceRecurIdInfo(
              range: RecurrenceRange.thisAndFuture,
              dateTime: dateTimeString,
              timezone: timezone,
            ),
            startTime: startTime,
            endTime: endTime,
          )
        ],
        exceptComponents: [
          ExpandedRecurrenceException(
            exceptionId: InstanceRecurIdInfo(
              range: RecurrenceRange.thisAndFuture,
              dateTime: dateTimeString,
              timezone: timezone,
            ),
            startTime: startTime,
            endTime: endTime,
          )
        ],
      );
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'ExpandRecurRequest': {
            '_jsns': 'urn:zimbraMail',
            's': startTime,
            'e': endTime,
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
            'cancel': [
              {
                'exceptId': {
                  'range': RecurrenceRange.thisAndFuture.name,
                  'd': dateTimeString,
                  'tz': timezone,
                },
                's': startTime,
                'e': endTime,
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
              }
            ],
            'comp': [
              {
                'exceptId': {
                  'range': RecurrenceRange.thisAndFuture.name,
                  'd': dateTimeString,
                  'tz': timezone,
                },
                's': startTime,
                'e': endTime,
              }
            ],
            'except': [
              {
                'exceptId': {
                  'range': RecurrenceRange.thisAndFuture.name,
                  'd': dateTimeString,
                  'tz': timezone,
                },
                's': startTime,
                'e': endTime,
              }
            ],
          }
        },
      });
    }));

    test('Expand recurrences response', (() {
      final startTime = faker.date.dateTime().millisecondsSinceEpoch;
      final duration = faker.randomGenerator.integer(100);
      final allDay = faker.randomGenerator.boolean();
      final tzOffset = faker.randomGenerator.integer(100);
      final recurIdZ = faker.date.dateTime().toString();

      final data = {
        'Body': {
          'ExpandRecurResponse': {
            '_jsns': 'urn:zimbraMail',
            'inst': [
              {
                's': startTime,
                'dur': duration,
                'allDay': allDay,
                'tzo': tzOffset,
                'ridZ': recurIdZ,
              }
            ],
          }
        }
      };
      final envelope = ExpandRecurEnvelope.fromMap(data);
      final response = envelope.body.response as ExpandRecurResponse;
      final inst = response.instances.first;

      expect(inst.startTime, startTime);
      expect(inst.duration, duration);
      expect(inst.allDay, allDay);
      expect(inst.tzOffset, tzOffset);
      expect(inst.recurIdZ, recurIdZ);
    }));
  }));
}
