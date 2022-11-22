// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../enum/distribution_list_by.dart';

class DistributionListSelector {
  final DistributionListBy by;

  final String value;

  const DistributionListSelector(this.by, this.value);

  factory DistributionListSelector.fromMap(Map<String, dynamic> data) => DistributionListSelector(
        DistributionListBy.values.firstWhere(
          (by) => by.name == data['by'],
          orElse: () => DistributionListBy.name,
        ),
        data['_content'] ?? '',
      );

  Map<String, dynamic> toMap() => {
        'by': by.name,
        '_content': value,
      };
}
