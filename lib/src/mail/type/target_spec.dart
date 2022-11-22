// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/account_by.dart';
import '../../common/enum/target_type.dart';

/// Target specification
class TargetSpec {
  /// Target type
  final TargetType? targetType;

  /// Select the meaning of {value}
  final AccountBy? accountBy;

  /// The key used to identify the target
  /// Meaning determined by {accountBy}
  final String? value;

  const TargetSpec({this.targetType, this.accountBy, this.value});

  factory TargetSpec.fromMap(Map<String, dynamic> data) => TargetSpec(
      targetType: TargetType.values.firstWhere(
        (item) => item.name == data['type'],
        orElse: () => TargetType.account,
      ),
      accountBy: AccountBy.values.firstWhere(
        (item) => item.name == data['by'],
        orElse: () => AccountBy.name,
      ),
      value: data['_content']);

  Map<String, dynamic> toMap() => {
        if (targetType != null) 'type': targetType!.name,
        if (accountBy != null) 'by': accountBy!.name,
        if (value != null) '_content': value,
      };
}
