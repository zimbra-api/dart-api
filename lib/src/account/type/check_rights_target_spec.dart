// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/target_by.dart';
import 'package:zimbra_api/src/common/enum/target_type.dart';

class CheckRightsTargetSpec {
  final TargetType targetType;

  final TargetBy targetBy;

  final String targetKey;

  final List<String> rights;

  CheckRightsTargetSpec(
      {this.targetType = TargetType.account,
      this.targetBy = TargetBy.name,
      this.targetKey = '',
      this.rights = const []});

  factory CheckRightsTargetSpec.fromJson(Map<String, dynamic> json) => CheckRightsTargetSpec(
        targetType: TargetType.values.firstWhere(
          (item) => item.name == json['type']?.toString(),
          orElse: () => TargetType.account,
        ),
        targetBy: TargetBy.values.firstWhere(
          (item) => item.name == json['by']?.toString(),
          orElse: () => TargetBy.name,
        ),
        targetKey: json['key'] ?? '',
        rights: (json['right'] is Iterable)
            ? List.from((json['right'] as Iterable).map<String>((right) => right['_content']))
            : [],
      );

  Map<String, dynamic> toJson() => {
        'type': targetType.name,
        'by': targetBy.name,
        'key': targetKey,
        if (rights.isNotEmpty) 'right': rights.map((right) => {'_content': right}).toList(),
      };
}
