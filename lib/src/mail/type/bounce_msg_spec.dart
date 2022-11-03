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

  factory BounceMsgSpec.fromMap(Map<String, dynamic> data) => BounceMsgSpec(data['id'] ?? '',
      emailAddresses: (data['e'] is Iterable)
          ? List.from((data['e'] as Iterable).map<EmailAddrInfo>((e) => EmailAddrInfo.fromMap(e)))
          : []);

  Map<String, dynamic> toMap() => {
        'id': id,
        if (emailAddresses.isNotEmpty) 'e': emailAddresses.map((e) => e.toMap()).toList(),
      };
}
