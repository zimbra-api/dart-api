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

  factory ExpandedRecurrenceCancel.fromMap(Map<String, dynamic> data) => ExpandedRecurrenceCancel(
      exceptionId: data['exceptId'] is Map ? InstanceRecurIdInfo.fromMap(data['exceptId']) : null,
      startTime: int.tryParse(data['s']?.toString() ?? ''),
      endTime: int.tryParse(data['e']?.toString() ?? ''),
      duration: data['dur'] is Map ? DurationInfo.fromMap(data['dur']) : null,
      recurrence: data['recur'] is Map ? RecurrenceInfo.fromMap(data['recur']) : null);
}
