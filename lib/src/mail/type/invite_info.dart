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

  const InviteInfo(
    this.calItemType, {
    this.timezones = const [],
    this.inviteComponent,
    this.calendarReplies = const [],
  });

  factory InviteInfo.fromMap(Map<String, dynamic> data) => InviteInfo(
      InviteType.values.firstWhere(
        (item) => item.name == data['type'],
        orElse: () => InviteType.appt,
      ),
      timezones: (data['tz'] is Iterable)
          ? (data['tz'] as Iterable).map<CalTZInfo>((tz) => CalTZInfo.fromMap(tz)).toList(growable: false)
          : const [],
      inviteComponent: data['comp'] is Map ? InviteComponent.fromMap(data['comp']) : null,
      calendarReplies: (data['replies']?['reply'] is Iterable)
          ? (data['replies']['reply'] as Iterable)
              .map<CalendarReply>((at) => CalendarReply.fromMap(at))
              .toList(growable: false)
          : const []);

  Map<String, dynamic> toMap() => {
        'type': calItemType.name,
        if (timezones.isNotEmpty) 'tz': timezones.map((tz) => tz.toMap()).toList(growable: false),
        if (inviteComponent != null) 'comp': inviteComponent!.toMap(),
        if (calendarReplies.isNotEmpty)
          'replies': {'reply': calendarReplies.map((reply) => reply.toMap()).toList(growable: false)},
      };
}
