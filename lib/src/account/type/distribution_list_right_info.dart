// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'distribution_list_grantee_info.dart';

class DistributionListRightInfo {
  final String right;

  final List<DistributionListGranteeInfo> grantees;

  DistributionListRightInfo(this.right, {this.grantees = const []});

  factory DistributionListRightInfo.fromJson(Map<String, dynamic> json) => DistributionListRightInfo(
        json['right'] ?? '',
        grantees: (json['grantee'] is Iterable)
            ? List.from((json['grantee'] as Iterable)
                .map<DistributionListGranteeInfo>((grantee) => DistributionListGranteeInfo.fromJson(grantee)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        'right': right,
        if (grantees.isNotEmpty) 'grantee': grantees.map((grantee) => grantee.toJson()).toList(),
      };
}
