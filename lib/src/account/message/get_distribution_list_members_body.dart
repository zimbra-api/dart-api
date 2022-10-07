// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_distribution_list_members_request.dart';
import 'get_distribution_list_members_response.dart';

class GetDistributionListMembersBody extends SoapBody {
  GetDistributionListMembersBody(
      {GetDistributionListMembersRequest? request, GetDistributionListMembersResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetDistributionListMembersBody.fromJson(Map<String, dynamic> json) => GetDistributionListMembersBody(
      response: json['GetDistributionListMembersResponse'] != null
          ? GetDistributionListMembersResponse.fromJson(json['GetDistributionListMembersResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetDistributionListMembersRequest? get getDistributionListMembersRequest =>
      request as GetDistributionListMembersRequest?;

  GetDistributionListMembersResponse? get getDistributionListMembersResponse =>
      response as GetDistributionListMembersResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetDistributionListMembersRequest': request!.toJson(),
      };
}
