// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_info_request.dart';
import 'get_info_response.dart';

class GetInfoBody extends SoapBody {
  GetInfoBody({GetInfoRequest? request, GetInfoResponse? response, SoapFault? fault})
      : super(request: request, response: response, fault: fault);

  factory GetInfoBody.fromJson(Map<String, dynamic> json) => GetInfoBody(
      response: json['GetInfoResponse'] != null ? GetInfoResponse.fromJson(json['GetInfoResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetInfoRequest? get getInfoRequest => request as GetInfoRequest;

  GetInfoResponse? get getInfoResponse => response as GetInfoResponse;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetInfoRequest': request!.toJson(),
      };
}
