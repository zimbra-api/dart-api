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

  const Acl({
    this.internalGrantExpiry,
    this.guestGrantExpiry,
    this.grants = const [],
  });

  factory Acl.fromMap(Map<String, dynamic> data) => Acl(
      internalGrantExpiry: int.tryParse(data['internalGrantExpiry']?.toString() ?? ''),
      guestGrantExpiry: int.tryParse(data['guestGrantExpiry']?.toString() ?? ''),
      grants: (data['grant'] is Iterable)
          ? (data['grant'] as Iterable).map<Grant>((grant) => Grant.fromMap(grant)).toList(growable: false)
          : const []);

  Map<String, dynamic> toMap() => {
        if (internalGrantExpiry != null) 'internalGrantExpiry': internalGrantExpiry,
        if (guestGrantExpiry != null) 'guestGrantExpiry': guestGrantExpiry,
        if (grants.isNotEmpty) 'grant': grants.map((grant) => grant.toMap()).toList(growable: false),
      };
}
