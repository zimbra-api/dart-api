// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../enum/account_by.dart';

class AccountInfo {
  final AccountBy by;

  final bool? mountpointTraversed;

  final String value;

  const AccountInfo(this.by, this.value, {this.mountpointTraversed});

  factory AccountInfo.fromMap(Map<String, dynamic> data) => AccountInfo(
        AccountBy.values.firstWhere(
          (item) => item.name == data['by'],
          orElse: () => AccountBy.name,
        ),
        data['_content'] ?? '',
        mountpointTraversed: data['link'],
      );

  Map<String, dynamic> toMap() => {
        'by': by.toString(),
        if (mountpointTraversed != null) 'link': mountpointTraversed,
        '_content': value,
      };
}
