// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/frequency.dart';

import 'by_day_rule.dart';
import 'by_hour_rule.dart';
import 'by_minute_rule.dart';
import 'by_month_day_rule.dart';
import 'by_month_rule.dart';
import 'by_second_rule.dart';
import 'by_set_pos_rule.dart';
import 'by_week_no_rule.dart';
import 'by_year_day_rule.dart';
import 'date_time_string_attr.dart';
import 'interval_rule.dart';
import 'num_attr.dart';
import 'wkst_rule.dart';
import 'xname_rule.dart';

/// Simple repeating rule information
class SimpleRepeatingRule {
  /// Frequency - SEC,MIN,HOU,DAI,WEE,MON,YEA
  final Frequency frequency;

  /// UNTIL date specification
  final DateTimeStringAttr? until;

  /// Count of instances to generate
  final NumAttr? count;

  /// Interval specification
  final IntervalRule? interval;

  /// BYSECOND rule
  final BySecondRule? bySecond;

  /// BYMINUTE rule
  final ByMinuteRule? byMinute;

  /// BYHOUR rule
  final ByHourRule? byHour;

  /// BYDAY rule
  final ByDayRule? byDay;

  /// BYMONTHDAY rule
  final ByMonthDayRule? byMonthDay;

  /// BYYEARDAY rule
  final ByYearDayRule? byYearDay;

  /// BYWEEKNO rule
  final ByWeekNoRule? byWeekNo;

  /// BYMONTH rule
  final ByMonthRule? byMonth;

  /// BYSETPOS rule
  final BySetPosRule? bySetPose;

  /// Week start day - SU,MO,TU,WE,TH,FR,SA
  final WkstRule? weekStart;

  final List<XNameRule> xNames;

  const SimpleRepeatingRule({
    this.frequency = Frequency.second,
    this.until,
    this.count,
    this.interval,
    this.bySecond,
    this.byMinute,
    this.byHour,
    this.byDay,
    this.byMonthDay,
    this.byYearDay,
    this.byWeekNo,
    this.byMonth,
    this.bySetPose,
    this.weekStart,
    this.xNames = const [],
  });

  factory SimpleRepeatingRule.fromMap(Map<String, dynamic> data) => SimpleRepeatingRule(
      frequency: Frequency.values.firstWhere(
        (item) => item.name == data['freq'],
        orElse: () => Frequency.second,
      ),
      until: data['until'] is Map ? DateTimeStringAttr.fromMap(data['until']) : null,
      count: data['count'] is Map ? NumAttr.fromMap(data['count']) : null,
      interval: data['interval'] is Map ? IntervalRule.fromMap(data['interval']) : null,
      bySecond: data['bysecond'] is Map ? BySecondRule.fromMap(data['bysecond']) : null,
      byMinute: data['byminute'] is Map ? ByMinuteRule.fromMap(data['byminute']) : null,
      byHour: data['byhour'] is Map ? ByHourRule.fromMap(data['byhour']) : null,
      byDay: data['byday'] is Map ? ByDayRule.fromMap(data['byday']) : null,
      byMonthDay: data['bymonthday'] is Map ? ByMonthDayRule.fromMap(data['bymonthday']) : null,
      byYearDay: data['byyearday'] is Map ? ByYearDayRule.fromMap(data['byyearday']) : null,
      byWeekNo: data['byweekno'] is Map ? ByWeekNoRule.fromMap(data['byweekno']) : null,
      byMonth: data['bymonth'] is Map ? ByMonthRule.fromMap(data['bymonth']) : null,
      bySetPose: data['bysetpos'] is Map ? BySetPosRule.fromMap(data['bysetpos']) : null,
      weekStart: data['wkst'] is Map ? WkstRule.fromMap(data['wkst']) : null,
      xNames: (data['rule-x-name'] is Iterable)
          ? (data['rule-x-name'] as Iterable).map<XNameRule>((rule) => XNameRule.fromMap(rule)).toList(growable: false)
          : const []);

  Map<String, dynamic> toMap() => {
        'freq': frequency.name,
        if (until != null) 'until': until!.toMap(),
        if (count != null) 'count': count!.toMap(),
        if (interval != null) 'interval': interval!.toMap(),
        if (bySecond != null) 'bysecond': bySecond!.toMap(),
        if (byMinute != null) 'byminute': byMinute!.toMap(),
        if (byHour != null) 'byhour': byHour!.toMap(),
        if (byDay != null) 'byday': byDay!.toMap(),
        if (byMonthDay != null) 'bymonthday': byMonthDay!.toMap(),
        if (byYearDay != null) 'byyearday': byYearDay!.toMap(),
        if (byWeekNo != null) 'byweekno': byWeekNo!.toMap(),
        if (byMonth != null) 'bymonth': byMonth!.toMap(),
        if (bySetPose != null) 'bysetpos': bySetPose!.toMap(),
        if (weekStart != null) 'wkst': weekStart!.toMap(),
        if (xNames.isNotEmpty) 'rule-x-name': xNames.map((rule) => rule.toMap()).toList(growable: false),
      };
}
