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
      {this.more, this.total, this.dlMembers = const <String>[], this.habGroupMembers = const <HABGroupMember>[]});

  factory GetDistributionListMembersResponse.fromJson(Map<String, dynamic> json) {
    final response = GetDistributionListMembersResponse(more: json['more'], total: json['total']);

    if (json['dlm'] != null && json['dlm'] is Iterable) {
      final dlms = json['dlm'] as Iterable;
      for (final dlm in dlms) {
        response.dlMembers.add(dlm['_content']);
      }
    }

    if (json['groupMember'] != null && json['groupMember'] is Iterable) {
      final members = json['groupMember'] as Iterable;
      for (final member in members) {
        response.habGroupMembers.add(HABGroupMember.fromJson(member));
      }
    }

    return response;
  }
}
