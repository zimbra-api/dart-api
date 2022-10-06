// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'distribution_list_action_request.dart';
import 'distribution_list_action_response.dart';

class DistributionListActionBody extends SoapBody {
  DistributionListActionBody(
      {DistributionListActionRequest? request, DistributionListActionResponse? response, SoapFault? fault})
      : super(request: request, response: response, fault: fault);

  factory DistributionListActionBody.fromJson(Map<String, dynamic> json) => DistributionListActionBody(
      response: json['DistributionListActionResponse'] != null
          ? DistributionListActionResponse.fromJson(json['DistributionListActionResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  DistributionListActionRequest? get distributionListActionRequest => request as DistributionListActionRequest;

  DistributionListActionResponse? get distributionListActionResponse => response as DistributionListActionResponse;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'DistributionListActionRequest': request!.toJson(),
      };
}
