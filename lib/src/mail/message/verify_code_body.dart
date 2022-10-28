// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'verify_code_request.dart';
import 'verify_code_response.dart';

class VerifyCodeBody extends SoapBody {
  VerifyCodeBody({VerifyCodeRequest? request, VerifyCodeResponse? response, super.fault})
      : super(request: request, response: response);

  factory VerifyCodeBody.fromJson(Map<String, dynamic> json) => VerifyCodeBody(
      response: json['VerifyCodeResponse'] != null ? VerifyCodeResponse.fromJson(json['VerifyCodeResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  VerifyCodeRequest? get verifyCodeRequest => request as VerifyCodeRequest?;

  VerifyCodeResponse? get verifyCodeResponse => response as VerifyCodeResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'VerifyCodeRequest': request!.toJson(),
      };
}
