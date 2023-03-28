// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/participation_status.dart';
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

  const SetCalendarItemInfo({this.partStat, this.msg});

  factory SetCalendarItemInfo.fromMap(
    Map<String, dynamic> data,
  ) =>
      SetCalendarItemInfo(
        partStat: ParticipationStatus.values.firstWhere(
          (ptst) => ptst.name == data['ptst'],
          orElse: () => ParticipationStatus.completed,
        ),
        msg: data['m'] is Map ? Msg.fromMap(data['m']) : null,
      );

  Map<String, dynamic> toMap() => {
        if (partStat != null) 'ptst': partStat!.name,
        if (msg != null) 'm': msg!.toMap(),
      };
}
