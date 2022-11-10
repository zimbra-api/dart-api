// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/participation_status.dart';

import 'recur_id_info.dart';

/// Calendar reply information
class CalendarReply extends RecurIdInfo {
  /// Sequence number
  final int seq;

  /// DTSTAMP date in milliseconds
  final int date;

  /// Attendee address
  final String attendee;

  /// iCalendar SENT-BY
  final String? sentBy;

  /// iCalendar PTST (Participation status)
  /// Valid values: NE|AC|TE|DE|DG|CO|IN|WE|DF
  /// Meanings:
  /// "NE"eds-action, "TE"ntative, "AC"cept, "DE"clined, "DG" (delegated), "CO"mpleted (todo), "IN"-process (todo),
  /// "WA"iting (custom value only for todo), "DF" (deferred; custom value only for todo)
  final ParticipationStatus? partStat;

  CalendarReply(super.recurrenceRangeType, super.recurrenceId, this.seq, this.date, this.attendee,
      {this.sentBy, this.partStat, super.timezone, super.recurIdZ});

  factory CalendarReply.fromMap(Map<String, dynamic> data) => CalendarReply(
      int.tryParse(data['rangeType']?.toString() ?? '') ?? 1,
      data['recurId'] ?? '',
      int.tryParse(data['seq']?.toString() ?? '') ?? 0,
      int.tryParse(data['d']?.toString() ?? '') ?? 0,
      data['at'] ?? '',
      sentBy: data['sentBy'],
      partStat: ParticipationStatus.values.firstWhere(
        (ptst) => ptst.name == data['ptst'],
        orElse: () => ParticipationStatus.accept,
      ),
      timezone: data['tz'],
      recurIdZ: data['ridZ']);

  @override
  Map<String, dynamic> toMap() => {
        'rangeType': recurrenceRangeType,
        'recurId': recurrenceId,
        'seq': seq,
        'd': date,
        'at': attendee,
        if (sentBy != null) 'sentBy': sentBy,
        if (partStat != null) 'ptst': partStat!.name,
        if (timezone != null) 'tz': timezone,
        if (recurIdZ != null) 'ridZ': recurIdZ,
      };
}
