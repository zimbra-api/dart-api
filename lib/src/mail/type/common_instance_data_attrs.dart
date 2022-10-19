// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/free_busy_status.dart';
import 'package:zimbra_api/src/common/enum/invite_class.dart';
import 'package:zimbra_api/src/common/enum/invite_status.dart';
import 'package:zimbra_api/src/common/enum/participation_status.dart';
import 'package:zimbra_api/src/common/enum/transparency.dart';

class CommonInstanceDataAttrs {
  /// Your iCalendar PTST (Participation status)
  /// Valid values: NE|AC|TE|DE|DG|CO|IN|WE|DF
  /// "NE"eds-action, "TE"ntative, "AC"cept, "DE"clined, "DG" (delegated), "CO"mpleted (todo), "IN"-process (todo),
  /// "WA"iting (custom value only for todo), "DF" (deferred; custom value only for todo)
  final ParticipationStatus? partStat;

  /// Recurrence-id string in UTC timezone
  final String? recurIdZ;

  /// Offset from GMT in milliseconds for start time in the time zone of the instance;
  /// this is useful because the instance time zone may not be the same as the time zone of the requesting client;
  /// when rendering an all-day appointment, the client must shift the appointment by the difference between the instance
  /// time zone and its local time zone to determine the correct date to render the all-day block
  final int? tzOffset;

  /// Actual free-busy status: Free, Busy, busy-Tentative, busy-Unavailable (a.k.a. OutOfOffice)
  /// While free-busy status is simply a property of an event that is set during creation/update, "actual" free-busy
  /// status is the true free-busy state that depends on appt/invite free-busy, event scheduling status
  /// (confirmed vs. tentative vs. cancel), and more importantly, the attendee's participation status. For example,
  /// actual free-busy is busy-Tentative for an event with Busy free-busy value until the attendee has acted on the invite.
  final FreeBusyStatus? freeBusyActual;

  /// Percent complete - only for tasks
  final String? taskPercentComplete;

  /// If set, this is a recurring appointment
  final bool? isRecurring;

  /// If set, this is a recurring appointment with exceptions
  final bool? hasExceptions;

  /// Priority
  final String? priority;

  /// Intended Free/Busy
  final FreeBusyStatus? freeBusyIntended;

  /// Transparency - O|T.  i.e. Opaque or Transparent
  final Transparency? transparency;

  /// Name
  final String? name;

  /// Location
  final String? location;

  /// If set, this appointment has other attendees
  final bool? hasOtherAttendees;

  /// Set if has alarm
  final bool? hasAlarm;

  /// Default invite "am I organizer" flag
  final bool? isOrganizer;

  /// Default invite mail item ID
  final String? invId;

  /// Default invite component number
  final int? componentNum;

  /// Status - TENT|CONF|CANC|NEED|COMP|INPR|WAITING|DEFERRED
  /// i.e. TENTative, CONFirmed, CANCelled, COMPleted, INPRogress, WAITING, DEFERRED
  /// where waiting and Deferred are custom values not found in the iCalendar spec.
  final InviteStatus? status;

  /// Class = PUB|PRI|CON.  i.e. PUBlic (default), PRIvate, CONfidential
  final InviteClass? calClass;

  /// If set, this is an "all day" appointment
  final bool? allDay;

  /// Set if invite has changes that haven't been sent to attendees; for organizer only
  final bool? draft;

  /// Set if attendees were never notified of this invite; for organizer only
  final bool? neverSent;

  /// Due date in milliseconds. For tasks only
  final int? taskDueDate;

  /// Similar to the "tzo" attribute but for "dueDate". "tzoDue" can be different from
  /// "tzo" if start date and due date lie on different sides of a daylight savings transition
  final int? taskTzOffsetDue;

  CommonInstanceDataAttrs(
      {this.partStat,
      this.recurIdZ,
      this.tzOffset,
      this.freeBusyActual,
      this.taskPercentComplete,
      this.isRecurring,
      this.hasExceptions,
      this.priority,
      this.freeBusyIntended,
      this.transparency,
      this.name,
      this.location,
      this.hasOtherAttendees,
      this.hasAlarm,
      this.isOrganizer,
      this.invId,
      this.componentNum,
      this.status,
      this.calClass,
      this.allDay,
      this.draft,
      this.neverSent,
      this.taskDueDate,
      this.taskTzOffsetDue});

  factory CommonInstanceDataAttrs.fromJson(Map<String, dynamic> json) => CommonInstanceDataAttrs(
      partStat: ParticipationStatus.values.firstWhere(
        (ptst) => ptst.name == json['ptst'],
        orElse: () => ParticipationStatus.accept,
      ),
      recurIdZ: json['ridZ'],
      tzOffset: json['tzo'],
      freeBusyActual: FreeBusyStatus.values.firstWhere(
        (fba) => fba.name == json['fba'],
        orElse: () => FreeBusyStatus.free,
      ),
      taskPercentComplete: json['percentComplete'],
      isRecurring: json['recur'],
      hasExceptions: json['hasEx'],
      priority: json['priority'],
      freeBusyIntended: FreeBusyStatus.values.firstWhere(
        (fb) => fb.name == json['fb'],
        orElse: () => FreeBusyStatus.free,
      ),
      transparency: Transparency.values.firstWhere(
        (transp) => transp.name == json['transp'],
        orElse: () => Transparency.opaque,
      ),
      name: json['name'],
      location: json['loc'],
      hasOtherAttendees: json['otherAtt'],
      hasAlarm: json['alarm'],
      isOrganizer: json['isOrg'],
      invId: json['invId'],
      componentNum: json['compNum'],
      status: InviteStatus.values.firstWhere(
        (status) => status.name == json['status'],
        orElse: () => InviteStatus.completed,
      ),
      calClass: InviteClass.values.firstWhere(
        (calClass) => calClass.name == json['class'],
        orElse: () => InviteClass.public,
      ),
      allDay: json['allDay'],
      draft: json['draft'],
      neverSent: json['neverSent'],
      taskDueDate: json['dueDate'],
      taskTzOffsetDue: json['tzoDue']);

  Map<String, dynamic> toJson() => {
        if (partStat != null) 'ptst': partStat!.name,
        if (recurIdZ != null) 'ridZ': recurIdZ,
        if (tzOffset != null) 'tzo': tzOffset,
        if (freeBusyActual != null) 'fba': freeBusyActual!.name,
        if (taskPercentComplete != null) 'percentComplete': taskPercentComplete,
        if (isRecurring != null) 'recur': isRecurring,
        if (hasExceptions != null) 'hasEx': hasExceptions,
        if (priority != null) 'priority': priority,
        if (freeBusyIntended != null) 'fb': freeBusyIntended!.name,
        if (transparency != null) 'transp': transparency!.name,
        if (name != null) 'name': name,
        if (location != null) 'loc': location,
        if (hasOtherAttendees != null) 'otherAtt': hasOtherAttendees,
        if (hasAlarm != null) 'alarm': hasAlarm,
        if (isOrganizer != null) 'isOrg': isOrganizer,
        if (invId != null) 'invId': invId,
        if (componentNum != null) 'compNum': componentNum,
        if (status != null) 'status': status!.name,
        if (calClass != null) 'class': calClass!.name,
        if (allDay != null) 'allDay': allDay,
        if (draft != null) 'draft': draft,
        if (neverSent != null) 'neverSent': neverSent,
        if (taskDueDate != null) 'dueDate': taskDueDate,
        if (taskTzOffsetDue != null) 'tzoDue': taskTzOffsetDue,
      };
}
