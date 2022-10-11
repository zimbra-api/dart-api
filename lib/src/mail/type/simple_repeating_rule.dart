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

  SimpleRepeatingRule(
      {this.frequency = Frequency.second,
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
      this.xNames = const []});

  factory SimpleRepeatingRule.fromJson(Map<String, dynamic> json) {
    final frequency = Frequency.values.firstWhere(
      (item) => item.name == json['freq'],
      orElse: () => Frequency.second,
    );

    final xNames = <XNameRule>[];
    if (json['rule-x-name'] != null && json['rule-x-name'] is Iterable) {
      final rules = json['rule-x-name'] as Iterable;
      for (final rule in rules) {
        xNames.add(XNameRule.fromJson(rule));
      }
    }

    return SimpleRepeatingRule(
        frequency: frequency,
        until: json['until'] != null ? DateTimeStringAttr.fromJson(json['until']) : null,
        count: json['count'] != null ? NumAttr.fromJson(json['count']) : null,
        interval: json['interval'] != null ? IntervalRule.fromJson(json['interval']) : null,
        bySecond: json['bysecond'] != null ? BySecondRule.fromJson(json['bysecond']) : null,
        byMinute: json['byminute'] != null ? ByMinuteRule.fromJson(json['byminute']) : null,
        byHour: json['byhour'] != null ? ByHourRule.fromJson(json['byhour']) : null,
        byDay: json['byday'] != null ? ByDayRule.fromJson(json['byday']) : null,
        byMonthDay: json['bymonthday'] != null ? ByMonthDayRule.fromJson(json['bymonthday']) : null,
        byYearDay: json['byyearday'] != null ? ByYearDayRule.fromJson(json['byyearday']) : null,
        byWeekNo: json['byweekno'] != null ? ByWeekNoRule.fromJson(json['byweekno']) : null,
        byMonth: json['bymonth'] != null ? ByMonthRule.fromJson(json['bymonth']) : null,
        bySetPose: json['bysetpos'] != null ? BySetPosRule.fromJson(json['bysetpos']) : null,
        weekStart: json['wkst'] != null ? WkstRule.fromJson(json['wkst']) : null,
        xNames: xNames);
  }

  Map<String, dynamic> toJson() => {
        'freq': frequency.name,
        if (until != null) 'until': until!.toJson(),
        if (count != null) 'count': count!.toJson(),
        if (interval != null) 'interval': interval!.toJson(),
        if (bySecond != null) 'bysecond': bySecond!.toJson(),
        if (byMinute != null) 'byminute': byMinute!.toJson(),
        if (byHour != null) 'byhour': byHour!.toJson(),
        if (byDay != null) 'byday': byDay!.toJson(),
        if (byMonthDay != null) 'bymonthday': byMonthDay!.toJson(),
        if (byYearDay != null) 'byyearday': byYearDay!.toJson(),
        if (byWeekNo != null) 'byweekno': byWeekNo!.toJson(),
        if (byMonth != null) 'bymonth': byMonth!.toJson(),
        if (bySetPose != null) 'bysetpos': bySetPose!.toJson(),
        if (weekStart != null) 'wkst': weekStart!.toJson(),
        if (xNames.isNotEmpty) 'rule-x-name': xNames.map((rule) => rule.toJson()).toList(),
      };
}
