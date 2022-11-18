// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'distribution_list_grantee_info.dart';

class DistributionListRightInfo {
  final String right;

  final List<DistributionListGranteeInfo> grantees;

  const DistributionListRightInfo(this.right, {this.grantees = const []});

  factory DistributionListRightInfo.fromMap(Map<String, dynamic> data) => DistributionListRightInfo(
        data['right'] ?? '',
        grantees: (data['grantee'] is Iterable)
            ? (data['grantee'] as Iterable)
                .map<DistributionListGranteeInfo>((grantee) => DistributionListGranteeInfo.fromMap(grantee))
                .toList(growable: false)
            : const [],
      );

  Map<String, dynamic> toMap() => {
        'right': right,
        if (grantees.isNotEmpty) 'grantee': grantees.map((grantee) => grantee.toMap()).toList(growable: false),
      };
}
