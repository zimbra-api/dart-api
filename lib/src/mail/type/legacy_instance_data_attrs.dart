// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/free_busy_status.dart';
import 'package:zimbra_api/src/common/enum/invite_class.dart';
import 'package:zimbra_api/src/common/enum/invite_status.dart';
import 'package:zimbra_api/src/common/enum/participation_status.dart';
import 'package:zimbra_api/src/common/enum/transparency.dart';

import 'common_instance_data_attrs.dart';

class LegacyInstanceDataAttrs extends CommonInstanceDataAttrs {
  /// Duration
  final int? duration;

  LegacyInstanceDataAttrs(
      {this.duration,
      super.partStat,
      super.recurIdZ,
      super.tzOffset,
      super.freeBusyActual,
      super.taskPercentComplete,
      super.isRecurring,
      super.hasExceptions,
      super.priority,
      super.freeBusyIntended,
      super.transparency,
      super.name,
      super.location,
      super.hasOtherAttendees,
      super.hasAlarm,
      super.isOrganizer,
      super.invId,
      super.componentNum,
      super.status,
      super.calClass,
      super.allDay,
      super.draft,
      super.neverSent,
      super.taskDueDate,
      super.taskTzOffsetDue});

  factory LegacyInstanceDataAttrs.fromJson(Map<String, dynamic> json) => LegacyInstanceDataAttrs(
      duration: json['d'],
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

  @override
  Map<String, dynamic> toJson() => {
        if (duration != null) 'd': duration,
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
