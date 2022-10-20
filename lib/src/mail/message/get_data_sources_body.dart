// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_data_sources_request.dart';
import 'get_data_sources_response.dart';

class GetDataSourcesBody extends SoapBody {
  GetDataSourcesBody({GetDataSourcesRequest? request, GetDataSourcesResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetDataSourcesBody.fromJson(Map<String, dynamic> json) => GetDataSourcesBody(
      response: json['GetDataSourcesResponse'] != null
          ? GetDataSourcesResponse.fromJson(json['GetDataSourcesResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetDataSourcesRequest? get getDataSourcesRequest => request as GetDataSourcesRequest?;

  GetDataSourcesResponse? get getDataSourcesResponse => response as GetDataSourcesResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetDataSourcesRequest': request!.toJson(),
      };
}
