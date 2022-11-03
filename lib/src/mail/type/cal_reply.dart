// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/participation_status.dart';

import 'recur_id_info.dart';

class CalReply extends RecurIdInfo {
  /// Address of attendee who replied
  final String? attendee;

  /// SENT-BY
  final String? sentBy;

  /// iCalendar PTST (Participation status)
  /// Valid values: NE|AC|TE|DE|DG|CO|IN|WE|DF
  /// Meanings:
  /// "NE"eds-action, "TE"ntative, "AC"cept, "DE"clined, "DG" (delegated), "CO"mpleted (todo), "IN"-process (todo),
  /// "WA"iting (custom value only for todo), "DF" (deferred; custom value only for todo)
  final ParticipationStatus? partStat;

  /// Sequence
  final int? sequence;

  /// Timestamp of reply
  final int? date;

  CalReply(super.recurrenceRangeType, super.recurrenceId,
      {this.attendee, this.sentBy, this.partStat, this.sequence, this.date, super.timezone, super.recurIdZ});

  factory CalReply.fromMap(Map<String, dynamic> data) => CalReply(
        data['rangeType'] ?? 1,
        data['recurId'] ?? '',
        attendee: data['at'],
        sentBy: data['sentBy'],
        partStat: ParticipationStatus.values.firstWhere(
          (ptst) => ptst.name == data['ptst'],
          orElse: () => ParticipationStatus.inProcess,
        ),
        sequence: data['seq'],
        date: data['d'],
        timezone: data['tz'],
        recurIdZ: data['ridZ'],
      );

  @override
  Map<String, dynamic> toMap() => {
        'rangeType': recurrenceRangeType,
        'recurId': recurrenceId,
        if (attendee != null) 'at': attendee,
        if (sentBy != null) 'sentBy': sentBy,
        if (partStat != null) 'ptst': partStat!.name,
        if (sequence != null) 'seq': sequence,
        if (date != null) 'd': date,
        if (timezone != null) 'tz': timezone,
        if (recurIdZ != null) 'ridZ': recurIdZ,
      };
}
