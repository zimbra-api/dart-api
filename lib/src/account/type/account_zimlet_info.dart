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

  AccountZimletInfo({this.zimletContext, this.zimlet, this.zimletConfig});

  factory AccountZimletInfo.fromJson(Map<String, dynamic> json) => AccountZimletInfo(
      zimletContext: (json['zimletContext'] is Map) ? AccountZimletContext.fromJson(json['zimletContext']) : null,
      zimlet: (json['zimlet'] is Map) ? AccountZimletDesc.fromJson(json['zimlet']) : null,
      zimletConfig: (json['zimletConfig'] is Map) ? AccountZimletConfigInfo.fromJson(json['zimletConfig']) : null);

  Map<String, dynamic> toJson() => {
        if (zimletContext != null) 'zimletContext': zimletContext!.toJson(),
        if (zimlet != null) 'zimlet': zimlet!.toJson(),
        if (zimletConfig != null) 'zimletConfig': zimletConfig!.toJson(),
      };
}
