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
class InviteComponent extends InviteComponentCommon {
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

  InviteComponent(
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

  factory InviteComponent.fromMap(Map<String, dynamic> data) => InviteComponent(
      categories: (data['category'] is Iterable)
          ? (data['category'] as Iterable).map<String>((category) => category['_content']).toList(growable: false)
          : const [],
      comments: (data['comment'] is Iterable)
          ? (data['comment'] as Iterable).map<String>((comment) => comment['_content']).toList(growable: false)
          : const [],
      contacts: (data['contact'] is Iterable)
          ? (data['contact'] as Iterable).map<String>((contact) => contact['_content']).toList(growable: false)
          : const [],
      geo: data['geo'] is Map ? GeoInfo.fromMap(data['geo']) : null,
      attendees: (data['at'] is Iterable)
          ? (data['at'] as Iterable).map<CalendarAttendee>((at) => CalendarAttendee.fromMap(at)).toList(growable: false)
          : const [],
      alarms: (data['alarm'] is Iterable)
          ? (data['alarm'] as Iterable).map<AlarmInfo>((alarm) => AlarmInfo.fromMap(alarm)).toList(growable: false)
          : const [],
      xProps: (data['xprop'] is Iterable)
          ? (data['xprop'] as Iterable).map<XProp>((xprop) => XProp.fromMap(xprop)).toList(growable: false)
          : const [],
      fragment: data['fr'],
      description: data['desc']?['_content'],
      htmlDescription: data['descHtml']?['_content'],
      organizer: data['or'] is Map ? CalOrganizer.fromMap(data['or']) : null,
      recurrence: data['recur'] is Map ? RecurrenceInfo.fromMap(data['recur']) : null,
      exceptionId: data['exceptId'] is Map ? ExceptionRecurIdInfo.fromMap(data['exceptId']) : null,
      dtStart: data['s'] is Map ? DtTimeInfo.fromMap(data['s']) : null,
      dtEnd: data['e'] is Map ? DtTimeInfo.fromMap(data['e']) : null,
      duration: data['dur'] is Map ? DurationInfo.fromMap(data['dur']) : null,
      method: data['method'],
      componentNum: int.tryParse(data['compNum']?.toString() ?? ''),
      rsvp: data['rsvp'],
      priority: data['priority'],
      name: data['name'],
      location: data['loc'],
      percentComplete: data['percentComplete'],
      completed: data['completed'],
      noBlob: data['noBlob'],
      freeBusyActual: FreeBusyStatus.values.firstWhere(
        (item) => item.name == data['fba'],
        orElse: () => FreeBusyStatus.free,
      ),
      freeBusy: FreeBusyStatus.values.firstWhere(
        (item) => item.name == data['fb'],
        orElse: () => FreeBusyStatus.free,
      ),
      transparency: Transparency.values.firstWhere(
        (item) => item.name == data['transp'],
        orElse: () => Transparency.opaque,
      ),
      isOrganizer: data['isOrg'],
      xUid: data['x_uid'],
      uid: data['uid'],
      sequence: int.tryParse(data['seq']?.toString() ?? ''),
      dateTime: int.tryParse(data['d']?.toString() ?? ''),
      calItemId: data['calItemId'],
      deprecatedApptId: data['apptId'],
      calItemFolder: data['ciFolder'],
      status: InviteStatus.values.firstWhere(
        (item) => item.name == data['status'],
        orElse: () => InviteStatus.inprogress,
      ),
      calClass: InviteClass.values.firstWhere(
        (item) => item.name == data['class'],
        orElse: () => InviteClass.public,
      ),
      url: data['url'],
      isException: data['ex'],
      recurIdZ: data['ridZ'],
      isAllDay: data['allDay'],
      isDraft: data['draft'],
      neverSent: data['neverSent'],
      changes: data['changes']);

  @override
  Map<String, dynamic> toMap() => {
        if (categories.isNotEmpty)
          'category': categories.map((category) => {'_content': category}).toList(growable: false),
        if (comments.isNotEmpty) 'comment': comments.map((comment) => {'_content': comment}).toList(growable: false),
        if (contacts.isNotEmpty) 'contact': contacts.map((contact) => {'_content': contact}).toList(growable: false),
        if (geo != null) 'geo': geo!.toMap(),
        if (attendees.isNotEmpty) 'at': attendees.map((at) => at.toMap()).toList(growable: false),
        if (alarms.isNotEmpty) 'alarm': alarms.map((alarm) => alarm.toMap()).toList(growable: false),
        if (xProps.isNotEmpty) 'xprop': xProps.map((xprop) => xprop.toMap()).toList(growable: false),
        if (fragment != null) 'fr': fragment,
        if (description != null) 'desc': {'_content': description},
        if (htmlDescription != null) 'descHtml': {'_content': htmlDescription},
        if (organizer != null) 'or': organizer!.toMap(),
        if (recurrence != null) 'recur': recurrence!.toMap(),
        if (exceptionId != null) 'exceptId': exceptionId!.toMap(),
        if (dtStart != null) 's': dtStart!.toMap(),
        if (dtEnd != null) 'e': dtEnd!.toMap(),
        if (duration != null) 'dur': duration!.toMap(),
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
