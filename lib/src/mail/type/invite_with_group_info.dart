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

  factory InviteWithGroupInfo.fromMap(Map<String, dynamic> data) => InviteWithGroupInfo(
      InviteType.values.firstWhere(
        (item) => item.name == data['type'],
        orElse: () => InviteType.appt,
      ),
      timezones: (data['tz'] is Iterable)
          ? (data['tz'] as Iterable).map<CalTZInfo>((tz) => CalTZInfo.fromMap(tz)).toList(growable: false)
          : const [],
      inviteComponents: (data['comp'] is Iterable)
          ? (data['comp'] as Iterable)
              .map<InviteComponentWithGroupInfo>((comp) => InviteComponentWithGroupInfo.fromMap(comp))
              .toList(growable: false)
          : const [],
      calendarReplies: (data['replies']?['reply'] is Iterable)
          ? (data['replies']['reply'] as Iterable)
              .map<CalendarReply>((at) => CalendarReply.fromMap(at))
              .toList(growable: false)
          : const []);

  Map<String, dynamic> toMap() => {
        'type': calItemType.name,
        if (timezones.isNotEmpty) 'tz': timezones.map((tz) => tz.toMap()).toList(growable: false),
        if (inviteComponents.isNotEmpty) 'comp': inviteComponents.map((comp) => comp.toMap()).toList(growable: false),
        if (calendarReplies.isNotEmpty)
          'replies': {'reply': calendarReplies.map((reply) => reply.toMap()).toList(growable: false)},
      };
}
