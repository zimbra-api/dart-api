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

  factory ExceptionRuleInfo.fromMap(Map<String, dynamic> data) =>
      ExceptionRuleInfo(int.tryParse(data['rangeType']?.toString() ?? '') ?? 1, data['recurId'] ?? '',
          timezone: data['tz'],
          recurIdZ: data['ridZ'],
          add: data['add'] is Map ? RecurrenceInfo.fromMap(data['add']) : null,
          exclude: data['exclude'] is Map ? RecurrenceInfo.fromMap(data['exclude']) : null);

  @override
  Map<String, dynamic> toMap() => {
        'rangeType': recurrenceRangeType,
        'recurId': recurrenceId,
        if (timezone != null) 'tz': timezone,
        if (recurIdZ != null) 'ridZ': recurIdZ,
        if (add != null) 'add': add!.toMap(),
        if (exclude != null) 'exclude': exclude!.toMap(),
      };
}
