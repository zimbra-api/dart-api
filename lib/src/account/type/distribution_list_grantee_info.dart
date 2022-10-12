// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/grantee_type.dart';

class DistributionListGranteeInfo {
  /// Grantee type
  final GranteeType type;

  /// Grantee id
  final String? id;

  /// Grantee name
  final String? name;

  DistributionListGranteeInfo(this.type, {this.id, this.name});

  factory DistributionListGranteeInfo.fromJson(Map<String, dynamic> json) => DistributionListGranteeInfo(
      GranteeType.values.firstWhere(
        (item) => item.name == json['type']?.toString(),
        orElse: () => GranteeType.all,
      ),
      id: json['id'],
      name: json['name']);

  Map<String, dynamic> toJson() => {
        'type': type.name,
        if (id != null) 'id': id,
        if (name != null) 'name': name,
      };
}
