// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/invite_type.dart';

import 'cal_tz_info.dart';
import 'calendar_reply.dart';
import 'invite_component.dart';

/// MP invite information
class MPInviteInfo {
  /// Calendar item type - appt|task
  final InviteType? calItemType;

  /// Timezones
  final List<CalTZInfo> timezones;

  /// List of replies received from attendees.
  final List<CalendarReply> calendarReplies;

  /// Invite components
  final List<InviteComponent> inviteComponents;

  MPInviteInfo(
      {this.calItemType, this.timezones = const [], this.calendarReplies = const [], this.inviteComponents = const []});

  factory MPInviteInfo.fromMap(Map<String, dynamic> data) => MPInviteInfo(
      calItemType: InviteType.values.firstWhere(
        (reply) => reply.name == data['reply'],
        orElse: () => InviteType.appt,
      ),
      timezones: (data['tz'] is Iterable)
          ? List.from((data['tz'] as Iterable).map<CalTZInfo>((tz) => CalTZInfo.fromMap(tz)))
          : [],
      calendarReplies: (data['replies']?['reply'] is Iterable)
          ? List.from(
              (data['replies']?['reply'] as Iterable).map<CalendarReply>((reply) => CalendarReply.fromMap(reply)))
          : [],
      inviteComponents: (data['comp'] is Iterable)
          ? List.from((data['comp'] as Iterable).map<InviteComponent>((tz) => InviteComponent.fromMap(tz)))
          : []);

  Map<String, dynamic> toMap() => {
        if (calItemType != null) 'type': calItemType!.name,
        if (timezones.isNotEmpty) 'tz': timezones.map((tz) => tz.toMap()).toList(),
        if (calendarReplies.isNotEmpty) 'replies': {'reply': calendarReplies.map((reply) => reply.toMap()).toList()},
        if (inviteComponents.isNotEmpty) 'comp': inviteComponents.map((reply) => reply.toMap()).toList(),
      };
}
