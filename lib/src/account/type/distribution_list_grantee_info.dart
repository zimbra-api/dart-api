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

  const DistributionListGranteeInfo(this.type, {this.id, this.name});

  factory DistributionListGranteeInfo.fromMap(Map<String, dynamic> data) => DistributionListGranteeInfo(
      GranteeType.values.firstWhere(
        (type) => type.name == data['type'],
        orElse: () => GranteeType.all,
      ),
      id: data['id'],
      name: data['name']);

  Map<String, dynamic> toMap() => {
        'type': type.name,
        if (id != null) 'id': id,
        if (name != null) 'name': name,
      };
}
