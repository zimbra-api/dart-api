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

  factory CheckRightsTargetSpec.fromMap(Map<String, dynamic> data) => CheckRightsTargetSpec(
        targetType: TargetType.values.firstWhere(
          (item) => item.name == data['type']?.toString(),
          orElse: () => TargetType.account,
        ),
        targetBy: TargetBy.values.firstWhere(
          (item) => item.name == data['by']?.toString(),
          orElse: () => TargetBy.name,
        ),
        targetKey: data['key'] ?? '',
        rights: (data['right'] is Iterable)
            ? List.from((data['right'] as Iterable).map<String>((right) => right['_content']))
            : [],
      );

  Map<String, dynamic> toMap() => {
        'type': targetType.name,
        'by': targetBy.name,
        'key': targetKey,
        if (rights.isNotEmpty) 'right': rights.map((right) => {'_content': right}).toList(),
      };
}
