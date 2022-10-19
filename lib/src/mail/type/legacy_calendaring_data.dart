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
import 'common_calendaring_data.dart';
import 'geo_info.dart';
import 'legacy_instance_data_info.dart';

class LegacyCalendaringData extends CommonCalendaringData {
  /// Organizer
  final CalOrganizer? organizer;

  /// Categories
  final List<String> categories;

  /// Information for iCalendar GEO property
  final GeoInfo? geo;

  /// First few bytes of the message (probably between 40 and 100 bytes)
  final String? fragment;

  /// Instances
  final List<LegacyInstanceDataInfo> instances;

  /// Alarm information
  final AlarmDataInfo? alarmData;

  LegacyCalendaringData(
      {this.organizer,
      this.categories = const [],
      this.geo,
      this.fragment,
      this.instances = const [],
      this.alarmData,
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

  factory LegacyCalendaringData.fromJson(Map<String, dynamic> json) => LegacyCalendaringData(
      organizer: json['or'] is Map ? CalOrganizer.fromJson(json['or']) : null,
      categories: (json['category'] is Iterable)
          ? List.from((json['category'] as Iterable).map<String>((category) => category['_content']))
          : [],
      geo: json['geo'] is Map ? GeoInfo.fromJson(json['geo']) : null,
      fragment: json['fr']?['_content'],
      instances: (json['inst'] is Iterable)
          ? List.from(
              (json['inst'] as Iterable).map<LegacyInstanceDataInfo>((inst) => LegacyInstanceDataInfo.fromJson(inst)))
          : [],
      alarmData: json['alarmData'] is Map ? AlarmDataInfo.fromJson(json['alarmData']) : null,
      xUid: json['x_uid'],
      uid: json['uid'],
      flags: json['f'],
      tags: json['t'],
      tagNames: json['tn'],
      folderId: json['l'],
      size: json['s'],
      changeDate: json['md'],
      modifiedSequence: json['ms'],
      revision: json['rev'],
      id: json['id'],
      duration: json['dur'],
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
        if (organizer != null) 'or': organizer!.toJson(),
        if (categories.isNotEmpty) 'category': categories.map((category) => {'_content': category}).toList(),
        if (geo != null) 'geo': geo!.toJson(),
        if (fragment != null) 'fr': {'_content': fragment},
        if (instances.isNotEmpty) 'inst': instances.map((inst) => inst.toJson()).toList(),
        if (alarmData != null) 'alarmData': alarmData!.toJson(),
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
