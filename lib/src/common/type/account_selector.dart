// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/account_by.dart';

class AccountSelector {
  final AccountBy by;

  final String value;

  AccountSelector(this.by, this.value);

  factory AccountSelector.fromMap(Map<String, dynamic> data) => AccountSelector(
        AccountBy.values.firstWhere(
          (by) => by.name == data['by'],
          orElse: () => AccountBy.name,
        ),
        data['_content'] ?? '',
      );

  Map<String, dynamic> toMap() => {
        'by': by.name,
        '_content': value,
      };
}
