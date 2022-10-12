// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/hab_group_member.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

class GetDistributionListMembersResponse extends SoapResponse {
  final bool? more;

  final int? total;

  final List<String> dlMembers;

  final List<HABGroupMember> habGroupMembers;

  GetDistributionListMembersResponse(
      {this.more, this.total, this.dlMembers = const [], this.habGroupMembers = const []});

  factory GetDistributionListMembersResponse.fromJson(Map<String, dynamic> json) => GetDistributionListMembersResponse(
        more: json['more'],
        total: json['total'],
        dlMembers:
            (json['dlm'] is Iterable) ? List.from((json['dlm'] as Iterable).map<String>((dlm) => dlm['_content'])) : [],
        habGroupMembers: (json['groupMember'] is Iterable)
            ? List.from(
                (json['groupMember'] as Iterable).map<HABGroupMember>((member) => HABGroupMember.fromJson(member)))
            : [],
      );
}
