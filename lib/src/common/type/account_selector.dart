// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/account_by.dart';

class AccountSelector {
  final AcccountBy by;

  final String value;

  AccountSelector(this.by, this.value);

  factory AccountSelector.fromJson(Map<String, dynamic> json) {
    final by = AcccountBy.values.firstWhere(
      (item) => item.name == json['by'],
      orElse: () => AcccountBy.name,
    );
    return AccountSelector(by, json['_content'] ?? '');
  }

  Map<String, dynamic> toJson() => {
        'by': by.name,
        '_content': value,
      };
}
