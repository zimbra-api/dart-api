// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/participation_status.dart';

import 'xparam.dart';

/// Calendar attendee information
class CalendarAttendee {
  /// Email address (without "MAILTO:")
  final String? address;

  /// URL - has same value as email-address.
  final String? url;

  /// Friendly name - "CN" in iCalendar
  final String? displayName;

  /// iCalendar SENT-BY
  final String? sentBy;

  /// iCalendar DIR - Reference to a directory entry associated with the calendar user. the property.
  final String? dir;

  /// iCalendar LANGUAGE - As defined in RFC5646 * (e.g. "en-US")
  final String? language;

  /// iCalendar CUTYPE (Calendar user type)
  final String? cuType;

  /// iCalendar ROLE
  final String? role;

  /// iCalendar PTST (Participation status)
  /// Valid values - NE|AC|TE|DE|DG|CO|IN|WE|DF
  /// Meanings:
  /// "NE"eds-action, "TE"ntative, "AC"cept, "DE"clined, "DG" (delegated), "CO"mpleted (todo), "IN"-process (todo),
  /// "WA"iting (custom value only for todo), "DF" (deferred; custom value only for todo)
  final ParticipationStatus? partStat;

  /// RSVP flag.  Set if response requested, unset if no response requested
  final bool? rsvp;

  /// iCalendar MEMBER - The group or list membership of the calendar user
  final String? member;

  /// iCalendar DELEGATED-TO
  final String? delegatedTo;

  /// iCalendar DELEGATED-FROM
  final String? delegatedFrom;

  /// Non-standard parameters (XPARAMs)
  final List<XParam> xParams;

  CalendarAttendee(
      {this.address,
      this.url,
      this.displayName,
      this.sentBy,
      this.dir,
      this.language,
      this.cuType,
      this.role,
      this.partStat,
      this.rsvp,
      this.member,
      this.delegatedTo,
      this.delegatedFrom,
      this.xParams = const []});

  factory CalendarAttendee.fromMap(Map<String, dynamic> data) => CalendarAttendee(
        address: data['a'],
        url: data['url'],
        displayName: data['d'],
        sentBy: data['sentBy'],
        dir: data['dir'],
        language: data['lang'],
        cuType: data['cutype'],
        role: data['role'],
        partStat: ParticipationStatus.values.firstWhere(
          (item) => item.name == data['ptst'],
          orElse: () => ParticipationStatus.inProcess,
        ),
        rsvp: data['rsvp'],
        member: data['member'],
        delegatedTo: data['delegatedTo'],
        delegatedFrom: data['delegatedFrom'],
        xParams: (data['xparam'] is Iterable)
            ? (data['xparam'] as Iterable).map<XParam>((xparam) => XParam.fromMap(xparam)).toList(growable: false)
            : const [],
      );

  Map<String, dynamic> toMap() => {
        if (address != null) 'a': address,
        if (url != null) 'url': url,
        if (displayName != null) 'd': displayName,
        if (sentBy != null) 'sentBy': sentBy,
        if (dir != null) 'dir': dir,
        if (language != null) 'lang': language,
        if (cuType != null) 'cutype': cuType,
        if (role != null) 'role': role,
        if (partStat != null) 'ptst': partStat!.name,
        if (rsvp != null) 'rsvp': rsvp,
        if (member != null) 'member': member,
        if (delegatedTo != null) 'delegatedTo': delegatedTo,
        if (delegatedFrom != null) 'delegatedFrom': delegatedFrom,
        if (xParams.isNotEmpty) 'xparam': xParams.map((xparam) => xparam.toMap()).toList(growable: false),
      };
}
