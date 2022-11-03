// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'subscribe_distribution_list_request.dart';
import 'subscribe_distribution_list_response.dart';

class SubscribeDistributionListBody extends SoapBody {
  SubscribeDistributionListBody(
      {SubscribeDistributionListRequest? request, SubscribeDistributionListResponse? response, super.fault})
      : super(request: request, response: response);

  factory SubscribeDistributionListBody.fromMap(Map<String, dynamic> data) => SubscribeDistributionListBody(
      response: data['SubscribeDistributionListResponse'] != null
          ? SubscribeDistributionListResponse.fromMap(data['SubscribeDistributionListResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'SubscribeDistributionListRequest': request!.toMap(),
      };
}
