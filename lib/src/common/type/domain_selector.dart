// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/domain_by.dart';

class DomainSelector {
  final DomainBy by;

  final String value;

  const DomainSelector(this.by, this.value);

  factory DomainSelector.fromMap(Map<String, dynamic> data) => DomainSelector(
        DomainBy.values.firstWhere(
          (by) => by.name == data['by'],
          orElse: () => DomainBy.name,
        ),
        data['_content'] ?? '',
      );

  Map<String, dynamic> toMap() => {
        'by': by.name,
        '_content': value,
      };
}
