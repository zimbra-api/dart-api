// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// Recurrence ID Information
class RecurIdInfo {
  /// Recurrence range type
  final int recurrenceRangeType;

  /// Recurrence ID in format : YYMMDD[THHMMSS[Z]]
  final String recurrenceId;

  /// Timezone name
  final String? timezone;

  /// Recurrence-id in UTC time zone; used in non-all-day appointments only
  /// Format: YYMMDDTHHMMSSZ
  final String? recurIdZ;

  RecurIdInfo(this.recurrenceRangeType, this.recurrenceId, {this.timezone, this.recurIdZ});

  factory RecurIdInfo.fromJson(Map<String, dynamic> json) =>
      RecurIdInfo(json['rangeType'] ?? 1, json['recurId'] ?? '', timezone: json['tz'], recurIdZ: json['ridZ']);

  Map<String, dynamic> toJson() => {
        'rangeType': recurrenceRangeType,
        'recurId': recurrenceId,
        if (timezone != null) 'tz': timezone,
        if (recurIdZ != null) 'ridZ': recurIdZ,
      };
}
