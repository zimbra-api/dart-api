// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/invite_type.dart';

import 'cal_tz_info.dart';
import 'calendar_reply.dart';
import 'invite_component_with_group_info.dart';

/// Invite information
class InviteWithGroupInfo {
  /// Invite type - appt|task
  final InviteType calItemType;

  /// Timezones
  final List<CalTZInfo> timezones;

  /// Invite components
  final List<InviteComponentWithGroupInfo> inviteComponents;

  /// Replies
  final List<CalendarReply> calendarReplies;

  InviteWithGroupInfo(this.calItemType,
      {this.timezones = const [], this.inviteComponents = const [], this.calendarReplies = const []});

  factory InviteWithGroupInfo.fromJson(Map<String, dynamic> json) => InviteWithGroupInfo(
      InviteType.values.firstWhere(
        (item) => item.name == json['type'],
        orElse: () => InviteType.appt,
      ),
      timezones: (json['tz'] is Iterable)
          ? List.from((json['tz'] as Iterable).map<CalTZInfo>((tz) => CalTZInfo.fromJson(tz)))
          : [],
      inviteComponents: (json['comp'] is Iterable)
          ? List.from((json['comp'] as Iterable)
              .map<InviteComponentWithGroupInfo>((comp) => InviteComponentWithGroupInfo.fromJson(comp)))
          : [],
      calendarReplies: (json['replies']?['reply'] is Iterable)
          ? List.from((json['replies']['reply'] as Iterable).map<CalendarReply>((at) => CalendarReply.fromJson(at)))
          : []);

  Map<String, dynamic> toJson() => {
        'type': calItemType.name,
        if (timezones.isNotEmpty) 'tz': timezones.map((tz) => tz.toJson()).toList(),
        if (inviteComponents.isNotEmpty) 'comp': inviteComponents.map((comp) => comp.toJson()).toList(),
        if (calendarReplies.isNotEmpty) 'replies': {'reply': calendarReplies.map((reply) => reply.toJson()).toList()},
      };
}
