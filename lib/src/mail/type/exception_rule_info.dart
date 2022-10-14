// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'recur_id_info.dart';
import 'recurrence_info.dart';

/// Exception rule information
class ExceptionRuleInfo extends RecurIdInfo {
  /// Dates or rules which ADD instances. ADDs are evaluated before EXCLUDEs
  final RecurrenceInfo? add;

  /// Dates or rules which EXCLUDE instances
  final RecurrenceInfo? exclude;

  ExceptionRuleInfo(super.recurrenceRangeType, super.recurrenceId,
      {this.add, this.exclude, super.timezone, super.recurIdZ});

  factory ExceptionRuleInfo.fromJson(Map<String, dynamic> json) =>
      ExceptionRuleInfo(json['rangeType'] ?? 1, json['recurId'] ?? '',
          timezone: json['tz'],
          recurIdZ: json['ridZ'],
          add: json['add'] is Map ? RecurrenceInfo.fromJson(json['add']) : null,
          exclude: json['exclude'] is Map ? RecurrenceInfo.fromJson(json['exclude']) : null);

  @override
  Map<String, dynamic> toJson() => {
        'rangeType': recurrenceRangeType,
        'recurId': recurrenceId,
        if (timezone != null) 'tz': timezone,
        if (recurIdZ != null) 'ridZ': recurIdZ,
        if (add != null) 'add': add!.toJson(),
        if (exclude != null) 'exclude': exclude!.toJson(),
      };
}
