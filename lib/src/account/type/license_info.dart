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

  factory LicenseInfo.fromMap(Map<String, dynamic> data) => LicenseInfo(
      LicenseStatus.values.firstWhere(
        (status) => status.name == data['status'],
        orElse: () => LicenseStatus.ok,
      ),
      attrs: (data['attr'] is Iterable)
          ? List.from((data['attr'] as Iterable).map<LicenseAttr>((attr) => LicenseAttr.fromMap(attr)))
          : []);

  Map<String, dynamic> toMap() => {
        'status': status.name,
        if (attrs.isNotEmpty) 'attr': attrs.map((attr) => attr.toMap()).toList(),
      };
}
