// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/free_busy_status.dart';
import 'package:zimbra_api/src/common/enum/invite_class.dart';
import 'package:zimbra_api/src/common/enum/invite_status.dart';
import 'package:zimbra_api/src/common/enum/transparency.dart';

import 'alarm_info.dart';
import 'attachments_info.dart';
import 'cal_organizer.dart';
import 'cal_tz_info.dart';
import 'calendar_attendee.dart';
import 'dt_time_info.dart';
import 'duration_info.dart';
import 'exception_recur_id_info.dart';
import 'geo_info.dart';
import 'invite_component.dart';
import 'mime_part_info.dart';
import 'raw_invite.dart';
import 'recurrence_info.dart';
import 'xprop.dart';

/// Invitation Information
class InvitationInfo extends InviteComponent {
  /// ID
  final String? id;

  /// Content-Type
  final String? contentType;

  /// Content-Id
  final String? contentId;

  /// RAW RFC822 MESSAGE (XML-encoded) MUST CONTAIN A text/calendar PART
  final RawInvite? content;

  /// Invite component
  final InviteComponent? inviteComponent;

  /// Timezones
  final List<CalTZInfo> timezones;

  /// Meeting notes parts
  final List<MimePartInfo> mimeParts;

  /// Attachments
  final AttachmentsInfo? attachments;

  InvitationInfo(
      {this.id,
      this.contentType,
      this.contentId,
      this.content,
      this.inviteComponent,
      this.timezones = const [],
      this.mimeParts = const [],
      this.attachments,
      super.categories,
      super.comments,
      super.contacts,
      super.geo,
      super.attendees,
      super.alarms,
      super.xProps,
      super.fragment,
      super.description,
      super.htmlDescription,
      super.organizer,
      super.recurrence,
      super.exceptionId,
      super.dtStart,
      super.dtEnd,
      super.duration,
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

  factory InvitationInfo.fromJson(Map<String, dynamic> json) {
    final freeBusyActual = FreeBusyStatus.values.firstWhere(
      (item) => item.name == json['fba'],
      orElse: () => FreeBusyStatus.free,
    );
    final freeBusy = FreeBusyStatus.values.firstWhere(
      (item) => item.name == json['fb'],
      orElse: () => FreeBusyStatus.free,
    );
    final transparency = Transparency.values.firstWhere(
      (item) => item.name == json['fb'],
      orElse: () => Transparency.opaque,
    );
    final status = InviteStatus.values.firstWhere(
      (item) => item.name == json['status'],
      orElse: () => InviteStatus.inprogress,
    );
    final calClass = InviteClass.values.firstWhere(
      (item) => item.name == json['class'],
      orElse: () => InviteClass.public,
    );

    final categories = <String>[];
    if (json['category'] != null && json['category'] is Iterable) {
      final elements = json['category'] as Iterable;
      for (final element in elements) {
        categories.add(element['_content']);
      }
    }

    final comments = <String>[];
    if (json['comment'] != null && json['comment'] is Iterable) {
      final elements = json['comment'] as Iterable;
      for (final element in elements) {
        comments.add(element['_content']);
      }
    }

    final contacts = <String>[];
    if (json['contact'] != null && json['contact'] is Iterable) {
      final elements = json['contact'] as Iterable;
      for (final element in elements) {
        contacts.add(element['_content']);
      }
    }

    final attendees = <CalendarAttendee>[];
    if (json['at'] != null && json['at'] is Iterable) {
      final elements = json['at'] as Iterable;
      for (final at in elements) {
        attendees.add(CalendarAttendee.fromJson(at));
      }
    }

    final alarms = <AlarmInfo>[];
    if (json['alarm'] != null && json['alarm'] is Iterable) {
      final elements = json['alarm'] as Iterable;
      for (final alarm in elements) {
        alarms.add(AlarmInfo.fromJson(alarm));
      }
    }

    final xProps = <XProp>[];
    if (json['xprop'] != null && json['xprop'] is Iterable) {
      final elements = json['xprop'] as Iterable;
      for (final xprop in elements) {
        xProps.add(XProp.fromJson(xprop));
      }
    }

    final timezones = <CalTZInfo>[];
    if (json['tz'] != null && json['tz'] is Iterable) {
      final elements = json['tz'] as Iterable;
      for (final tz in elements) {
        timezones.add(CalTZInfo.fromJson(tz));
      }
    }

    final mimeParts = <MimePartInfo>[];
    if (json['mp'] != null && json['mp'] is Iterable) {
      final elements = json['mp'] as Iterable;
      for (final tz in elements) {
        mimeParts.add(MimePartInfo.fromJson(tz));
      }
    }

    return InvitationInfo(
        id: json['id'],
        contentType: json['ct'],
        contentId: json['ci'],
        content: json['content'] != null ? RawInvite.fromJson(json['content']) : null,
        inviteComponent: json['comp'] != null ? InviteComponent.fromJson(json['comp']) : null,
        timezones: timezones,
        mimeParts: mimeParts,
        attachments: json['attach'] != null ? AttachmentsInfo.fromJson(json['attach']) : null,
        categories: categories,
        comments: comments,
        contacts: contacts,
        geo: json['geo'] != null ? GeoInfo.fromJson(json['geo']) : null,
        attendees: attendees,
        alarms: alarms,
        xProps: xProps,
        fragment: json['fr'] != null ? json['fr']['_content'] : null,
        description: json['desc'] != null ? json['desc']['_content'] : null,
        htmlDescription: json['descHtml'] != null ? json['descHtml']['_content'] : null,
        organizer: json['or'] != null ? CalOrganizer.fromJson(json['or']) : null,
        recurrence: json['recur'] != null ? RecurrenceInfo.fromJson(json['recur']) : null,
        exceptionId: json['exceptId'] != null ? ExceptionRecurIdInfo.fromJson(json['exceptId']) : null,
        dtStart: json['s'] != null ? DtTimeInfo.fromJson(json['s']) : null,
        dtEnd: json['e'] != null ? DtTimeInfo.fromJson(json['e']) : null,
        duration: json['dur'] != null ? DurationInfo.fromJson(json['dur']) : null,
        method: json['method'],
        componentNum: json['compNum'],
        rsvp: json['rsvp'],
        priority: json['priority'],
        name: json['name'],
        location: json['loc'],
        percentComplete: json['percentComplete'],
        completed: json['completed'],
        freeBusyActual: freeBusyActual,
        freeBusy: freeBusy,
        transparency: transparency,
        isOrganizer: json['isOrg'],
        xUid: json['x_uid'],
        uid: json['uid'],
        sequence: json['seq'],
        dateTime: json['d'],
        calItemId: json['calItemId'],
        deprecatedApptId: json['apptId'],
        calItemFolder: json['ciFolder'],
        status: status,
        calClass: calClass,
        url: json['url'],
        isException: json['ex'],
        recurIdZ: json['ridZ'],
        isAllDay: json['allDay'],
        isDraft: json['draft'],
        neverSent: json['neverSent'],
        changes: json['changes']);
  }

  @override
  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (contentType != null) 'ct': contentType,
        if (contentId != null) 'ci': contentId,
        if (content != null) 'content': content!.toJson(),
        if (inviteComponent != null) 'comp': inviteComponent!.toJson(),
        if (timezones.isNotEmpty) 'tz': timezones.map((tz) => tz.toJson()).toList(),
        if (mimeParts.isNotEmpty) 'mp': mimeParts.map((mp) => mp.toJson()).toList(),
        if (attachments != null) 'attach': attachments!.toJson(),
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
