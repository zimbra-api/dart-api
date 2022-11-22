// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/target_by.dart';
import '../../common/enum/target_type.dart';
import 'check_rights_right_info.dart';

class CheckRightsTargetInfo {
  final TargetType targetType;

  final TargetBy targetBy;

  final String targetKey;

  final bool allow;

  final List<CheckRightsRightInfo> rights;

  const CheckRightsTargetInfo({
    this.targetType = TargetType.account,
    this.targetBy = TargetBy.name,
    this.targetKey = '',
    this.allow = false,
    this.rights = const [],
  });

  factory CheckRightsTargetInfo.fromMap(Map<String, dynamic> data) => CheckRightsTargetInfo(
        targetType: TargetType.values.firstWhere(
          (item) => item.name == data['type'],
          orElse: () => TargetType.account,
        ),
        targetBy: TargetBy.values.firstWhere(
          (item) => item.name == data['by'],
          orElse: () => TargetBy.name,
        ),
        targetKey: data['key'] ?? '',
        allow: data['allow'] ?? false,
        rights: (data['right'] is Iterable)
            ? (data['right'] as Iterable)
                .map<CheckRightsRightInfo>((right) => CheckRightsRightInfo.fromMap(right))
                .toList(growable: false)
            : const [],
      );

  Map<String, dynamic> toMap() => {
        'type': targetType.name,
        'by': targetBy.name,
        'key': targetKey,
        'allow': allow,
        if (rights.isNotEmpty) 'right': rights.map((right) => right.toMap()).toList(growable: false),
      };
}
