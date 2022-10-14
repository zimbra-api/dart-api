// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/free_busy_status.dart';
import 'package:zimbra_api/src/common/enum/invite_class.dart';
import 'package:zimbra_api/src/common/enum/invite_status.dart';
import 'package:zimbra_api/src/common/enum/transparency.dart';

/// Invite component common information
class InviteComponentCommon {
  /// method
  final String? method;

  /// Component number of the invite
  final int? componentNum;

  /// RSVP flag. Set if response requested, unset if no response requested
  final bool? rsvp;

  /// Priority (0 - 9; default = 0)
  final String? priority;

  /// Name
  final String? name;

  /// Location
  final String? location;

  /// Percent complete for VTODO (0 - 100; default = 0)
  final String? percentComplete;

  /// VTODO COMPLETED DATE-TIME in format: yyyyMMddThhmmssZ
  final String? completed;

  /// Set if invite has no blob data, i.e. all data is in db metadata
  final bool? noBlob;

  /// The "actual" free-busy status of this invite (ie what the client should display).
  /// Valid values - F|B|T|U.  i.e. Free, Busy (default), busy-Tentative, OutOfOffice (busy-unavailable)
  final FreeBusyStatus? freeBusyActual;

  /// FreeBusy setting F|B|T|U
  /// i.e. Free, Busy (default), busy-Tentative, OutOfOffice (busy-unavailable)
  final FreeBusyStatus? freeBusy;

  /// Transparency - O|T.  i.e. Opaque or Transparent
  final Transparency? transparency;

  /// Am I the organizer?  [default false]
  final bool? isOrganizer;

  /// x uid
  final String? xUid;

  /// UID to use when creating appointment. Optional: client can request the UID to use
  final String? uid;

  /// Sequence number (default = 0)
  final int? sequence;

  /// Date - used for zdsync
  final int? dateTime;

  /// Mail item ID of appointment
  final String? calItemId;

  /// Appointment ID (deprecated)
  final String? deprecatedApptId;

  /// Folder of appointment
  final String? calItemFolder;

  /// Status - TENT|CONF|CANC|NEED|COMP|INPR|WAITING|DEFERRED
  /// i.e. TENTative, CONFirmed, CANCelled, COMPleted, INPRogress, WAITING, DEFERRED
  /// where waiting and Deferred are custom values not found in the iCalendar spec.
  final InviteStatus? status;

  /// Class = PUB|PRI|CON.  i.e. PUBlic (default), PRIvate, CONfidential
  final InviteClass? calClass;

  /// URL
  final String? url;

  /// Set if this is invite is an exception
  final bool? isException;

  /// Recurrence-id string in UTC timezone
  final String? recurIdZ;

  /// Set if is an all day appointment
  final bool? isAllDay;

  /// Set if invite has changes that haven't been sent to attendees; for organizer only
  final bool? isDraft;

  /// Set if attendees were never notified of this invite; for organizer only
  final bool? neverSent;

  /// Comma-separated list of changed data in an updated invite.
  /// Possible values are "subject", "location", "time" (start time, end time, or duration), and "recurrence".
  final String? changes;

  InviteComponentCommon(
      {this.method,
      this.componentNum,
      this.rsvp,
      this.priority,
      this.name,
      this.location,
      this.percentComplete,
      this.completed,
      this.noBlob,
      this.freeBusyActual,
      this.freeBusy,
      this.transparency,
      this.isOrganizer,
      this.xUid,
      this.uid,
      this.sequence,
      this.dateTime,
      this.calItemId,
      this.deprecatedApptId,
      this.calItemFolder,
      this.status,
      this.calClass,
      this.url,
      this.isException,
      this.recurIdZ,
      this.isAllDay,
      this.isDraft,
      this.neverSent,
      this.changes});

  factory InviteComponentCommon.fromJson(Map<String, dynamic> json) => InviteComponentCommon(
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
        changes: json['changes'],
      );

  Map<String, dynamic> toJson() => {
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
