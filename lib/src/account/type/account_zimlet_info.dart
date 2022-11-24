// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'account_zimlet_config_info.dart';
import 'account_zimlet_context.dart';
import 'account_zimlet_desc.dart';

class AccountZimletInfo {
  /// Zimlet context
  final AccountZimletContext? zimletContext;

  /// Zimlet description
  final AccountZimletDesc? zimlet;

  /// Zimlet config
  final AccountZimletConfigInfo? zimletConfig;

  const AccountZimletInfo({
    this.zimletContext,
    this.zimlet,
    this.zimletConfig,
  });

  factory AccountZimletInfo.fromMap(Map<String, dynamic> data) => AccountZimletInfo(
      zimletContext: (data['zimletContext'] is Map) ? AccountZimletContext.fromMap(data['zimletContext']) : null,
      zimlet: (data['zimlet'] is Map) ? AccountZimletDesc.fromMap(data['zimlet']) : null,
      zimletConfig: (data['zimletConfig'] is Map) ? AccountZimletConfigInfo.fromMap(data['zimletConfig']) : null);

  Map<String, dynamic> toMap() => {
        if (zimletContext != null) 'zimletContext': zimletContext!.toMap(),
        if (zimlet != null) 'zimlet': zimlet!.toMap(),
        if (zimletConfig != null) 'zimletConfig': zimletConfig!.toMap(),
      };
}
