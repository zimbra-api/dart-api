// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_rights_request.dart';
import 'get_rights_response.dart';

class GetRightsBody extends SoapBody {
  GetRightsBody({GetRightsRequest? request, GetRightsResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetRightsBody.fromJson(Map<String, dynamic> json) => GetRightsBody(
      response: json['GetRightsResponse'] != null ? GetRightsResponse.fromJson(json['GetRightsResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetRightsRequest? get getRightsRequest => request as GetRightsRequest;

  GetRightsResponse? get getRightsResponse => response as GetRightsResponse;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetRightsRequest': request!.toJson(),
      };
}
