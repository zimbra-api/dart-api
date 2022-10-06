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

  AccountZimletDesc(
      {this.name,
      this.version,
      this.description,
      this.extension,
      this.target,
      this.label,
      this.serverExtension,
      this.include,
      this.includeCSS,
      this.zimletTarget});

  factory AccountZimletDesc.fromJson(Map<String, dynamic> json) => AccountZimletDesc(
      name: json['name'],
      version: json['version'],
      description: json['description'],
      extension: json['extension'],
      target: json['target'],
      label: json['label'],
      serverExtension: json['serverExtension'] != null ? ZimletServerExtension.fromJson(json['serverExtension']) : null,
      include: json['include'] != null ? AccountZimletInclude.fromJson(json['include']) : null,
      includeCSS: json['includeCSS'] != null ? AccountZimletIncludeCSS.fromJson(json['includeCSS']) : null,
      zimletTarget: json['zimletTarget'] != null ? AccountZimletTarget.fromJson(json['zimletTarget']) : null);

  Map<String, dynamic> toJson() => {
        if (name != null) 'name': name,
        if (version != null) 'version': version,
        if (description != null) 'description': description,
        if (extension != null) 'extension': extension,
        if (target != null) 'target': target,
        if (label != null) 'label': label,
        if (serverExtension != null) 'serverExtension': serverExtension!.toJson(),
        if (include != null) 'include': include!.toJson(),
        if (includeCSS != null) 'includeCSS': includeCSS!.toJson(),
        if (zimletTarget != null) 'zimletTarget': zimletTarget!.toJson(),
      };
}
