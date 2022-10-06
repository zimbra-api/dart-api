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

  AccountZimletConfigInfo(
      {this.name, this.version, this.description, this.extension, this.target, this.label, this.global, this.host});

  factory AccountZimletConfigInfo.fromJson(Map<String, dynamic> json) => AccountZimletConfigInfo(
      name: json['name'],
      version: json['version'],
      description: json['description'],
      extension: json['extension'],
      target: json['target'],
      label: json['label'],
      global: json['global'] != null ? AccountZimletGlobalConfigInfo.fromJson(json['global']) : null,
      host: json['host'] != null ? AccountZimletHostConfigInfo.fromJson(json['host']) : null);

  Map<String, dynamic> toJson() => {
        if (name != null) 'name': name,
        if (version != null) 'version': version,
        if (description != null) 'description': description,
        if (extension != null) 'extension': extension,
        if (target != null) 'target': target,
        if (label != null) 'label': label,
        if (global != null) 'global': global!.toJson(),
        if (host != null) 'host': host!.toJson(),
      };
}
