// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'duration_info.dart';
import 'expanded_recurrence_component.dart';
import 'instance_recur_id_info.dart';
import 'recurrence_info.dart';

/// Cancel expanded recurrence
class ExpandedRecurrenceCancel extends ExpandedRecurrenceComponent {
  ExpandedRecurrenceCancel({super.exceptionId, super.startTime, super.endTime, super.duration, super.recurrence});

  factory ExpandedRecurrenceCancel.fromJson(Map<String, dynamic> json) => ExpandedRecurrenceCancel(
      exceptionId: json['exceptId'] is Map ? InstanceRecurIdInfo.fromJson(json['exceptId']) : null,
      startTime: json['s'],
      endTime: json['e'],
      duration: json['dur'] is Map ? DurationInfo.fromJson(json['dur']) : null,
      recurrence: json['recur'] is Map ? RecurrenceInfo.fromJson(json['recur']) : null);
}
