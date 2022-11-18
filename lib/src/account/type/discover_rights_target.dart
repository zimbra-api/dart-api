// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/target_type.dart';

import 'discover_rights_email.dart';

class DiscoverRightsTarget {
  /// Target type
  final TargetType type;

  /// Target ID
  final String? id;

  /// Target name
  final String? name;

  /// If a discovered target is an account or a group and the entry has a display name set then this is set to that display name.
  final String? displayName;

  /// Email addresses
  final List<DiscoverRightsEmail> emails;

  const DiscoverRightsTarget({
    this.type = TargetType.account,
    this.id,
    this.name,
    this.displayName,
    this.emails = const [],
  });

  factory DiscoverRightsTarget.fromMap(Map<String, dynamic> data) => DiscoverRightsTarget(
        type: TargetType.values.firstWhere(
          (type) => type.name == data['type'],
          orElse: () => TargetType.account,
        ),
        id: data['id'],
        name: data['name'],
        displayName: data['d'],
        emails: (data['email'] is Iterable)
            ? (data['email'] as Iterable)
                .map<DiscoverRightsEmail>((email) => DiscoverRightsEmail.fromMap(email))
                .toList(growable: false)
            : const [],
      );

  Map<String, dynamic> toMap() => {
        'type': type.name,
        if (id != null) 'id': id,
        if (name != null) 'name': name,
        if (displayName != null) 'd': displayName,
        if (emails.isNotEmpty) 'email': emails.map((email) => email.toMap()).toList(growable: false),
      };
}
