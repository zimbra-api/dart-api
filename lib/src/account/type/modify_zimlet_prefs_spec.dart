// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/zimlet_status.dart';

class ModifyZimletPrefsSpec {
  /// Zimlet name
  final String name;

  /// Zimlet presence setting
  /// Valid values : "enabled" | "disabled"
  final ZimletStatus presence;

  ModifyZimletPrefsSpec(this.name, this.presence);

  factory ModifyZimletPrefsSpec.fromJson(Map<String, dynamic> json) => ModifyZimletPrefsSpec(
      json['name'] ?? '',
      ZimletStatus.values.firstWhere(
        (item) => item.name == json['presence'],
        orElse: () => ZimletStatus.enabled,
      ));

  Map<String, dynamic> toJson() => {
        'name': name,
        'presence': presence.name,
      };
}
