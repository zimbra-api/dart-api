// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'distribution_list_grantee_info.dart';

class DistributionListRightInfo {
  final String right;

  final List<DistributionListGranteeInfo> grantees;

  DistributionListRightInfo(this.right, {this.grantees = const <DistributionListGranteeInfo>[]});

  factory DistributionListRightInfo.fromJson(Map<String, dynamic> json) {
    final info = DistributionListRightInfo(json['right']);

    if (json['grantee'] != null && json['grantee'] is Iterable) {
      final grantees = json['grantee'] as Iterable;
      for (final grantee in grantees) {
        info.grantees.add(DistributionListGranteeInfo.fromJson(grantee));
      }
    }

    return info;
  }

  Map<String, dynamic> toJson() => {
        'right': right,
        if (grantees.isNotEmpty) 'grantee': grantees.map((grantee) => grantee.toJson()),
      };
}
