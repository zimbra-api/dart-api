// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_data_source_usage_request.dart';
import 'get_data_source_usage_response.dart';

class GetDataSourceUsageBody extends SoapBody {
  GetDataSourceUsageBody({GetDataSourceUsageRequest? request, GetDataSourceUsageResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetDataSourceUsageBody.fromJson(Map<String, dynamic> json) => GetDataSourceUsageBody(
      response: json['GetDataSourceUsageResponse'] != null
          ? GetDataSourceUsageResponse.fromJson(json['GetDataSourceUsageResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetDataSourceUsageRequest? get getDataSourceUsageRequest => request as GetDataSourceUsageRequest?;

  GetDataSourceUsageResponse? get getDataSourceUsageResponse => response as GetDataSourceUsageResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetDataSourceUsageRequest': request!.toJson(),
      };
}
