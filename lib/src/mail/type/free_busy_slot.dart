// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// Free busy slot information
class FreeBusySlot {
  /// GMT Start time for slot in milliseconds
  final int startTime;

  /// GMT End time for slot in milliseconds
  final int endTime;

  /// Calendar event id
  final String? eventId;

  /// Appointment subject
  final String? subject;

  /// Location of meeting
  final String? location;

  /// Returns a bool value whether this calendar event is a meeting or not.
  final bool? isMeeting;

  /// Returns a bool indicating whether it is continuous or not.
  final bool? isRecurring;

  /// Returns a bool indicating whether there is any exception or not.
  final bool? isException;

  /// Returns a bool indicating whether any reminder has been set or not.
  final bool? isReminderSet;

  /// Returns a bool indicating whether this meeting is private or not.
  final bool? isPrivate;

  /// Returns a bool indicating hasPermission to view FreeBusy information
  final bool? hasPermission;

  const FreeBusySlot(
    this.startTime,
    this.endTime, {
    this.eventId,
    this.subject,
    this.location,
    this.isMeeting,
    this.isRecurring,
    this.isException,
    this.isReminderSet,
    this.isPrivate,
    this.hasPermission,
  });

  factory FreeBusySlot.fromMap(Map<String, dynamic> data) =>
      FreeBusySlot(int.tryParse(data['s']?.toString() ?? '') ?? 0, int.tryParse(data['e']?.toString() ?? '') ?? 0,
          eventId: data['eventId'],
          subject: data['subject'],
          location: data['location'],
          isMeeting: data['isMeeting'],
          isRecurring: data['isRecurring'],
          isException: data['isException'],
          isReminderSet: data['isReminderSet'],
          isPrivate: data['isPrivate'],
          hasPermission: data['hasPermission']);

  Map<String, dynamic> toMap() => {
        's': startTime,
        'e': endTime,
        if (eventId != null) 'eventId': eventId,
        if (subject != null) 'subject': subject,
        if (location != null) 'location': location,
        if (isMeeting != null) 'isMeeting': isMeeting,
        if (isRecurring != null) 'isRecurring': isRecurring,
        if (isException != null) 'isException': isException,
        if (isReminderSet != null) 'isReminderSet': isReminderSet,
        if (isPrivate != null) 'isPrivate': isPrivate,
        if (hasPermission != null) 'hasPermission': hasPermission,
      };
}
