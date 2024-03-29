// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/alarm_related.dart';

class DurationInfo {
  /// Set if the duration is negative.
  final bool? durationNegative;

  /// Weeks component of the duration
  /// Special note: if WEEKS are specified, NO OTHER OFFSET MAY BE SPECIFIED (weeks must be alone, per RFC2445)
  final int? weeks;

  /// Days component of the duration
  final int? days;

  /// Hours component of the duration
  final int? hours;

  /// Minutes component of the duration
  final int? minutes;

  /// Seconds component of the duration
  final int? seconds;

  /// Specifies whether the alarm is related to the start of end.
  /// Valid values are : START|END
  final AlarmRelated? related;

  /// Alarm repeat count
  final int? repeatCount;

  const DurationInfo({
    this.durationNegative,
    this.weeks,
    this.days,
    this.hours,
    this.minutes,
    this.seconds,
    this.related,
    this.repeatCount,
  });

  factory DurationInfo.fromMap(Map<String, dynamic> data) => DurationInfo(
        durationNegative: data['neg'],
        weeks: int.tryParse(data['w']?.toString() ?? ''),
        days: int.tryParse(data['d']?.toString() ?? ''),
        hours: int.tryParse(data['h']?.toString() ?? ''),
        minutes: int.tryParse(data['m']?.toString() ?? ''),
        seconds: int.tryParse(data['s']?.toString() ?? ''),
        related: AlarmRelated.values.firstWhere(
          (related) => related.name == data['related'],
          orElse: () => AlarmRelated.start,
        ),
        repeatCount: int.tryParse(data['count']?.toString() ?? ''),
      );

  Map<String, dynamic> toMap() => {
        if (durationNegative != null) 'neg': durationNegative,
        if (weeks != null) 'w': weeks,
        if (days != null) 'd': days,
        if (hours != null) 'h': hours,
        if (minutes != null) 'm': minutes,
        if (seconds != null) 's': seconds,
        if (related != null) 'related': related!.name,
        if (repeatCount != null) 'count': repeatCount,
      };
}
