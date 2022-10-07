// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_distribution_list_request.dart';
import 'get_distribution_list_response.dart';

class GetDistributionListBody extends SoapBody {
  GetDistributionListBody({GetDistributionListRequest? request, GetDistributionListResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetDistributionListBody.fromJson(Map<String, dynamic> json) => GetDistributionListBody(
      response: json['GetDistributionListResponse'] != null
          ? GetDistributionListResponse.fromJson(json['GetDistributionListResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetDistributionListRequest? get getDistributionListRequest => request as GetDistributionListRequest?;

  GetDistributionListResponse? get getDistributionListResponse => response as GetDistributionListResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetDistributionListRequest': request!.toJson(),
      };
}
