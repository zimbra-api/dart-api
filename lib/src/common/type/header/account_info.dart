// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/account_by.dart';

class AccountInfo {
  final AcccountBy by;

  final bool? mountpointTraversed;

  final String value;

  AccountInfo(this.by, this.value, {this.mountpointTraversed});

  factory AccountInfo.fromJson(Map<String, dynamic> json) {
    final by = AcccountBy.values.firstWhere(
      (item) => item.name == json['by'],
      orElse: () => AcccountBy.name,
    );
    return AccountInfo(by, json['_content'] ?? '', mountpointTraversed: json['link']);
  }

  Map<String, dynamic> toJson() => {
        'by': by.toString(),
        if (mountpointTraversed != null) 'link': mountpointTraversed,
        '_content': value,
      };
}
