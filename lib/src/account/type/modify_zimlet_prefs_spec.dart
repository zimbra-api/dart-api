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

  const ModifyZimletPrefsSpec(this.name, this.presence);

  factory ModifyZimletPrefsSpec.fromMap(Map<String, dynamic> data) => ModifyZimletPrefsSpec(
      data['name'] ?? '',
      ZimletStatus.values.firstWhere(
        (presence) => presence.name == data['presence'],
        orElse: () => ZimletStatus.enabled,
      ));

  Map<String, dynamic> toMap() => {
        'name': name,
        'presence': presence.name,
      };
}
