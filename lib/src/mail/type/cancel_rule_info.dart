// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'recur_id_info.dart';

/// Cancel rule information
class CancelRuleInfo extends RecurIdInfo {
  const CancelRuleInfo(super.recurrenceRangeType, super.recurrenceId, {super.timezone, super.recurIdZ});

  factory CancelRuleInfo.fromMap(Map<String, dynamic> data) =>
      CancelRuleInfo(int.tryParse(data['rangeType']?.toString() ?? '') ?? 1, data['recurId'] ?? '',
          timezone: data['tz'], recurIdZ: data['ridZ']);
}
