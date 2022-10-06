// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/target_by.dart';
import 'package:zimbra_api/src/common/enum/target_type.dart';

import 'check_rights_right_info.dart';

class CheckRightsTargetInfo {
  TargetType targetType;

  TargetBy targetBy;

  String targetKey;

  bool allow;

  List<CheckRightsRightInfo> rights = <CheckRightsRightInfo>[];

  CheckRightsTargetInfo(
      {this.targetType = TargetType.account, this.targetBy = TargetBy.name, this.targetKey = '', this.allow = false});

  factory CheckRightsTargetInfo.fromJson(Map<String, dynamic> json) {
    final targetType = TargetType.values.firstWhere(
      (item) => item.name == json['type']?.toString(),
      orElse: () => TargetType.account,
    );

    final targetBy = TargetBy.values.firstWhere(
      (item) => item.name == json['by']?.toString(),
      orElse: () => TargetBy.name,
    );

    final info = CheckRightsTargetInfo(
        targetType: targetType, targetBy: targetBy, targetKey: json['key'] ?? '', allow: json['allow'] ?? false);

    if (json['right'] != null && json['pref'] is Iterable) {
      final rights = json['right'] as Iterable;
      for (final right in rights) {
        info.rights.add(CheckRightsRightInfo.fromJson(right));
      }
    }

    return info;
  }

  Map<String, dynamic> toJson() => {
        'type': targetType.name,
        'by': targetBy.name,
        'key': targetKey,
        'allow': allow,
        if (rights.isNotEmpty) 'right': rights.map((right) => right.toJson()),
      };
}
