// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/license_status.dart';

import 'license_attr.dart';

/// License information
class LicenseInfo {
  /// License status
  final LicenseStatus status;

  /// License attributes
  final List<LicenseAttr> attrs;

  LicenseInfo(this.status, {this.attrs = const []});

  factory LicenseInfo.fromJson(Map<String, dynamic> json) => LicenseInfo(
      LicenseStatus.values.firstWhere(
        (status) => status.name == json['status'],
        orElse: () => LicenseStatus.ok,
      ),
      attrs: (json['attr'] is Iterable)
          ? List.from((json['attr'] as Iterable).map<LicenseAttr>((attr) => LicenseAttr.fromJson(attr)))
          : []);

  Map<String, dynamic> toJson() => {
        'status': status.name,
        if (attrs.isNotEmpty) 'attr': attrs.map((attr) => attr.toJson()).toList(),
      };
}
