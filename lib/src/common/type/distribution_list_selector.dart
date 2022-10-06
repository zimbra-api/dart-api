// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/distribution_list_by.dart';

class DistributionListSelector {
  final DistributionListBy by;

  final String value;

  DistributionListSelector(this.by, this.value);

  factory DistributionListSelector.fromJson(Map<String, dynamic> json) {
    final by = DistributionListBy.values.firstWhere(
      (item) => item.name == json['by'],
      orElse: () => DistributionListBy.name,
    );
    return DistributionListSelector(by, json['_content'] ?? '');
  }

  Map<String, dynamic> toJson() => {
        'by': by.name,
        '_content': value,
      };
}
