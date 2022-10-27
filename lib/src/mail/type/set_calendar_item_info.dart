// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/participation_status.dart';

import 'msg.dart';

class SetCalendarItemInfo {
  /// iCalendar PTST (Participation status)
  /// Valid values: NE|AC|TE|DE|DG|CO|IN|WE|DF
  /// Meanings:
  /// "NE"eds-action, "TE"ntative, "AC"cept, "DE"clined, "DG" (delegated), "CO"mpleted (todo), "IN"-process (todo),
  /// "WA"iting (custom value only for todo), "DF" (deferred; custom value only for todo)
  final ParticipationStatus? partStat;

  /// Message
  final Msg? msg;

  SetCalendarItemInfo({this.partStat, this.msg});

  factory SetCalendarItemInfo.fromJson(Map<String, dynamic> json) => SetCalendarItemInfo(
      partStat: ParticipationStatus.values.firstWhere(
        (ptst) => ptst.name == json['ptst'],
        orElse: () => ParticipationStatus.completed,
      ),
      msg: json['m'] is Map ? Msg.fromJson(json['m']) : null);

  Map<String, dynamic> toJson() => {
        if (partStat != null) 'ptst': partStat!.name,
        if (msg != null) 'm': msg!.toJson(),
      };
}
