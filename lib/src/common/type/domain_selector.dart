// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/domain_by.dart';

class DomainSelector {
  final DomainBy by;

  final String value;

  DomainSelector(this.by, this.value);

  factory DomainSelector.fromJson(Map<String, dynamic> json) => DomainSelector(
        DomainBy.values.firstWhere(
          (item) => item.name == json['by'],
          orElse: () => DomainBy.name,
        ),
        json['_content'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'by': by.name,
        '_content': value,
      };
}
