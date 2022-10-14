// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'expanded_recurrence_instance.dart';
import 'free_busy_user_status.dart';

/// Information on conflicting instances
class ConflictRecurrenceInstance extends ExpandedRecurrenceInstance {
  /// Free/Busy user status
  final List<FreeBusyUserStatus> freebusyUsers;

  ConflictRecurrenceInstance(
      {super.startTime, super.duration, super.allDay, super.tzOffset, super.recurIdZ, this.freebusyUsers = const []});

  factory ConflictRecurrenceInstance.fromJson(Map<String, dynamic> json) => ConflictRecurrenceInstance(
      startTime: json['s'],
      duration: json['dur'],
      allDay: json['allDay'],
      tzOffset: json['tzo'],
      recurIdZ: json['ridZ'],
      freebusyUsers: (json['usr'] is Iterable)
          ? List.from((json['usr'] as Iterable).map<FreeBusyUserStatus>((usr) => FreeBusyUserStatus.fromJson(usr)))
          : []);

  @override
  Map<String, dynamic> toJson() => {
        if (startTime != null) 's': startTime,
        if (duration != null) 'dur': duration,
        if (allDay != null) 'allDay': allDay,
        if (tzOffset != null) 'tzo': tzOffset,
        if (recurIdZ != null) 'ridZ': recurIdZ,
        if (freebusyUsers.isNotEmpty) 'usr': freebusyUsers.map((usr) => usr.toJson()).toList(),
      };
}
