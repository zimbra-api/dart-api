// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/policy_type.dart';

class Policy {
  /// Retention policy type
  final PolicyType? type;

  /// The id
  final String? id;

  /// The name
  final String? name;

  /// The duration
  final String? lifetime;

  Policy({this.type, this.id, this.name, this.lifetime});

  factory Policy.fromJson(Map<String, dynamic> json) => Policy(
      type: PolicyType.values.firstWhere(
        (gt) => gt.name == json['type'],
        orElse: () => PolicyType.user,
      ),
      id: json['id'],
      name: json['name'],
      lifetime: json['lifetime']);

  Map<String, dynamic> toJson() => {
        if (type != null) 'type': type!.name,
        if (id != null) 'id': id,
        if (name != null) 'name': name,
        if (lifetime != null) 'lifetime': lifetime,
      };
}
