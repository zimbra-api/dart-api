// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'end_session_request.dart';
import 'end_session_response.dart';

class EndSessionBody extends SoapBody {
  EndSessionBody({EndSessionRequest? request, EndSessionResponse? response, SoapFault? fault})
      : super(request: request, response: response, fault: fault);

  factory EndSessionBody.fromJson(Map<String, dynamic> json) => EndSessionBody(
      response: json['EndSessionResponse'] != null ? EndSessionResponse.fromJson(json['EndSessionResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  EndSessionRequest? get endSessionRequest => request as EndSessionRequest;

  EndSessionResponse? get endSessionResponse => response as EndSessionResponse;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'EndSessionRequest': request!.toJson(),
      };
}
