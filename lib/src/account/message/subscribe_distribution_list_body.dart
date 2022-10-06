// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'subscribe_distribution_list_request.dart';
import 'subscribe_distribution_list_response.dart';

class SubscribeDistributionListBody extends SoapBody {
  SubscribeDistributionListBody(
      {SubscribeDistributionListRequest? request, SubscribeDistributionListResponse? response, SoapFault? fault})
      : super(request: request, response: response, fault: fault);

  factory SubscribeDistributionListBody.fromJson(Map<String, dynamic> json) => SubscribeDistributionListBody(
      response: json['SubscribeDistributionListResponse'] != null
          ? SubscribeDistributionListResponse.fromJson(json['SubscribeDistributionListResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  SubscribeDistributionListRequest? get subscribeDistributionListRequest => request as SubscribeDistributionListRequest;

  SubscribeDistributionListResponse? get subscribeDistributionListResponse =>
      response as SubscribeDistributionListResponse;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'SubscribeDistributionListRequest': request!.toJson(),
      };
}
