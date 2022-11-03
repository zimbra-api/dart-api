// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'distribution_list_action_request.dart';
import 'distribution_list_action_response.dart';

class DistributionListActionBody extends SoapBody {
  DistributionListActionBody(
      {DistributionListActionRequest? request, DistributionListActionResponse? response, super.fault})
      : super(request: request, response: response);

  factory DistributionListActionBody.fromMap(Map<String, dynamic> data) => DistributionListActionBody(
      response: data['DistributionListActionResponse'] != null
          ? DistributionListActionResponse.fromMap(data['DistributionListActionResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  DistributionListActionRequest? get distributionListActionRequest => request as DistributionListActionRequest?;

  DistributionListActionResponse? get distributionListActionResponse => response as DistributionListActionResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'DistributionListActionRequest': request!.toMap(),
      };
}
