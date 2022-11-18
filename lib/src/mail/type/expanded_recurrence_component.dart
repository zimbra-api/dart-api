// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'duration_info.dart';
import 'instance_recur_id_info.dart';
import 'recurrence_info.dart';

/// Expanded recurrence
class ExpandedRecurrenceComponent {
  /// Recurrence ID
  final InstanceRecurIdInfo? exceptionId;

  /// DTSTART time in milliseconds since the Epoch
  final int? startTime;

  /// DTEND time in milliseconds since the Epoch
  final int? endTime;

  /// Duration
  final DurationInfo? duration;

  /// RRULE/RDATE/EXDATE information
  final RecurrenceInfo? recurrence;

  const ExpandedRecurrenceComponent({this.exceptionId, this.startTime, this.endTime, this.duration, this.recurrence});

  factory ExpandedRecurrenceComponent.fromMap(Map<String, dynamic> data) => ExpandedRecurrenceComponent(
      exceptionId: data['exceptId'] is Map ? InstanceRecurIdInfo.fromMap(data['exceptId']) : null,
      startTime: int.tryParse(data['s']?.toString() ?? ''),
      endTime: int.tryParse(data['e']?.toString() ?? ''),
      duration: data['dur'] is Map ? DurationInfo.fromMap(data['dur']) : null,
      recurrence: data['recur'] is Map ? RecurrenceInfo.fromMap(data['recur']) : null);

  Map<String, dynamic> toMap() => {
        if (exceptionId != null) 'exceptId': exceptionId!.toMap(),
        if (startTime != null) 's': startTime,
        if (endTime != null) 'e': endTime,
        if (duration != null) 'dur': duration!.toMap(),
        if (recurrence != null) 'recur': recurrence!.toMap(),
      };
}
