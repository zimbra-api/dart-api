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

  factory MPInviteInfo.fromJson(Map<String, dynamic> json) => MPInviteInfo(
      calItemType: InviteType.values.firstWhere(
        (reply) => reply.name == json['reply'],
        orElse: () => InviteType.appt,
      ),
      timezones: (json['tz'] is Iterable)
          ? List.from((json['tz'] as Iterable).map<CalTZInfo>((tz) => CalTZInfo.fromJson(tz)))
          : [],
      calendarReplies: (json['replies']?['reply'] is Iterable)
          ? List.from(
              (json['replies']?['reply'] as Iterable).map<CalendarReply>((reply) => CalendarReply.fromJson(reply)))
          : [],
      inviteComponents: (json['comp'] is Iterable)
          ? List.from((json['comp'] as Iterable).map<InviteComponent>((tz) => InviteComponent.fromJson(tz)))
          : []);

  Map<String, dynamic> toJson() => {
        if (calItemType != null) 'type': calItemType!.name,
        if (timezones.isNotEmpty) 'tz': timezones.map((tz) => tz.toJson()).toList(),
        if (calendarReplies.isNotEmpty) 'replies': {'reply': calendarReplies.map((reply) => reply.toJson()).toList()},
        if (inviteComponents.isNotEmpty) 'comp': inviteComponents.map((reply) => reply.toJson()).toList(),
      };
}
