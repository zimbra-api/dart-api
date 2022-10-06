// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_version_info_request.dart';
import 'get_version_info_response.dart';

class GetVersionInfoBody extends SoapBody {
  GetVersionInfoBody({GetVersionInfoRequest? request, GetVersionInfoResponse? response, SoapFault? fault})
      : super(request: request, response: response, fault: fault);

  factory GetVersionInfoBody.fromJson(Map<String, dynamic> json) => GetVersionInfoBody(
      response: json['GetVersionInfoResponse'] != null
          ? GetVersionInfoResponse.fromJson(json['GetVersionInfoResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetVersionInfoRequest? get getVersionInfoRequest => request as GetVersionInfoRequest;

  GetVersionInfoResponse? get getVersionInfoResponse => response as GetVersionInfoResponse;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetVersionInfoRequest': request!.toJson(),
      };
}
