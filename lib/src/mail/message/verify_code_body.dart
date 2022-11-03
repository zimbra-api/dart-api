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

  factory VerifyCodeBody.fromMap(Map<String, dynamic> data) => VerifyCodeBody(
      response: data['VerifyCodeResponse'] != null ? VerifyCodeResponse.fromMap(data['VerifyCodeResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'VerifyCodeRequest': request!.toMap(),
      };
}
