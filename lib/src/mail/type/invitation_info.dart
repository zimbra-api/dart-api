// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/free_busy_status.dart';
import '../../common/enum/invite_class.dart';
import '../../common/enum/invite_status.dart';
import '../../common/enum/transparency.dart';
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

  const InvitationInfo({
    this.id,
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
    super.changes,
  });

  factory InvitationInfo.fromMap(Map<String, dynamic> data) => InvitationInfo(
        id: data['id'],
        contentType: data['ct'],
        contentId: data['ci'],
        content: data['content'] != null
            ? RawInvite.fromMap(
                data['content'],
              )
            : null,
        inviteComponent: data['comp'] != null
            ? InviteComponent.fromMap(
                data['comp'],
              )
            : null,
        timezones: (data['tz'] is Iterable)
            ? (data['tz'] as Iterable)
                .map<CalTZInfo>(
                  (tz) => CalTZInfo.fromMap(tz),
                )
                .toList(growable: false)
            : const [],
        mimeParts: (data['mp'] is Iterable)
            ? (data['mp'] as Iterable)
                .map<MimePartInfo>(
                  (mp) => MimePartInfo.fromMap(mp),
                )
                .toList(growable: false)
            : const [],
        attachments: data['attach'] != null
            ? AttachmentsInfo.fromMap(
                data['attach'],
              )
            : null,
        categories: (data['category'] is Iterable)
            ? (data['category'] as Iterable)
                .map<String>(
                  (category) => category['_content'],
                )
                .toList(growable: false)
            : const [],
        comments: (data['comment'] is Iterable)
            ? (data['comment'] as Iterable)
                .map<String>(
                  (comment) => comment['_content'],
                )
                .toList(growable: false)
            : const [],
        contacts: (data['contact'] is Iterable)
            ? (data['contact'] as Iterable)
                .map<String>((contact) => contact['_content'])
                .toList(growable: false)
            : const [],
        geo: data['geo'] is Map ? GeoInfo.fromMap(data['geo']) : null,
        attendees: (data['at'] is Iterable)
            ? (data['at'] as Iterable)
                .map<CalendarAttendee>(
                  (at) => CalendarAttendee.fromMap(at),
                )
                .toList(growable: false)
            : const [],
        alarms: (data['alarm'] is Iterable)
            ? (data['alarm'] as Iterable)
                .map<AlarmInfo>(
                  (alarm) => AlarmInfo.fromMap(alarm),
                )
                .toList(growable: false)
            : const [],
        xProps: (data['xprop'] is Iterable)
            ? (data['xprop'] as Iterable)
                .map<XProp>(
                  (xprop) => XProp.fromMap(xprop),
                )
                .toList(growable: false)
            : const [],
        fragment: data['fr'],
        description: data['desc']?['_content'],
        htmlDescription: data['descHtml']?['_content'],
        organizer: data['or'] is Map
            ? CalOrganizer.fromMap(
                data['or'],
              )
            : null,
        recurrence:
            data['recur'] is Map ? RecurrenceInfo.fromMap(data['recur']) : null,
        exceptionId: data['exceptId'] is Map
            ? ExceptionRecurIdInfo.fromMap(
                data['exceptId'],
              )
            : null,
        dtStart: data['s'] is Map
            ? DtTimeInfo.fromMap(
                data['s'],
              )
            : null,
        dtEnd: data['e'] is Map
            ? DtTimeInfo.fromMap(
                data['e'],
              )
            : null,
        duration: data['dur'] is Map
            ? DurationInfo.fromMap(
                data['dur'],
              )
            : null,
        method: data['method'],
        componentNum: int.tryParse(
          data['compNum']?.toString() ?? '',
        ),
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
        changes: data['changes'],
      );

  @override
  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        if (contentType != null) 'ct': contentType,
        if (contentId != null) 'ci': contentId,
        if (content != null) 'content': content!.toMap(),
        if (inviteComponent != null) 'comp': inviteComponent!.toMap(),
        if (timezones.isNotEmpty)
          'tz': timezones
              .map(
                (tz) => tz.toMap(),
              )
              .toList(growable: false),
        if (mimeParts.isNotEmpty)
          'mp': mimeParts
              .map(
                (mp) => mp.toMap(),
              )
              .toList(growable: false),
        if (attachments != null) 'attach': attachments!.toMap(),
        if (categories.isNotEmpty)
          'category': categories
              .map(
                (category) => {'_content': category},
              )
              .toList(growable: false),
        if (comments.isNotEmpty)
          'comment': comments
              .map(
                (comment) => {'_content': comment},
              )
              .toList(growable: false),
        if (contacts.isNotEmpty)
          'contact': contacts
              .map(
                (contact) => {'_content': contact},
              )
              .toList(growable: false),
        if (geo != null) 'geo': geo!.toMap(),
        if (attendees.isNotEmpty)
          'at': attendees
              .map(
                (at) => at.toMap(),
              )
              .toList(growable: false),
        if (alarms.isNotEmpty)
          'alarm': alarms
              .map(
                (alarm) => alarm.toMap(),
              )
              .toList(growable: false),
        if (xProps.isNotEmpty)
          'xprop': xProps
              .map(
                (xprop) => xprop.toMap(),
              )
              .toList(growable: false),
        if (fragment != null) 'fr': fragment,
        if (description != null)
          'desc': {
            '_content': description,
          },
        if (htmlDescription != null)
          'descHtml': {
            '_content': htmlDescription,
          },
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
