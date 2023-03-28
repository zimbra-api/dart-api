// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class ExpandedRecurrenceInstance {
  /// Start time in milliseconds
  final int? startTime;

  /// Duration in milliseconds
  final int? duration;

  /// Set if the instance is for an all day appointment
  final bool? allDay;

  /// GMT offset of start time in milliseconds; returned only when allDay is set
  final int? tzOffset;

  /// Recurrence ID string in UTC timezone
  final String? recurIdZ;

  const ExpandedRecurrenceInstance({
    this.startTime,
    this.duration,
    this.allDay,
    this.tzOffset,
    this.recurIdZ,
  });

  factory ExpandedRecurrenceInstance.fromMap(
    Map<String, dynamic> data,
  ) =>
      ExpandedRecurrenceInstance(
        startTime: int.tryParse(data['s']?.toString() ?? ''),
        duration: int.tryParse(data['dur']?.toString() ?? ''),
        allDay: data['allDay'],
        tzOffset: int.tryParse(data['tzo']?.toString() ?? ''),
        recurIdZ: data['ridZ'],
      );

  Map<String, dynamic> toMap() => {
        if (startTime != null) 's': startTime,
        if (duration != null) 'dur': duration,
        if (allDay != null) 'allDay': allDay,
        if (tzOffset != null) 'tzo': tzOffset,
        if (recurIdZ != null) 'ridZ': recurIdZ,
      };
}
