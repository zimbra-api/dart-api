// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_account_distribution_lists_request.dart';
import 'get_account_distribution_lists_response.dart';

class GetAccountDistributionListsBody extends SoapBody {
  GetAccountDistributionListsBody(
      {GetAccountDistributionListsRequest? request, GetAccountDistributionListsResponse? response, SoapFault? fault})
      : super(request: request, response: response, fault: fault);

  factory GetAccountDistributionListsBody.fromJson(Map<String, dynamic> json) => GetAccountDistributionListsBody(
      response: json['GetAccountDistributionListsResponse'] != null
          ? GetAccountDistributionListsResponse.fromJson(json['GetAccountDistributionListsResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetAccountDistributionListsRequest? get getAccountDistributionListsRequest =>
      request as GetAccountDistributionListsRequest;

  GetAccountDistributionListsResponse? get getAccountDistributionListsResponse =>
      response as GetAccountDistributionListsResponse;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetAccountDistributionListsRequest': request!.toJson(),
      };
}
