// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/zimlet_presence.dart';

class AccountZimletContext {
  final String zimletBaseUrl;

  final int? zimletPriority;

  final ZimletPresence? zimletPresence;

  AccountZimletContext(this.zimletBaseUrl, {this.zimletPriority, this.zimletPresence});

  factory AccountZimletContext.fromJson(Map<String, dynamic> json) {
    final zimletPresence = ZimletPresence.values.firstWhere(
      (item) => item.name == json['by'],
      orElse: () => ZimletPresence.enabled,
    );
    return AccountZimletContext(json['baseUrl'], zimletPriority: json['priority'], zimletPresence: zimletPresence);
  }

  Map<String, dynamic> toJson() => {
        'baseUrl': zimletBaseUrl,
        if (zimletPriority != null) 'priority': zimletPriority,
        if (zimletPresence != null) 'presence': zimletPresence!.name,
      };
}
