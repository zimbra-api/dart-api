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

  ExpandedRecurrenceComponent({this.exceptionId, this.startTime, this.endTime, this.duration, this.recurrence});

  factory ExpandedRecurrenceComponent.fromJson(Map<String, dynamic> json) => ExpandedRecurrenceComponent(
      exceptionId: json['exceptId'] is Map ? InstanceRecurIdInfo.fromJson(json['exceptId']) : null,
      startTime: json['s'],
      endTime: json['e'],
      duration: json['dur'] is Map ? DurationInfo.fromJson(json['dur']) : null,
      recurrence: json['recur'] is Map ? RecurrenceInfo.fromJson(json['recur']) : null);

  Map<String, dynamic> toJson() => {
        if (exceptionId != null) 'exceptId': exceptionId!.toJson(),
        if (startTime != null) 's': startTime,
        if (endTime != null) 'e': endTime,
        if (duration != null) 'dur': duration!.toJson(),
        if (recurrence != null) 'recur': recurrence!.toJson(),
      };
}
