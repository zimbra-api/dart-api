// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/free_busy_status.dart';
import 'package:zimbra_api/src/common/enum/invite_class.dart';
import 'package:zimbra_api/src/common/enum/invite_status.dart';
import 'package:zimbra_api/src/common/enum/transparency.dart';

import 'alarm_info.dart';
import 'cal_organizer.dart';
import 'calendar_attendee.dart';
import 'dt_time_info.dart';
import 'duration_info.dart';
import 'exception_recur_id_info.dart';
import 'geo_info.dart';
import 'invite_component_common.dart';
import 'recurrence_info.dart';
import 'xprop.dart';

/// Invitation Component
class InviteComponentWithGroupInfo extends InviteComponentCommon {
  /// Categories - for iCalendar CATEGORY properties
  final List<String> categories;

  /// Comments - for iCalendar COMMENT properties
  final List<String> comments;

  /// Contacts - for iCalendar CONTACT properties
  final List<String> contacts;

  /// for iCalendar GEO property
  final GeoInfo? geo;

  /// Attendees
  final List<CalendarAttendee> attendees;

  /// Alarm information
  final List<AlarmInfo> alarms;

  /// XPROP properties
  final List<XProp> xProps;

  /// First few bytes of the message (probably between 40 and 100 bytes)
  final String? fragment;

  /// Present if noBlob is set and invite has a plain text description
  final String? description;

  /// Present if noBlob is set and invite has an HTML description
  final String? htmlDescription;

  /// Organizer
  final CalOrganizer? organizer;

  /// Recurrence information
  final RecurrenceInfo? recurrence;

  /// Recurrence id, if this is an exception
  final ExceptionRecurIdInfo? exceptionId;

  /// Start date-time (required)
  final DtTimeInfo? dtStart;

  /// End date-time
  final DtTimeInfo? dtEnd;

  /// Duration
  final DurationInfo? duration;

  InviteComponentWithGroupInfo(
      {this.categories = const [],
      this.comments = const [],
      this.contacts = const [],
      this.geo,
      this.attendees = const [],
      this.alarms = const [],
      this.xProps = const [],
      this.fragment,
      this.description,
      this.htmlDescription,
      this.organizer,
      this.recurrence,
      this.exceptionId,
      this.dtStart,
      this.dtEnd,
      this.duration,
      super.method,
      super.componentNum,
      super.rsvp,
      super.priority,
      super.name,
      super.location,
      super.percentComplete,
      super.completed,
      super.noBlob,
      super.freeBusyActual,
      super.freeBusy,
      super.transparency,
      super.isOrganizer,
      super.xUid,
      super.uid,
      super.sequence,
      super.dateTime,
      super.calItemId,
      super.deprecatedApptId,
      super.calItemFolder,
      super.status,
      super.calClass,
      super.url,
      super.isException,
      super.recurIdZ,
      super.isAllDay,
      super.isDraft,
      super.neverSent,
      super.changes});

