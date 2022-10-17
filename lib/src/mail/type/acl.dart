// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'grant.dart';

/// Access control level
class Acl {
  /// Time when grants to internal grantees expire.
  final int? internalGrantExpiry;

  /// Time when grants to guest grantees expire.
  final int? guestGrantExpiry;

  /// Grants
  final List<Grant> grants;

  Acl({this.internalGrantExpiry, this.guestGrantExpiry, this.grants = const []});

  factory Acl.fromJson(Map<String, dynamic> json) => Acl(
      internalGrantExpiry: json['internalGrantExpiry'],
      guestGrantExpiry: json['guestGrantExpiry'],
      grants: (json['grant'] is Iterable)
          ? List.from((json['grant'] as Iterable).map<Grant>((grant) => Grant.fromJson(grant)))
          : []);

  Map<String, dynamic> toJson() => {
        if (internalGrantExpiry != null) 'internalGrantExpiry': internalGrantExpiry,
        if (guestGrantExpiry != null) 'guestGrantExpiry': guestGrantExpiry,
        if (grants.isNotEmpty) 'grant': grants.map((grant) => grant.toJson()).toList(),
      };
}
