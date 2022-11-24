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

  const CalendarItemRecur({
    this.exceptionId,
    this.dtStart,
    this.dtEnd,
    this.duration,
    this.recurrence,
  });

  factory CalendarItemRecur.fromMap(Map<String, dynamic> data) => CalendarItemRecur(
      exceptionId: data['exceptId'] is Map ? ExceptionRecurIdInfo.fromMap(data['exceptId']) : null,
      dtStart: data['s'] is Map ? DtTimeInfo.fromMap(data['s']) : null,
      dtEnd: data['e'] is Map ? DtTimeInfo.fromMap(data['e']) : null,
      duration: data['dur'] is Map ? DurationInfo.fromMap(data['dur']) : null,
      recurrence: data['recur'] is Map ? RecurrenceInfo.fromMap(data['recur']) : null);

  Map<String, dynamic> toMap() => {
        if (exceptionId != null) 'exceptId': exceptionId!.toMap(),
        if (dtStart != null) 's': dtStart!.toMap(),
        if (dtEnd != null) 'e': dtEnd!.toMap(),
        if (duration != null) 'dur': duration!.toMap(),
        if (recurrence != null) 'recur': recurrence!.toMap(),
      };
}
