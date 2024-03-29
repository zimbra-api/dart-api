// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/zimlet_presence.dart';

class AccountZimletContext {
  final String zimletBaseUrl;

  final int? zimletPriority;

  final ZimletPresence? zimletPresence;

  const AccountZimletContext(
    this.zimletBaseUrl, {
    this.zimletPriority,
    this.zimletPresence,
  });

  factory AccountZimletContext.fromMap(
    Map<String, dynamic> data,
  ) =>
      AccountZimletContext(
        data['baseUrl'],
        zimletPriority: int.tryParse(data['priority']?.toString() ?? ''),
        zimletPresence: ZimletPresence.values.firstWhere(
          (presence) => presence.name == data['presence'],
          orElse: () => ZimletPresence.enabled,
        ),
      );

  Map<String, dynamic> toMap() => {
        'baseUrl': zimletBaseUrl,
        if (zimletPriority != null) 'priority': zimletPriority,
        if (zimletPresence != null) 'presence': zimletPresence!.name,
      };
}
