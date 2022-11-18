// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'account_zimlet_include.dart';
import 'account_zimlet_include_css.dart';
import 'account_zimlet_target.dart';
import 'zimlet_server_extension.dart';

class AccountZimletDesc {
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

  final ZimletServerExtension? serverExtension;

  final AccountZimletInclude? include;

  final AccountZimletIncludeCSS? includeCSS;

  final AccountZimletTarget? zimletTarget;

  const AccountZimletDesc({
    this.name,
    this.version,
    this.description,
    this.extension,
    this.target,
    this.label,
    this.serverExtension,
    this.include,
    this.includeCSS,
    this.zimletTarget,
  });

  factory AccountZimletDesc.fromMap(Map<String, dynamic> data) => AccountZimletDesc(
        name: data['name'],
        version: data['version'],
        description: data['description'],
        extension: data['extension'],
        target: data['target'],
        label: data['label'],
        serverExtension: data['serverExtension'] is Map ? ZimletServerExtension.fromMap(data['serverExtension']) : null,
        include: data['include'] is Map ? AccountZimletInclude.fromMap(data['include']) : null,
        includeCSS: data['includeCSS'] is Map ? AccountZimletIncludeCSS.fromMap(data['includeCSS']) : null,
        zimletTarget: data['zimletTarget'] is Map ? AccountZimletTarget.fromMap(data['zimletTarget']) : null,
      );

  Map<String, dynamic> toMap() => {
        if (name != null) 'name': name,
        if (version != null) 'version': version,
        if (description != null) 'description': description,
        if (extension != null) 'extension': extension,
        if (target != null) 'target': target,
        if (label != null) 'label': label,
        if (serverExtension != null) 'serverExtension': serverExtension!.toMap(),
        if (include != null) 'include': include!.toMap(),
        if (includeCSS != null) 'includeCSS': includeCSS!.toMap(),
        if (zimletTarget != null) 'zimletTarget': zimletTarget!.toMap(),
      };
}
