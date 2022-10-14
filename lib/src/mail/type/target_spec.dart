// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/account_by.dart';
import 'package:zimbra_api/src/common/enum/target_type.dart';

/// Target specification
class TargetSpec {
  /// Target type
  final TargetType? targetType;

  /// Select the meaning of {value}
  final AccountBy? accountBy;

  /// The key used to identify the target
  /// Meaning determined by {accountBy}
  final String? value;

  TargetSpec({this.targetType, this.accountBy, this.value});

  factory TargetSpec.fromJson(Map<String, dynamic> json) => TargetSpec(
      targetType: TargetType.values.firstWhere(
        (item) => item.name == json['type'],
        orElse: () => TargetType.account,
      ),
      accountBy: AccountBy.values.firstWhere(
        (item) => item.name == json['by'],
        orElse: () => AccountBy.name,
      ),
      value: json['_content']);

  Map<String, dynamic> toJson() => {
        if (targetType != null) 'type': targetType!.name,
        if (accountBy != null) 'by': accountBy!.name,
        if (value != null) '_content': value,
      };
}
