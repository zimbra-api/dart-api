// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/free_busy_status.dart';
import 'package:zimbra_api/src/common/enum/invite_class.dart';
import 'package:zimbra_api/src/common/enum/invite_status.dart';
import 'package:zimbra_api/src/common/enum/participation_status.dart';
import 'package:zimbra_api/src/common/enum/transparency.dart';

import 'alarm_data_info.dart';
import 'cal_organizer.dart';
import 'cal_reply.dart';
import 'common_calendaring_data.dart';
import 'geo_info.dart';
import 'instance_data_info.dart';
import 'invitation.dart';

class CalendarItemHitInfo extends CommonCalendaringData {
  /// Sort field value
  final String? sortField;

  /// Date
  final int? date;

  /// Set if the message matched the specified query string
  final bool? contentMatched;

  /// Time in millis to show the alarm
  final int? nextAlarm;

  /// Organizer
  final CalOrganizer? organizer;

  /// Categories
  final List<String> categories;

  /// Information for iCalendar GEO property
  final GeoInfo? geo;

  /// First few bytes of the message (probably between 40 and 100 bytes)
  final String? fragment;

  /// Data for instances
  final List<InstanceDataInfo> instances;

  /// Alarm information
  final AlarmDataInfo? alarmData;

  /// Invites
  final List<Invitation> invites;

  /// Replies
  final List<CalReply> replies;

  CalendarItemHitInfo(
      {this.sortField,
      this.date,
      this.contentMatched,
      this.nextAlarm,
      this.organizer,
      this.categories = const [],
      this.geo,
      this.fragment,
      this.instances = const [],
      this.alarmData,
      this.invites = const [],
      this.replies = const [],
      super.xUid,
      super.uid,
      super.flags,
      super.tags,
      super.tagNames,
      super.folderId,
      super.size,
      super.changeDate,
      super.modifiedSequence,
      super.revision,
      super.id,
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
      super.taskTzOffsetDue});

  factory CalendarItemHitInfo.fromMap(Map<String, dynamic> data) => CalendarItemHitInfo(
      sortField: data['sf'],
      date: int.tryParse(data['d']?.toString() ?? ''),
      contentMatched: data['cm'],
      nextAlarm: int.tryParse(data['nextAlarm']?.toString() ?? ''),
      organizer: (data['or'] is Map) ? CalOrganizer.fromMap(data['or']) : null,
      categories: (data['category'] is Iterable)
          ? (data['category'] as Iterable).map<String>((category) => category['_content']).toList(growable: false)
          : const [],
      geo: (data['geo'] is Map) ? GeoInfo.fromMap(data['geo']) : null,
      fragment: data['fr'],
      instances: (data['inst'] is Iterable)
          ? (data['inst'] as Iterable)
              .map<InstanceDataInfo>((inst) => InstanceDataInfo.fromMap(inst))
              .toList(growable: false)
          : const [],
      alarmData: (data['alarmData'] is Map) ? AlarmDataInfo.fromMap(data['alarmData']) : null,
      invites: (data['inv'] is Iterable)
          ? List.from((data['inv'] as Iterable).map<Invitation>((inv) => Invitation.fromMap(inv)))
          : const [],
      replies: (data['replies']?['reply'] is Iterable)
          ? (data['replies']['reply'] as Iterable)
              .map<CalReply>((reply) => CalReply.fromMap(reply))
              .toList(growable: false)
          : const [],
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
      taskTzOffsetDue: int.tryParse(data['tzoDue']?.toString() ?? ''));

  @override
  Map<String, dynamic> toMap() => {
        if (sortField != null) 'sf': sortField,
        if (date != null) 'd': date,
        if (contentMatched != null) 'cm': contentMatched,
        if (nextAlarm != null) 'nextAlarm': nextAlarm,
        if (organizer != null) 'or': organizer!.toMap(),
        if (categories.isNotEmpty)
          'category': categories.map((category) => {'_content': category}).toList(growable: false),
        if (geo != null) 'geo': geo!.toMap(),
        if (fragment != null) 'fr': fragment,
        if (instances.isNotEmpty) 'inst': instances.map((inst) => inst.toMap()).toList(growable: false),
        if (alarmData != null) 'alarmData': alarmData!.toMap(),
        if (invites.isNotEmpty) 'inv': invites.map((inv) => inv.toMap()).toList(growable: false),
        if (replies.isNotEmpty) 'replies': {'reply': replies.map((reply) => reply.toMap()).toList(growable: false)},
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
