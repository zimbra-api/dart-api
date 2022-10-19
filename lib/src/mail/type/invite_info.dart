// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/invite_type.dart';

import 'cal_tz_info.dart';
import 'calendar_reply.dart';
import 'invite_component.dart';

/// Invite information
class InviteInfo {
  /// Invite type - appt|task
  final InviteType calItemType;

  /// Timezones
  final List<CalTZInfo> timezones;

  /// Invite components
  final InviteComponent? inviteComponent;

  /// List of replies received from attendees.
  final List<CalendarReply> calendarReplies;

  InviteInfo(this.calItemType, {this.timezones = const [], this.inviteComponent, this.calendarReplies = const []});

  factory InviteInfo.fromJson(Map<String, dynamic> json) => InviteInfo(
      InviteType.values.firstWhere(
        (item) => item.name == json['type'],
        orElse: () => InviteType.appt,
      ),
      timezones: (json['tz'] is Iterable)
          ? List.from((json['tz'] as Iterable).map<CalTZInfo>((tz) => CalTZInfo.fromJson(tz)))
          : [],
      inviteComponent: json['comp'] is Map ? InviteComponent.fromJson(json['comp']) : null,
      calendarReplies: (json['replies']?['reply'] is Iterable)
          ? List.from((json['replies']['reply'] as Iterable).map<CalendarReply>((at) => CalendarReply.fromJson(at)))
          : []);

  Map<String, dynamic> toJson() => {
        'type': calItemType.name,
        if (timezones.isNotEmpty) 'tz': timezones.map((tz) => tz.toJson()).toList(),
        if (inviteComponent != null) 'comp': inviteComponent!.toJson(),
        if (calendarReplies.isNotEmpty) 'replies': {'reply': calendarReplies.map((reply) => reply.toJson()).toList()},
      };
}