  factory InviteComponentWithGroupInfo.fromJson(Map<String, dynamic> json) => InviteComponentWithGroupInfo(
      categories: (json['category'] is Iterable)
          ? List.from((json['category'] as Iterable).map<String>((category) => category['_content']))
          : [],
      comments: (json['comment'] is Iterable)
          ? List.from((json['comment'] as Iterable).map<String>((comment) => comment['_content']))
          : [],
      contacts: (json['contact'] is Iterable)
          ? List.from((json['contact'] as Iterable).map<String>((contact) => contact['_content']))
          : [],
      geo: json['geo'] is Map ? GeoInfo.fromJson(json['geo']) : null,
      attendees: (json['at'] is Iterable)
          ? List.from((json['at'] as Iterable).map<CalendarAttendee>((at) => CalendarAttendee.fromJson(at)))
          : [],
      alarms: (json['alarm'] is Iterable)
          ? List.from((json['alarm'] as Iterable).map<AlarmInfo>((alarm) => AlarmInfo.fromJson(alarm)))
          : [],
      xProps: (json['xprop'] is Iterable)
          ? List.from((json['xprop'] as Iterable).map<XProp>((xprop) => XProp.fromJson(xprop)))
          : [],
      fragment: json['fr']?['_content'],
      description: json['desc']?['_content'],
      htmlDescription: json['descHtml']?['_content'],
      organizer: json['or'] is Map ? CalOrganizer.fromJson(json['or']) : null,
      recurrence: json['recur'] is Map ? RecurrenceInfo.fromJson(json['recur']) : null,
      exceptionId: json['exceptId'] is Map ? ExceptionRecurIdInfo.fromJson(json['exceptId']) : null,
      dtStart: json['s'] is Map ? DtTimeInfo.fromJson(json['s']) : null,
      dtEnd: json['e'] is Map ? DtTimeInfo.fromJson(json['e']) : null,
      duration: json['dur'] is Map ? DurationInfo.fromJson(json['dur']) : null,
      method: json['method'],
      componentNum: json['compNum'],
      rsvp: json['rsvp'],
      priority: json['priority'],
      name: json['name'],
      location: json['loc'],
      percentComplete: json['percentComplete'],
      completed: json['completed'],
      noBlob: json['noBlob'],
      freeBusyActual: FreeBusyStatus.values.firstWhere(
        (item) => item.name == json['fba'],
        orElse: () => FreeBusyStatus.free,
      ),
      freeBusy: FreeBusyStatus.values.firstWhere(
        (item) => item.name == json['fb'],
        orElse: () => FreeBusyStatus.free,
      ),
      transparency: Transparency.values.firstWhere(
        (item) => item.name == json['transp'],
        orElse: () => Transparency.opaque,
      ),
      isOrganizer: json['isOrg'],
      xUid: json['x_uid'],
      uid: json['uid'],
      sequence: json['seq'],
      dateTime: json['d'],
      calItemId: json['calItemId'],
      deprecatedApptId: json['apptId'],
      calItemFolder: json['ciFolder'],
      status: InviteStatus.values.firstWhere(
        (item) => item.name == json['status'],
        orElse: () => InviteStatus.inprogress,
      ),
      calClass: InviteClass.values.firstWhere(
        (item) => item.name == json['class'],
        orElse: () => InviteClass.public,
      ),
      url: json['url'],
      isException: json['ex'],
      recurIdZ: json['ridZ'],
      isAllDay: json['allDay'],
      isDraft: json['draft'],
      neverSent: json['neverSent'],
      changes: json['changes']);

  @override
  Map<String, dynamic> toJson() => {
        if (categories.isNotEmpty) 'category': categories.map((category) => {'_content': category}).toList(),
        if (comments.isNotEmpty) 'comment': comments.map((comment) => {'_content': comment}).toList(),
        if (contacts.isNotEmpty) 'contact': contacts.map((contact) => {'_content': contact}).toList(),
        if (geo != null) 'geo': geo!.toJson(),
        if (attendees.isNotEmpty) 'at': attendees.map((at) => at.toJson()).toList(),
        if (alarms.isNotEmpty) 'alarm': alarms.map((alarm) => alarm.toJson()).toList(),
        if (xProps.isNotEmpty) 'xprop': xProps.map((xprop) => xprop.toJson()).toList(),
        if (fragment != null) 'fr': {'_content': fragment},
        if (description != null) 'desc': {'_content': description},
        if (htmlDescription != null) 'descHtml': {'_content': htmlDescription},
        if (organizer != null) 'or': organizer!.toJson(),
        if (recurrence != null) 'recur': recurrence!.toJson(),
        if (exceptionId != null) 'exceptId': exceptionId!.toJson(),
        if (dtStart != null) 's': dtStart!.toJson(),
        if (dtEnd != null) 'e': dtEnd!.toJson(),
        if (duration != null) 'dur': duration!.toJson(),
        if (method != null) 'method': method,
        if (componentNum != null) 'compNum': componentNum,
        if (rsvp != null) 'rsvp': rsvp,
        if (priority != null) 'priority': priority,
        if (name != null) 'name': name,
        if (location != null) 'loc': location,
        if (percentComplete != null) 'percentComplete': percentComplete,
        if (completed != null) 'completed': completed,
        if (noBlob != null) 'noBlob': noBlob,
        if (freeBusyActual != null) 'fba': freeBusyActual!.name,
        if (freeBusy != null) 'fb': freeBusy!.name,
        if (transparency != null) 'transp': transparency!.name,
        if (isOrganizer != null) 'isOrg': isOrganizer,
        if (xUid != null) 'x_uid': xUid,
        if (uid != null) 'uid': uid,
        if (sequence != null) 'seq': sequence,
        if (dateTime != null) 'd': dateTime,
        if (calItemId != null) 'calItemId': calItemId,
        if (deprecatedApptId != null) 'apptId': deprecatedApptId,
        if (calItemFolder != null) 'ciFolder': calItemFolder,
        if (status != null) 'status': status!.name,
        if (calClass != null) 'class': calClass!.name,
        if (url != null) 'url': url,
        if (isException != null) 'ex': isException,
        if (recurIdZ != null) 'ridZ': recurIdZ,
        if (isAllDay != null) 'allDay': isAllDay,
        if (isDraft != null) 'draft': isDraft,
        if (neverSent != null) 'neverSent': neverSent,
        if (changes != null) 'changes': changes,
      };
}
