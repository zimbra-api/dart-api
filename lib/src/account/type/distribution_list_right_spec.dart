// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'distribution_list_grantee_selector.dart';

class DistributionListRightSpec {
  final String right;

  final List<DistributionListGranteeSelector> grantees;

  DistributionListRightSpec(this.right, {this.grantees = const []});

  Map<String, dynamic> toJson() => {
        'right': right,
        if (grantees.isNotEmpty) 'grantee': grantees.map((grantee) => grantee.toJson()).toList(),
      };
}
