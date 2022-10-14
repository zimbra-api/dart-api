// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'email_addr_info.dart';

class BounceMsgSpec {
  /// ID of message to resend
  final String id;

  /// Email addresses
  final List<EmailAddrInfo> emailAddresses;

  BounceMsgSpec(this.id, {this.emailAddresses = const []});

  factory BounceMsgSpec.fromJson(Map<String, dynamic> json) => BounceMsgSpec(json['id'] ?? '',
      emailAddresses: (json['e'] is Iterable)
          ? List.from((json['e'] as Iterable).map<EmailAddrInfo>((e) => EmailAddrInfo.fromJson(e)))
          : []);

  Map<String, dynamic> toJson() => {
        'id': id,
        if (emailAddresses.isNotEmpty) 'e': emailAddresses.map((e) => e.toJson()).toList(),
      };
}
