// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'create_distribution_list_request.dart';
import 'create_distribution_list_response.dart';

class CreateDistributionListBody extends SoapBody {
  CreateDistributionListBody(
      {CreateDistributionListRequest? request, CreateDistributionListResponse? response, super.fault})
      : super(request: request, response: response);

  factory CreateDistributionListBody.fromJson(Map<String, dynamic> json) => CreateDistributionListBody(
      response: json['CreateDistributionListResponse'] != null
          ? CreateDistributionListResponse.fromJson(json['CreateDistributionListResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  CreateDistributionListRequest? get createDistributionListRequest => request as CreateDistributionListRequest;

  CreateDistributionListResponse? get createDistributionListResponse => response as CreateDistributionListResponse;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'CreateDistributionListRequest': request!.toJson(),
      };
}
