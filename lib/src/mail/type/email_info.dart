// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/address_type.dart';

/// Email information
class EmailInfo {
  /// Email address
  final String? address;

  /// Display name. If we have personal name, first word in "word1 word2" format, or last
  /// word in "word1, word2" format.  If no personal name, take string before "@" in email-address.
  final String? display;

  /// The comment/name part of an address
  final String? personal;

  /// Optional Address type - (f)rom, (t)o, (c)c, (b)cc, (r)eply-to,
  /// (s)ender, read-receipt (n)otification, (rf) resent-from
  final AddressType? addressType;

  /// Set if the email address is a group
  final bool? isGroup;

  /// Flags whether can expand group members
  final bool? canExpandGroupMembers;

  EmailInfo({this.address, this.display, this.personal, this.addressType, this.isGroup, this.canExpandGroupMembers});

  factory EmailInfo.fromMap(Map<String, dynamic> data) => EmailInfo(
        address: data['a'],
        display: data['d'],
        personal: data['p'],
        addressType: AddressType.values.firstWhere(
          (item) => item.name == data['t'],
          orElse: () => AddressType.from,
        ),
        isGroup: data['isGroup'],
        canExpandGroupMembers: data['exp'],
      );

  Map<String, dynamic> toMap() => {
        if (address != null) 'a': address,
        if (display != null) 'd': display,
        if (personal != null) 'p': personal,
        if (addressType != null) 't': addressType!.name,
        if (isGroup != null) 'isGroup': isGroup,
        if (canExpandGroupMembers != null) 'exp': canExpandGroupMembers,
      };
}
