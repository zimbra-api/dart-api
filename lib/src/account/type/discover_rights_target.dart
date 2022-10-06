// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/target_type.dart';

import 'discover_rights_email.dart';

class DiscoverRightsTarget {
  /// Target type
  final TargetType type;

  /// Target ID
  String? id;

  /// Target name
  String? name;

  /// If a discovered target is an account or a group and the entry has a display name set then this is set to that display name.
  String? displayName;

  /// Email addresses
  final List<DiscoverRightsEmail> emails;

  DiscoverRightsTarget(
      {this.type = TargetType.account,
      this.id,
      this.name,
      this.displayName,
      this.emails = const <DiscoverRightsEmail>[]});

  factory DiscoverRightsTarget.fromJson(Map<String, dynamic> json) {
    final type = TargetType.values.firstWhere(
      (item) => item.name == json['type']?.toString(),
      orElse: () => TargetType.account,
    );

    final target = DiscoverRightsTarget(type: type, id: json['id'], name: json['name'], displayName: json['d']);

    if (json['email'] != null && json['email'] is Iterable) {
      final emails = json['email'] as Iterable;
      for (final email in emails) {
        target.emails.add(DiscoverRightsEmail.fromJson(email));
      }
    }

    return target;
  }

  Map<String, dynamic> toJson() => {
        'type': type.name,
        if (id != null) 'id': id,
        if (name != null) 'name': name,
        if (displayName != null) 'd': displayName,
        if (emails.isNotEmpty) 'email': emails.map((email) => email.toJson()),
      };
}
