// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/target_by.dart';
import 'package:zimbra_api/src/common/enum/target_type.dart';

import 'check_rights_right_info.dart';

class CheckRightsTargetInfo {
  final TargetType targetType;

  final TargetBy targetBy;

  final String targetKey;

  final bool allow;

  final List<CheckRightsRightInfo> rights;

  CheckRightsTargetInfo(
      {this.targetType = TargetType.account,
      this.targetBy = TargetBy.name,
      this.targetKey = '',
      this.allow = false,
      this.rights = const []});

  factory CheckRightsTargetInfo.fromJson(Map<String, dynamic> json) => CheckRightsTargetInfo(
        targetType: TargetType.values.firstWhere(
          (item) => item.name == json['type'],
          orElse: () => TargetType.account,
        ),
        targetBy: TargetBy.values.firstWhere(
          (item) => item.name == json['by'],
          orElse: () => TargetBy.name,
        ),
        targetKey: json['key'] ?? '',
        allow: json['allow'] ?? false,
        rights: (json['right'] is Iterable)
            ? List.from(
                (json['right'] as Iterable).map<CheckRightsRightInfo>((right) => CheckRightsRightInfo.fromJson(right)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        'type': targetType.name,
        'by': targetBy.name,
        'key': targetKey,
        'allow': allow,
        if (rights.isNotEmpty) 'right': rights.map((right) => right.toJson()).toList(),
      };
}
