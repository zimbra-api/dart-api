// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/free_busy_status.dart';
import '../../common/enum/invite_class.dart';
import '../../common/enum/invite_status.dart';
import '../../common/enum/participation_status.dart';
import '../../common/enum/transparency.dart';
import 'instance_data_attrs.dart';

class CommonCalendaringData extends InstanceDataAttrs {
  /// x uid
  final String? xUid;

  /// iCalendar UID
  final String? uid;

  /// Flags
  final String? flags;

  /// Tags - Comma separated list of ints.  DEPRECATED - use "tn" instead
  final String? tags;

  /// Comma separated list of tag names
  final String? tagNames;

  /// Folder ID
  final String? folderId;

  /// Size
  final int? size;

  /// Modified date in seconds
  final int? changeDate;

  /// Modified sequence
  final int? modifiedSequence;

  /// Revision number
  final int? revision;

  /// Appointment ID
  final String? id;

  const CommonCalendaringData({
    this.xUid,
    this.uid,
    this.flags,
    this.tags,
    this.tagNames,
    this.folderId,
    this.size,
    this.changeDate,
    this.modifiedSequence,
    this.revision,
    this.id,
    super.duration,
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
    super.taskTzOffsetDue,
  });

  factory CommonCalendaringData.fromMap(
    Map<String, dynamic> data,
  ) =>
      CommonCalendaringData(
        xUid: data['x_uid'],
        uid: data['uid'],
        flags: data['f'],
        tags: data['t'],
        tagNames: data['tn'],
        folderId: data['l'],
        size: int.tryParse(data['s']?.toString() ?? ''),
        changeDate: int.tryParse(data['md']?.toString() ?? ''),
        modifiedSequence: int.tryParse(data['ms']?.toString() ?? ''),
        revision: int.tryParse(data['rev']?.toString() ?? ''),
        id: data['id'],
        duration: int.tryParse(data['dur']?.toString() ?? ''),
        partStat: ParticipationStatus.values.firstWhere(
          (ptst) => ptst.name == data['ptst'],
          orElse: () => ParticipationStatus.accept,
        ),
        recurIdZ: data['ridZ'],
        tzOffset: int.tryParse(data['tzo']?.toString() ?? ''),
        freeBusyActual: FreeBusyStatus.values.firstWhere(
          (fba) => fba.name == data['fba'],
          orElse: () => FreeBusyStatus.free,
        ),
        taskPercentComplete: data['percentComplete'],
        isRecurring: data['recur'],
        hasExceptions: data['hasEx'],
        priority: data['priority'],
        freeBusyIntended: FreeBusyStatus.values.firstWhere(
          (fb) => fb.name == data['fb'],
          orElse: () => FreeBusyStatus.free,
        ),
        transparency: Transparency.values.firstWhere(
          (transp) => transp.name == data['transp'],
          orElse: () => Transparency.opaque,
        ),
        name: data['name'],
        location: data['loc'],
        hasOtherAttendees: data['otherAtt'],
        hasAlarm: data['alarm'],
        isOrganizer: data['isOrg'],
        invId: data['invId'],
        componentNum: int.tryParse(data['compNum']?.toString() ?? ''),
        status: InviteStatus.values.firstWhere(
          (status) => status.name == data['status'],
          orElse: () => InviteStatus.completed,
        ),
        calClass: InviteClass.values.firstWhere(
          (calClass) => calClass.name == data['class'],
          orElse: () => InviteClass.public,
        ),
        allDay: data['allDay'],
        draft: data['draft'],
        neverSent: data['neverSent'],
        taskDueDate: int.tryParse(data['dueDate']?.toString() ?? ''),
        taskTzOffsetDue: int.tryParse(data['tzoDue']?.toString() ?? ''),
      );

  @override
  Map<String, dynamic> toMap() => {
        if (xUid != null) 'x_uid': xUid,
        if (uid != null) 'uid': uid,
        if (flags != null) 'f': flags,
        if (tags != null) 't': tags,
        if (tagNames != null) 'tn': tagNames,
        if (folderId != null) 'l': folderId,
        if (size != null) 's': size,
        if (changeDate != null) 'md': changeDate,
        if (modifiedSequence != null) 'ms': modifiedSequence,
        if (revision != null) 'rev': revision,
        if (id != null) 'id': id,
        if (duration != null) 'dur': duration,
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
