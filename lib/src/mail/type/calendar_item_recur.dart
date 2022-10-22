// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'dt_time_info.dart';
import 'duration_info.dart';
import 'exception_recur_id_info.dart';
import 'recurrence_info.dart';

class CalendarItemRecur {
  /// Information for iCalendar RECURRENCE-ID
  final ExceptionRecurIdInfo? exceptionId;

  /// Start time
  final DtTimeInfo? dtStart;

  /// End time
  final DtTimeInfo? dtEnd;

  /// Duration information
  final DurationInfo? duration;

  /// Recurrence information
  final RecurrenceInfo? recurrence;

  CalendarItemRecur({this.exceptionId, this.dtStart, this.dtEnd, this.duration, this.recurrence});

  factory CalendarItemRecur.fromJson(Map<String, dynamic> json) => CalendarItemRecur(
      exceptionId: json['exceptId'] is Map ? ExceptionRecurIdInfo.fromJson(json['exceptId']) : null,
      dtStart: json['s'] is Map ? DtTimeInfo.fromJson(json['s']) : null,
      dtEnd: json['e'] is Map ? DtTimeInfo.fromJson(json['e']) : null,
      duration: json['dur'] is Map ? DurationInfo.fromJson(json['dur']) : null,
      recurrence: json['recur'] is Map ? RecurrenceInfo.fromJson(json['recur']) : null);

  Map<String, dynamic> toJson() => {
        if (exceptionId != null) 'exceptId': exceptionId!.toJson(),
        if (dtStart != null) 's': dtStart!.toJson(),
        if (dtEnd != null) 'e': dtEnd!.toJson(),
        if (duration != null) 'dur': duration!.toJson(),
        if (recurrence != null) 'recur': recurrence!.toJson(),
      };
}
