// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/address_type.dart';

/// Email Address Information
class EmailAddrInfo {
  /// Email address
  final String address;

  /// Optional Address type - (f)rom, (t)o, (c)c, (b)cc, (r)eply-to,
  /// (s)ender, read-receipt (n)otification, (rf) resent-from
  final AddressType? addressType;

  /// The comment/name part of an address
  final String? personal;

  const EmailAddrInfo(this.address, {this.addressType, this.personal});

  factory EmailAddrInfo.fromMap(Map<String, dynamic> data) => EmailAddrInfo(data['a'] ?? '',
      addressType: AddressType.values.firstWhere(
        (item) => item.name == data['t'],
        orElse: () => AddressType.from,
      ),
      personal: data['p']);

  Map<String, dynamic> toMap() => {
        'a': address,
        if (addressType != null) 't': addressType!.name,
        if (personal != null) 'p': personal,
      };
}
