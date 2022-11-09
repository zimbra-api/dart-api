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

  factory ConflictRecurrenceInstance.fromMap(Map<String, dynamic> data) => ConflictRecurrenceInstance(
      startTime: int.tryParse(data['s']?.toString() ?? ''),
      duration: int.tryParse(data['dur']?.toString() ?? ''),
      allDay: data['allDay'],
      tzOffset: int.tryParse(data['tzo']?.toString() ?? ''),
      recurIdZ: data['ridZ'],
      freebusyUsers: (data['usr'] is Iterable)
          ? List.from((data['usr'] as Iterable).map<FreeBusyUserStatus>((usr) => FreeBusyUserStatus.fromMap(usr)))
          : []);

  @override
  Map<String, dynamic> toMap() => {
        if (startTime != null) 's': startTime,
        if (duration != null) 'dur': duration,
        if (allDay != null) 'allDay': allDay,
        if (tzOffset != null) 'tzo': tzOffset,
        if (recurIdZ != null) 'ridZ': recurIdZ,
        if (freebusyUsers.isNotEmpty) 'usr': freebusyUsers.map((usr) => usr.toMap()).toList(),
      };
}
