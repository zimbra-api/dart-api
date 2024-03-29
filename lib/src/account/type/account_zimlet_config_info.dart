// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'account_zimlet_global_config_info.dart';
import 'account_zimlet_host_config_info.dart';

class AccountZimletConfigInfo {
  /// Zimlet name
  final String? name;

  /// Version string
  final String? version;

  /// Zimlet description
  final String? description;

  /// Zimlet extension
  final String? extension;

  /// Zimlet target
  final String? target;

  /// Zimlet label
  final String? label;

  /// Zimlet global configuration information
  final AccountZimletGlobalConfigInfo? global;

  /// Zimlet host configuration information
  final AccountZimletHostConfigInfo? host;

  const AccountZimletConfigInfo({
    this.name,
    this.version,
    this.description,
    this.extension,
    this.target,
    this.label,
    this.global,
    this.host,
  });

  factory AccountZimletConfigInfo.fromMap(
    Map<String, dynamic> data,
  ) =>
      AccountZimletConfigInfo(
        name: data['name'],
        version: data['version'],
        description: data['description'],
        extension: data['extension'],
        target: data['target'],
        label: data['label'],
        global: data['global'] is Map
            ? AccountZimletGlobalConfigInfo.fromMap(
                data['global'],
              )
            : null,
        host: data['host'] is Map
            ? AccountZimletHostConfigInfo.fromMap(
                data['host'],
              )
            : null,
      );

  Map<String, dynamic> toMap() => {
        if (name != null) 'name': name,
        if (version != null) 'version': version,
        if (description != null) 'description': description,
        if (extension != null) 'extension': extension,
        if (target != null) 'target': target,
        if (label != null) 'label': label,
        if (global != null) 'global': global!.toMap(),
        if (host != null) 'host': host!.toMap(),
      };
}
